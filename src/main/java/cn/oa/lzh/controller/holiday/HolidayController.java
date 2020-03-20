package cn.oa.lzh.controller.holiday;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.holiday.HolidayDao;
import cn.oa.lzh.model.dao.processdao.ProcessListDao;
import cn.oa.lzh.model.dao.processdao.ReviewedDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.holiday.Holiday;
import cn.oa.lzh.model.entity.process.AubUser;
import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.system.SystemStatusList;
import cn.oa.lzh.model.entity.system.SystemTypeList;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.process.ProcessService;



@Controller
@RequestMapping("/")
public class HolidayController {

	@Autowired
	private TypeDao tyDao;
	@Autowired
	private StatusDao sDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private HolidayDao hDao;
	@Autowired
	private ProcessListDao proDao;
	@Autowired
	private ReviewedDao reDao;
	@Autowired
	private ProcessService processService;
	
	@RequestMapping("applyholiday")
	public String createDocument(Model model,
			@SessionAttribute("userId") Long userId,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		List<SystemTypeList> overtype = tyDao.findByTypeModel("holiday");
		processService.index(model, userId, page, size);
		model.addAttribute("overtype", overtype); 
		return "holiday/applyholiday"; 
	}
	/**
	 * 编辑请假申请
	 */
	@RequestMapping("uploadholiday")
	public String uploadHoliday(
			HttpServletRequest request, @Valid Holiday holiday,
			@SessionAttribute("userId") Long userId, Model model)
			throws IllegalStateException, IOException {
		User user = userDao.findOne(userId); // 申请人信息
		User auditor = userDao.findByUserName(holiday.getAuditor()); // 审核人信息
		Long roleId = user.getRole().getRoleId(); // 申请人角色ID
		Long fatherId = user.getFatherId(); // 获取父级ID
		Long auditorId = auditor.getUserId(); // 审核人ID
		String val = request.getParameter("val");
		System.out.println("userId：" + userId + "roleId:" + roleId + "fatherId:"
				+ fatherId + "auditorId:" + auditorId + "val:" + val);
		if (roleId > 1 && fatherId == auditorId) {
			ProcessList pro = holiday.getProId();
			System.out.println();
			processService.saveArchApply(pro, val, user,auditor.getUserName(), user.getUserName()+"的请假申请");
			holiday.setHandUser(userDao.findByUserName(holiday.getHanduser()));
			hDao.save(holiday);
			processService.saveVerify(auditor, pro);
		} else {
			return "common/proce";
		}
		return "redirect:/myholiday";
	}
	
	
	
	/**
	 * 我的申请
	 */
	@RequestMapping("myholiday")
	public String myArchive(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		
		System.out.println("当前用户Id：" + userId);
		Pageable p = new PageRequest(page, size);
		// 通过用户Id去查询流程信息
		Page<ProcessList> pageList = proDao.findHoliByuserId(userId, p);
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
		model.addAttribute("url", "applyleave");
		return "holiday/myholiday";
	}
	
	@RequestMapping("applyleave")
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
			pagelist = proDao.findHoliByuserId(userId, pa);
		} else if (!Objects.isNull(status)) {
			// 根据状态和申请人查找流程
			pagelist = proDao.findHoliByuserIdandstatus(userId,
					status.getStatusId(), pa);
			model.addAttribute("sort", "&val=" + val);
		} else {
			// 根据审核人，类型，标题模糊查询
			pagelist = proDao.findHoliByuserIdandstr(userId, val, pa);
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
		model.addAttribute("url", "applyleave");
		return "holiday/managetable";
	}
	
	/**
     *  请假审核
     */
	@RequestMapping("verifyholiday")
	public String verifyArchives(@SessionAttribute("userId") Long userId,
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		System.out.println("审核用户ID：" + userId);
		User user = userDao.findOne(userId);
		System.out.println("用户信息：" + user);
		Page<AubUser> pageList = processService.verifyHoliday(user, page, size, null,model);
		List<Map<String, Object>> proList = processService.verifyData(pageList, user);
		System.out.println("审核数据" + proList);
		model.addAttribute("page", pageList);
		model.addAttribute("prolist", proList);
		model.addAttribute("url", "auditorleave");
		return "holiday/verifyarchives";
	}
	
	@RequestMapping("auditorleave")
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
		model.addAttribute("url", "auditorleave");
		return "holiday/verify";
	}
}
