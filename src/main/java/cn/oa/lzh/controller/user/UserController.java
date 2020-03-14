package cn.oa.lzh.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.oa.lzh.model.dao.roledao.RoleDao;
import cn.oa.lzh.model.dao.user.DeptDao;
import cn.oa.lzh.model.dao.user.PositionDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.role.Role;
import cn.oa.lzh.model.entity.user.Dept;
import cn.oa.lzh.model.entity.user.Position;
import cn.oa.lzh.model.entity.user.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.util.StringUtil;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

@Controller
@RequestMapping("/")
public class UserController {

	@Autowired
    UserDao udao;
	@Autowired
    DeptDao ddao;
	@Autowired
    PositionDao pdao;
	@Autowired
    RoleDao rdao;

	// 在线用户页面
	@RequestMapping("userlogmanage")
	public String userlogmanage() {
		return "user/userlogmanage";
	}

	@RequestMapping("usermanage")
	public String usermanage(Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		//优先按照部门排序
		Sort sort = new Sort(new Order(Direction.ASC, "dept"));
		Pageable pa = new PageRequest(page, size, sort);
		//分页无条件查询  显示所有数据  参数0表示 没有条件  
		Page<User> userspage = udao.findByIsLock(0, pa);
		List<User> users = userspage.getContent();
		model.addAttribute("users", users);
		model.addAttribute("page", userspage);
		model.addAttribute("url", "usermanagepaging");
		return "user/usermanage";
	}
    //用户管理数据显示
	@RequestMapping("usermanagepaging")
	public String userPaging(
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "usersearch", required = false) String usersearch) {
		Sort sort = new Sort(new Order(Direction.ASC, "dept"));
		Pageable pa = new PageRequest(page, size, sort);
		Page<User> userspage = null;
		if (StringUtil.isEmpty(usersearch)) {
			userspage = udao.findByIsLock(0, pa);
		} else {
			System.out.println(usersearch);
			userspage = udao.findnamelike(usersearch, pa);
		}
		List<User> users = userspage.getContent();
		model.addAttribute("users", users);
		model.addAttribute("page", userspage);
		model.addAttribute("url", "usermanagepaging");

		return "user/usermanagepaging";
	}
    //回显用户编辑信息  用户信息  回显到下拉列表：部门  角色  职位  
	@RequestMapping(value = "useredit", method = RequestMethod.GET)
	public String usereditget(
			@RequestParam(value = "userid", required = false) Long userid,
			Model model) {
		if (userid != null) {
			User user = udao.findOne(userid);
			model.addAttribute("where", "xg");
			model.addAttribute("user", user);
		}
		List<Dept> depts = (List<Dept>) ddao.findAll();
		List<Position> positions = (List<Position>) pdao.findAll();
		List<Role> roles = (List<Role>) rdao.findAll();
		model.addAttribute("depts", depts);
		model.addAttribute("positions", positions);
		model.addAttribute("roles", roles);
		return "user/edituser";
	}

	//执行修改操作  回显操作的回参作为该接口入参
	@RequestMapping(value = "useredit", method = RequestMethod.POST)
	public String usereditpost(
			User user,
			@RequestParam("deptid") Long deptid,
			@RequestParam("positionid") Long positionid,
			@RequestParam("roleid") Long roleid,
			@RequestParam(value = "isbackpassword", required = false) boolean isbackpassword,
			Model model) throws PinyinException {
		System.out.println(user);
		System.out.println(deptid);
		System.out.println(positionid);
		System.out.println(roleid);
		Dept dept = ddao.findOne(deptid);
		Position position = pdao.findOne(positionid);
		Role role = rdao.findOne(roleid);
		if (user.getUserId() == null) {  //???
			String pinyin = PinyinHelper.convertToPinyinString(
					user.getUserName(), "", PinyinFormat.WITHOUT_TONE);
			user.setPinyin(pinyin);
			user.setPassword("123456");
			user.setDept(dept);
			user.setRole(role);
			user.setPosition(position);
			user.setFatherId(dept.getDeptmanager());
			udao.save(user);
		} else {
			User user2 = udao.findOne(user.getUserId());
			user2.setUserTel(user.getUserTel());
			user2.setRealName(user.getRealName());
			user2.setEamil(user.getEamil());
			user2.setAddress(user.getAddress());
			user2.setUserEdu(user.getUserEdu());
			user2.setSchool(user.getSchool());
			user2.setIdCard(user.getIdCard());
			user2.setBank(user.getBank());
			user2.setThemeSkin(user.getThemeSkin());
			user2.setSalary(user.getSalary());
			user2.setFatherId(dept.getDeptmanager());
			if (isbackpassword) {
				user2.setPassword("123456");
			}
			user2.setDept(dept);
			user2.setRole(role);
			user2.setPosition(position);
			udao.save(user2);
		}

		model.addAttribute("success", 1);
		return "/usermanage";
	}

	//状态为1的时候，删除状态，但保留客户信息在库中  查询的时候就查islock=0的
	@RequestMapping("deleteuser")
	public String deleteuser(@RequestParam("userid") Long userid, Model model) {
		User user = udao.findOne(userid);
		user.setIsLock(1);
		udao.save(user);
		model.addAttribute("success", 1);
		return "/usermanage";
	}

	@RequestMapping("useronlyname")
	public @ResponseBody boolean useronlyname(
			@RequestParam("username") String username) {
		System.out.println(username);
		User user = udao.findByUserName(username);
		System.out.println(user);
		if (user == null) {
			return true;
		}
		return false;
	}

	@RequestMapping("selectdept")
	public @ResponseBody List<Position> selectdept(
			@RequestParam("selectdeptid") Long deptid) {
		return pdao.findByDeptidAndNameNotLike(deptid, "%经理");
	}
	
	/**
	 * 用户姓名查找
	 */
	@RequestMapping("names")
	public String serch(Model model,HttpServletRequest req, @SessionAttribute("userId") Long userId,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		Pageable pa=new PageRequest(page, size);
		String name=null;
		String qufen=null;
		Page<User> pageuser=null;
		List<User> userlist=null;
		
		if(!StringUtil.isEmpty(req.getParameter("title"))){
			name=req.getParameter("title").trim();
		}
		if(!StringUtil.isEmpty(req.getParameter("qufen"))){
			qufen=req.getParameter("qufen").trim();
			
			System.out.println("111");
			if(StringUtil.isEmpty(name)){
				// 查询部门下面的员工
				pageuser = udao.findByFatherId(userId,pa);
			}else{
				// 查询名字模糊查询员工
				pageuser = udao.findbyFatherId(name,userId,pa);
			}
			
		}else{
			System.out.println("222");
			if(StringUtil.isEmpty(name)){
				//查看用户并分页
				pageuser=udao.findAll(pa);
			}else{
				pageuser=udao.findbyUserNameLike(name, pa);
			}
		}
		userlist=pageuser.getContent();
		// 查询部门表
		Iterable<Dept> deptlist = ddao.findAll();
		// 查职位表
		Iterable<Position> poslist = pdao.findAll();
		model.addAttribute("emplist", userlist);
		model.addAttribute("page", pageuser);
		model.addAttribute("deptlist", deptlist);
		model.addAttribute("poslist", poslist);
		model.addAttribute("url", "names");	
		return "common/recivers";
	}
}
