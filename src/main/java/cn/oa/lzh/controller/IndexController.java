package cn.oa.lzh.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import cn.oa.lzh.model.dao.attendcedao.AttendceDao;
import cn.oa.lzh.model.dao.notedao.DirectorDao;
import cn.oa.lzh.model.dao.roledao.RolepowerlistDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.taskdao.TaskuserDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.dao.user.UserLogDao;
import cn.oa.lzh.model.entity.attendce.Attends;
import cn.oa.lzh.model.entity.role.Rolemenu;
import cn.oa.lzh.model.entity.task.Taskuser;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.model.entity.user.UserLog;
import cn.oa.lzh.services.system.MenuSysService;

@Controller
@RequestMapping("/")
public class IndexController {
	@Autowired
	private MenuSysService menuService;
	@Autowired
	private StatusDao statusDao;
	@Autowired
	private TypeDao typeDao;
	@Autowired
	private UserDao uDao;
	@Autowired
	private AttendceDao attendceDao;
	@Autowired
	private DirectorDao directorDao;
	@Autowired
	private UserLogDao userLogDao;
	@Autowired
	private TaskuserDao  tadao;
	@Autowired
	private RolepowerlistDao rdao;

	@RequestMapping("index")
	public String index(HttpServletRequest req,Model model) {
		//获取当前用户session 如果丢失
		HttpSession session = req.getSession();
		if(StringUtils.isEmpty(session.getAttribute("userId"))){
			return "login/login";
		}
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		menuService.findMenuSys(req,user);
		List<Taskuser>  task=tadao.findByUserIdAndStatusId(user, 3);//新任务
		model.addAttribute("task", task.size());
		model.addAttribute("user", user);
		//展示用户操作记录 由于现在没有登陆 不能获取用户id
		List<UserLog> userLogs=userLogDao.findByUser(userId);
		req.setAttribute("userLogList", userLogs);
		return "index/index";
	}
	/**
	 * 菜单查找
	 * @param userId
	 * @param req
	 * @return
	 */
	@RequestMapping("menucha")
	public String menucha(HttpSession session, Model model,HttpServletRequest req){
		//获取当前用户id  并且查询对用用户信息
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		String val=null;
		//val是前端传来询条件（bootstrp设置的）
		if(!StringUtils.isEmpty(req.getParameter("val"))){
			val=req.getParameter("val");
		}
		//条件查询
		if(!StringUtils.isEmpty(val)){
			//查询所有父级菜单信息  parentid=0的  查找所有子级菜单可以用parentid！=0
			List<Rolemenu> oneMenuAll=rdao.findname(0L, user.getRole().getRoleId(), true, true, val);//找父菜单
			List<Rolemenu> twoMenuAll=null;
			for (int i = 0; i < oneMenuAll.size(); i++) {
				//查找所有父级菜单下的子级菜单
				twoMenuAll=rdao.findbyparentxianall(oneMenuAll.get(i).getMenuId(), user.getRole().getRoleId(), true, true);//找子菜单
			}
			req.setAttribute("oneMenuAll", oneMenuAll);
			req.setAttribute("twoMenuAll", twoMenuAll);
		}else{
			//非条件查询
			menuService.findMenuSys(req,user);
		}
		return "common/leftlists";
	}
	@RequestMapping("userlogs")
	public String usreLog(@SessionAttribute("userId") Long userId,HttpServletRequest req){
		List<UserLog> userLogs=userLogDao.findByUser(userId);
		req.setAttribute("userLogList", userLogs);
		return "user/userlog";
	}

	private void showalist(Model model, Long userId) {
		// 显示用户当天最新的记录
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowdate = sdf.format(date);
		Attends aList = attendceDao.findlastest(nowdate, userId);
		if (aList != null) {
			String type = typeDao.findname(aList.getTypeId());
			model.addAttribute("type", type);
		}
		model.addAttribute("alist", aList);
	}
	/**
	 * 控制面板主页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("test2")
	public String test2(HttpSession session, Model model, HttpServletRequest request) {
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		request.setAttribute("user", user);
		request.setAttribute("directornum", directorDao.count());
		return "systemcontrol/control";
	}
}
