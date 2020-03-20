package cn.oa.lzh.controller.document;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.archive.ArchiveBorrowDao;
import cn.oa.lzh.model.dao.attendcedao.PrisionDao;
import cn.oa.lzh.model.dao.document.DocumentDao;
import cn.oa.lzh.model.dao.holiday.HolidayDao;
import cn.oa.lzh.model.dao.notedao.AttachmentDao;
import cn.oa.lzh.model.dao.processdao.ProcessListDao;
import cn.oa.lzh.model.dao.processdao.ReviewedDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.dao.user.UserService;
import cn.oa.lzh.model.entity.archive.ArchiveBorrow;
import cn.oa.lzh.model.entity.attendce.Prision;
import cn.oa.lzh.model.entity.document.Document;
import cn.oa.lzh.model.entity.holiday.Holiday;
import cn.oa.lzh.model.entity.note.Attachment;
import cn.oa.lzh.model.entity.process.AubUser;
import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.process.Reviewed;
import cn.oa.lzh.model.entity.system.SystemStatusList;
import cn.oa.lzh.model.entity.system.SystemTypeList;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.process.ProcessService;

@Controller
@RequestMapping("/")
public class DocumentController {

	@Autowired
	private TypeDao tyDao;
	@Autowired
	private StatusDao sDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private DocumentDao docDao;
	@Autowired
	private ProcessListDao proDao;
	@Autowired
	private ReviewedDao reDao;
	@Autowired
	private ArchiveBorrowDao abDao;
	@Autowired
	private HolidayDao hDao;
	@Autowired
	private ProcessService processService;
	@Autowired
	private AttachmentDao attDao;
	@Value("${attachment.roopath}")
	private String rootpath;

	/*
	 * 创建公文页
	 */
	@RequestMapping("createdocument")
	public String createDocument(Model model,
			@SessionAttribute("userId") Long userId,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {

		// List<SystemTypeList> typeList = tyDao.findByTypeModel("document");
		processService.index(model, userId, page, size);
		return "document/createdocument";
	}

	/*
	 * 上传公文申请
	 */
	@RequestMapping("uploadDocument")
	public String uploadDocument(
			@RequestParam("filePath") MultipartFile filePath,
			HttpServletRequest request, @Valid Document doc,
			@SessionAttribute("userId") Long userId, Model model)
			throws IllegalStateException, IOException {
		System.out.println("11111111" + doc.toString());
		User user = userDao.findOne(userId); // 公文起草人信息
		User auditor = userDao.findByUserName(doc.getAuditor()); // 审核人信息
		Long roleId = user.getRole().getRoleId(); // 申请人角色ID
		Long fatherId = user.getFatherId(); // 获取父级ID
		Long auditorId = auditor.getUserId(); // 审核人ID
		String val = request.getParameter("val");
		System.out.println("userId" + userId + "roleId:" + roleId + "fatherId:"
				+ fatherId + "auditorId:" + auditorId + "val:" + val);
		if (roleId > 1 && fatherId == auditorId) {
			ProcessList pro = doc.getProId();
			processService.saveProcessWithAttach(pro, val, user, filePath,
					auditor.getUserName(), doc.getTitle());
			docDao.save(doc);
			processService.saveVerify(auditor, pro);
		} else {
			return "common/proce";
		}
		return "redirect:/mydocument";
	}

	@RequestMapping("mydocument")
	public String myDocument(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("当前用户Id：" + userId);
		Pageable p = new PageRequest(page, size);
		// 通过用户Id去查询流程信息
		Page<ProcessList> pageList = proDao.findDocByuserId(userId, p);
		List<ProcessList> proList = pageList.getContent();
		// 查询流程状态
		Iterable<SystemStatusList> status = sDao.findByStatusModel("process");
		// 查询流程类型
		Iterable<SystemTypeList> type = tyDao.findByTypeModel("process");
		System.out.println("返回数据" + proList.toString() + status + type);
		model.addAttribute("statusname", status);
		model.addAttribute("typename", type);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "apply");
		return "document/mydocument";
	}

	/**
	 * 申请人查看流程条件查询
	 */
	@RequestMapping("apply")
	public String apply(@SessionAttribute("userId") Long userId, Model model,
			HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		Pageable pa = new PageRequest(page, size);
		String val = null;
		// 获取条件
		if (!StringUtil.isEmpty(req.getParameter("val"))) {
			val = req.getParameter("val");
		}
		Page<ProcessList> pagelist = null;
		List<ProcessList> prolist = null;
		SystemStatusList status = sDao.findByStatusModelAndStatusName(
				"process", val);
		if (StringUtil.isEmpty(val)) {
			// 空查询
			pagelist = proDao.findDocByuserId(userId, pa);
		} else if (!Objects.isNull(status)) {
			// 根据状态和申请人查找流程
			pagelist = proDao.findDocByuserIdandstatus(userId,
					status.getStatusId(), pa);
			model.addAttribute("sort", "&val=" + val);
		} else {
			// 根据审核人，类型，标题模糊查询
			pagelist = proDao.findDocByuserIdandstr(userId, val, pa);
			model.addAttribute("sort", "&val=" + val);
		}
		prolist = pagelist.getContent();
		Iterable<SystemStatusList> statusname = sDao
				.findByStatusModel("process");
		Iterable<SystemTypeList> typename = tyDao.findByTypeModel("process");
		model.addAttribute("typename", typename);
		model.addAttribute("page", pagelist);
		model.addAttribute("prolist", prolist);
		model.addAttribute("statusname", statusname);
		model.addAttribute("url", "apply");
		return "document/managetable";
	}

