package cn.oa.lzh.controller.archive;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.archive.ArchiveBorrowDao;
import cn.oa.lzh.model.dao.archive.ArchiveDao;
import cn.oa.lzh.model.dao.processdao.ProcessListDao;
import cn.oa.lzh.model.dao.processdao.ReviewedDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.archive.Archive;
import cn.oa.lzh.model.entity.archive.ArchiveBorrow;
import cn.oa.lzh.model.entity.process.AubUser;
import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.system.SystemStatusList;
import cn.oa.lzh.model.entity.system.SystemTypeList;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.process.ProcessService;

@Controller
@RequestMapping("/")
public class ArchiveController {

	@Autowired
	ArchiveDao aDao;
	@Autowired
	ArchiveBorrowDao abDao;
	@Autowired
	private TypeDao tyDao;
	@Autowired
	private StatusDao sDao;
	@Autowired
	private ProcessListDao proDao;
	@Autowired
	private ReviewedDao reDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ProcessService processService;

	/**
	 * 显示档案
	 */
	@RequestMapping("archivemanage")
	public String archiveManage(Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {

		Sort sort = new Sort(new Order(Direction.DESC, "inputTime"));
		Pageable p = new PageRequest(page, size);
		Page<Archive> archivePage = aDao.findByIsLock(1, p);
		List<Archive> archives = archivePage.getContent();
		model.addAttribute("page", archivePage);
		model.addAttribute("archives", archives);
		model.addAttribute("url", "archivemanagepaging");
		return "archive/archivemanage";
	}

	/**
	 * 条件模糊查询档案
	 */
	@RequestMapping("archivemanagepaging")
	public String prisionSearch(
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "archivesearch", required = false) String archivesearch) {
		System.out.println("条件查询");
		Sort sort = new Sort(new Order(Direction.DESC, "inputTime"));
		Pageable p = new PageRequest(page, size, sort);
		Page<Archive> archivePage = null;
		System.out.println("传入条件：" + archivesearch);
		if (StringUtil.isEmpty(archivesearch)) {
			archivePage = aDao.findByIsLock(1, p);
		} else {
			archivePage = aDao.findNameLike(archivesearch, p);
		}
		List<Archive> archivePageList = archivePage.getContent();
		System.out.println(archivePageList.toString());
		model.addAttribute("page", archivePage);
		model.addAttribute("archives", archivePageList);
		model.addAttribute("url", "archivemanagepaging");
		return "archive/archivemanagepaging";
	}

	/**
	 * 回显档案编辑页
	 */
	@RequestMapping(value = "archiveedit", method = RequestMethod.GET)
	public String editArchive(
			@RequestParam(value = "archiveId", required = false) Long archiveId,
			Model model) {
		System.out.println("修改的档案编号：" + archiveId);
		if (archiveId != null) {
			Archive archive = aDao.findOne(archiveId);
			model.addAttribute("archive", archive);
		}
		return "archive/editarchive";
	}

	/**
	 * 添加 编辑文档信息
	 */
	@RequestMapping(value = "archiveedit", method = RequestMethod.POST)
	public String editPrisionPost(Archive archive, Model model) {
		System.out.println("档案ID" + archive.getArchId());
		if (archive.getArchId() == null) {
			archive.setIsLock(1);
			aDao.save(archive);
		} else {
			Archive a = aDao.findOne(archive.getArchId());
			a.setTitle(archive.getTitle());
			a.setSubtitle(archive.getSubtitle());
			a.setClassno(archive.getClassno());
			a.setRoomno(archive.getRoomno());
			a.setTotelno(archive.getTotelno());
			a.setMinino(archive.getMinino());
			a.setEntityno(archive.getEntityno());
			a.setArchno(archive.getArchno());
			a.setRetention(archive.getRetention());
			a.setSecurityLevel(archive.getSecurityLevel());
			a.setNote(archive.getNote());
			a.setFirstResp(archive.getFirstResp());
			a.setOtherResp(archive.getOtherResp());
			a.setPage(archive.getPage());
			a.setNorm(archive.getNorm());
			a.setKeyword(archive.getKeyword());
			a.setInputTime(archive.getInputTime());
			aDao.save(a);
		}
		model.addAttribute("success", 1);
		return "redirect:/archivemanage";
	}