	/**
	 * 公文审核页
	 */
	@RequestMapping("verifydocument")
	public String verifyDocument(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("审核用户ID：" + userId);
		User user = userDao.findOne(userId);
		System.out.println("用户信息：" + user);
		Page<AubUser> pageList = processService.verifyDoc(user, page, size,
				null, model);
		List<Map<String, Object>> proList = processService.verifyData(pageList,
				user);
		System.out.println("审核数据" + proList);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "auditor");
		return "document/verifydocument";
	}
	
	@RequestMapping("auditor")
	public String auditor(@SessionAttribute("userId") Long userId,
			Model model,HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("审核用户ID：" + userId);
		User user = userDao.findOne(userId);
		System.out.println("用户信息：" + user);
		String val = null;
		if (!StringUtil.isEmpty(req.getParameter("val"))) {
			val = req.getParameter("val");
		}
		Page<AubUser> pageList = processService.verifyDoc(user, page, size,
				val, model);
		List<Map<String, Object>> proList = processService.verifyData(pageList,
				user);
		System.out.println("审核数据" + proList);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "auditor");
		return "document/verify";
	}

	/**
	 * 查看申请详情
	 */
	@RequestMapping("particular")
	public String particular(@SessionAttribute("userId") Long userId,
			Model model, HttpServletRequest req) {
		User user = userDao.findOne(userId);
		User audit = null; // 最终审核人
		// 获取该流程Id
		String id = req.getParameter("id");
		Long proId = Long.parseLong(id);
		String type = req.getParameter("typename");
		String name = null; // 存放当前用户角色
		Map<String, Object> map = new HashMap<String, Object>();
		ProcessList process = proDao.findOne(proId);
		// 判断当前用户是申请人还是审核人，如果相等就是申请人
		Boolean flag = process.getUserId().getUserId().equals(userId);
		if (!flag) {
			name = "审核";
		} else {
			name = "申请";
		}
		// 回显申请相关所有信息
		map = processService.apply(name, user, type, process);
		System.out.println("申请类型：" + type);
		if (("创建公文").equals(type)) {
			Document eve = docDao.findByProId(process);
			System.out.println("回显公文申请数据" + eve.toString());
			model.addAttribute("eve", eve);
			model.addAttribute("map", map);
			return "document/docserch";
		} else if (("申请借调档案").equals(type)) {
			ArchiveBorrow eve = abDao.findByProId(process);
			model.addAttribute("eve", eve);
			model.addAttribute("map", map);
			return "archive/archserch";
		} else if (("请假申请").equals(type)) {
			Holiday eve = hDao.findByProId(process);
			SystemTypeList hty = tyDao.findOne(eve.getTypeId());
			User u = userDao.findOne(eve.getHandUser().getUserId());
			model.addAttribute("eve", eve);
			model.addAttribute("map", map);
			model.addAttribute("hty", hty);
			model.addAttribute("u", u);
			return "holiday/holiserch";
		}
		return "/";
	}

	/**
	 * 进入审核页面
	 */
	@RequestMapping("auditing")
	public String auditing(@SessionAttribute("userId") Long userId,
			Model model, HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		// 获取当前用户信息
		User user = userDao.findOne(userId);
		// 获取流程Id 查出流程和审核信息
		Long proId = Long.parseLong(req.getParameter("id"));
		ProcessList process = proDao.findOne(proId);
		Reviewed reviewed = reDao.findByProIdAndUserId(process.getProcessId(),
				user);
		// 获得流程中的typeName 判定回显哪些相关数据
		String typename = process.getTypeNmae().trim();
		// 封装用户及其部门职位，回显通讯录
		processService.user(page, size, model);
		List<Map<String, Object>> list = processService.auditor(process);
		model.addAttribute("statusid", process.getStatusId());
		model.addAttribute("process", process);
		model.addAttribute("revie", list);
		model.addAttribute("size", list.size()); // 审核次数
		model.addAttribute("ustatusid", reviewed.getStatusId());
		model.addAttribute("positionid", user.getPosition().getId());
		model.addAttribute("typename", typename);
		return "document/audetail";
	}

	/**
	 * 流转或审核
	 */
	@RequestMapping("unsave")
	public String verify(@SessionAttribute("userId") Long userId, Model model,
			HttpServletRequest req, Reviewed reviewed) {
		System.out.println("前台传来的审核信息" + reviewed.toString());
		User user = userDao.findOne(userId);
		String name = null;
		String typename = req.getParameter("type");
		Long proId = Long.parseLong(req.getParameter("proId"));
		System.out.println("流程Id为" + proId);
		ProcessList process = proDao.findOne(proId);
		// 获得申请人信息
		User applyUser = userDao.findOne(process.getUserId().getUserId());
		System.out.println("申请人信息" + applyUser.toString());
	
		if (!StringUtil.isEmpty(req.getParameter("liuzhuan"))) {
			name = req.getParameter("liuzhuan");
		}
		System.out.println("审核状态：" + name);
		// 审核并流转
		if (!StringUtil.isEmpty(name)) {
			if(StringUtil.isEmpty(reviewed.getUsername())){
				return "index/error";
			}
			// 获取下一个审核人
			User userNext = userDao.findByUserName(reviewed.getUsername());
			System.out.println("下一个审核人信息：" + userNext);
			System.out.println("流程类型：" + typename);
			System.out.println("下一个审核人Id" + userNext.getUserId());
			if (("创建公文").equals(typename)) {
				if (userNext.getUserId().equals(7L)) {
					System.out.println("修改一级审核，创建二级审核，修改流程状态");
					processService.save(proId, user, reviewed, process,
							userNext);
				} else {
					model.addAttribute("error", "请选择行政办公室主任。");
					return "common/proce";
				}
			} else if (("申请借调档案").equals(typename)) {			
				if (userNext.getUserId().equals(22L)) {
					System.out.println("修改一级审核，创建二级审核，修改流程状态");
					processService.save(proId, user, reviewed, process,
							userNext);
				} else {
					model.addAttribute("error", "请选择档案科科长。");
					return "common/proce";
				}
			}
		} else {
			// 1.修改审核状态并添加建议
			Reviewed r = reDao.findByProIdAndUserId(proId, user);
			r.setAdvice(reviewed.getAdvice());
			r.setStatusId(reviewed.getStatusId());
			r.setReviewedTime(new Date());
			reDao.save(r);
			// 2.修改流程状态
			process.setStatusId(reviewed.getStatusId());
			proDao.save(process);
		}
		if ("创建公文".equals(typename)) {
			Document doc = docDao.findByProId(process);
			if (applyUser.getFatherId().equals(user.getUserId())) {
				doc.setManagerAdvice(reviewed.getAdvice());
				docDao.save(doc);
			}
			if (user.getPosition().getId().equals(7L)) {
				doc.setAdminAdvice(reviewed.getAdvice());
				docDao.save(doc);
			}
			return "redirect:/verifydocument";
		}else if("申请借调档案".equals(typename)){
			ArchiveBorrow arch = abDao.findByProId(process);
			if (applyUser.getFatherId().equals(user.getUserId())) {
				arch.setManagerAdvice(reviewed.getAdvice());
				abDao.save(arch);
			}
			if (user.getPosition().getId().equals(15L)) {
				arch.setArchAdvice(reviewed.getAdvice());
				abDao.save(arch);
			} 
			return "redirect:/verifyarchives";
		}else if("请假申请".equals(typename)){
			Holiday holiday = hDao.findByProId(process);
			if (applyUser.getFatherId().equals(user.getUserId())) {
				holiday.setManagerAdvice(reviewed.getAdvice());
				hDao.save(holiday);
			}
			return "redirect:/verifyholiday";
		}
		return "/";
	}

	/**
	 * 公文展示
	 */
	@RequestMapping("showdocument")
	public String showDocument(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("当前用户Id：" + userId);
		Pageable p = new PageRequest(page, size);
		// 通过用户Id去查询流程信息
		Page<ProcessList> pageList = proDao.findDocByStatus(p);
		List<ProcessList> proList = pageList.getContent();
		// 查询流程状态
		Iterable<SystemStatusList> status = sDao.findByStatusModel("process");
		model.addAttribute("statusname", status);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "showdocument");
		return "document/documentmanage";
	}

	/**
	 * 下载操作
	 */
	@RequestMapping("file")
	public void downFile(HttpServletResponse response,
			@RequestParam("fileid") Long fileid) {
		try {
			Attachment attachment = attDao.findOne(fileid);
			// 附件路径
			File file = new File(rootpath, attachment.getAttachmentPath());
			// 附件大小
			response.setContentLength(attachment.getAttachmentSize().intValue());
			// 附件类型
			response.setContentType(attachment.getAttachmentType());
			// 附件头文件
			response.setHeader("Content-Disposition",
					"attachment;filename="
							+ new String(attachment.getAttachmentName()
									.getBytes("UTF-8"), "ISO8859-1"));
			processService.writeFile(response, file);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@RequestMapping("show/**")
	public void image(Model model, HttpServletResponse response,
			@SessionAttribute("userId") Long userId, HttpServletRequest request)
			throws IOException {
		String startpath = new String(URLDecoder.decode(
				request.getRequestURI(), "utf-8"));
		String path = startpath.replace("/show", "");
		File f = new File(rootpath, path);
		System.out.println(f.getAbsolutePath());
		ServletOutputStream sos = response.getOutputStream();
		FileInputStream input = new FileInputStream(f.getPath());
		byte[] data = new byte[(int) f.length()];
		IOUtils.readFully(input, data);
		// 将文件流输出到浏览器
		IOUtils.write(data, sos);
		input.close();
		sos.close();
	}

}