	/**
	 * 删除文档
	 */
	@RequestMapping("archivedelete")
	public String deleteArchive(
			@RequestParam(value = "archiveId", required = false) Long archiveId,
			Model model) {
		Archive archive = aDao.findOne(archiveId);
		archive.setIsLock(0);
		aDao.save(archive);
		model.addAttribute("success", 1);
		return "redirect:/archivemanage";
	}

	/**
	 * 申请借调档案
	 */
	@RequestMapping("borrowarchive")
	public String borrowArchive(Model model,
			@SessionAttribute("userId") Long userId,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		processService.index(model, userId, page, size);
		return "archive/borrowarchive";
	}

	/**
	 * 提交借调申请
	 */
	@RequestMapping("submitapply")
	public String submitApply(HttpServletRequest request,
			@Valid ArchiveBorrow archiveBorrow,
			@SessionAttribute("userId") Long userId, Model model)
			throws IllegalStateException, IOException {

		User user = userDao.findOne(userId);
		User auditor = userDao.findByUserName(archiveBorrow.getAuditor());
		Long roleId = user.getRole().getRoleId();// 申请人角色ID
		Long fatherId = user.getFatherId(); // 获取上级ID
		Long auditorId = auditor.getUserId(); // 获取审核人ID
		String val = request.getParameter("val");
		if (roleId > 1 && fatherId == auditorId) {
			ProcessList pro = archiveBorrow.getProId();
			processService.saveArchApply(pro, val, user, auditor.getUserName(),
					archiveBorrow.getTitle());
			abDao.save(archiveBorrow);
			processService.saveVerify(auditor, pro);

		} else {
			return "common/proce";
		}
		return "redirect:/myarchives";

	}

	/**
	 * 我的提交
	 */
	@RequestMapping("myarchives")
	public String myArchive(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		
		System.out.println("当前用户Id：" + userId);
		Pageable p = new PageRequest(page, size);
		// 通过用户Id去查询流程信息
		Page<ProcessList> pageList = proDao.findArchByuserId(userId, p);
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
		model.addAttribute("url", "applyar");
		return "archive/myarchive";
	}
	
	@RequestMapping("applyar")
	public String applyar(@SessionAttribute("userId") Long userId, Model model,
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
			pagelist = proDao.findArchByuserId(userId, pa);
		} else if (!Objects.isNull(status)) {
			// 根据状态和申请人查找流程
			pagelist = proDao.findArchByuserIdandstatus(userId,
					status.getStatusId(), pa);
			model.addAttribute("sort", "&val=" + val);
		} else {
			// 根据审核人，类型，标题模糊查询
			pagelist = proDao.findArchByuserIdandstr(userId, val, pa);
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
		model.addAttribute("url", "applyar");
		return "archive/managetable";
	}
	
    /**
     *  借调审核
     */
	@RequestMapping("verifyarchives")
	public String verifyArchives(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("审核用户ID：" + userId);
		User user = userDao.findOne(userId);
		System.out.println("用户信息：" + user);
		Page<AubUser> pageList = processService.verifyArch(user, page, size, null,model);
		List<Map<String, Object>> proList = processService.verifyData(pageList, user);
		System.out.println("审核数据" + proList);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "auditorar");
		return "archive/verifyarchives";
	}
	
	@RequestMapping("auditorar")
	public String auditorar(@SessionAttribute("userId") Long userId,
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
		Page<AubUser> pageList = processService.verifyArch(user, page, size,
				val, model);
		List<Map<String, Object>> proList = processService.verifyData(pageList,
				user);
		System.out.println("审核数据" + proList);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "auditorar");
		return "archive/verify";
	}
	
}
