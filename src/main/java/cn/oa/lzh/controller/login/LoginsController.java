package cn.oa.lzh.controller.login;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.user.LoginRecord;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.user.UserLongRecordService;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;



@Controller
@RequestMapping("/")
public class LoginsController {
	@Autowired
	private UserDao uDao;
	@Autowired
	UserLongRecordService ulService;
	//类似token  
	public static final String CAPTCHA_KEY = "session_captcha";
    public static final int errorCishi=1;
	public static final Map<String,Object> loginErrMap = new HashMap<String,Object>();
	private Random rnd = new Random();
	
	/**
	 * 登录界面的显示
	 * @return
	 */
	@RequestMapping(value="logins",method=RequestMethod.GET)
	public String login(){
		return "login/login";
	}
	
	@RequestMapping("loginout")
	public String loginout(HttpSession session){
		session.removeAttribute("userId");
		return "redirect:/logins";
	}
	
	/**
	 * 登录检查；
	 * 1、根据(用户名或电话号码)+密码进行查找
	 * 2、判断使用是否被冻结；
	 * @return
	 * @throws UnknownHostException 
	 */
	@RequestMapping(value="logins",method = RequestMethod.POST)
	public String loginCheck(HttpSession session,HttpServletRequest req,Model model) throws UnknownHostException{
		String userName=req.getParameter("userName").trim();
		String password=req.getParameter("password");
		String ca=req.getParameter("code").toLowerCase();
		String sesionCode = (String) req.getSession().getAttribute(CAPTCHA_KEY);
		Map <String,Object> map=new HashMap<>();
		//新加需求秘密错误5次锁定10分钟
		model.addAttribute("userName", userName);
		JSONObject errMessage = (JSONObject)loginErrMap.get("err"+userName);

		if(errMessage!=null&&"4".equals(errMessage.get("cishu").toString())){
			model.addAttribute("errormess", "账户被锁定!请十分钟后再试");
			req.setAttribute("errormess","验证码输入错误!请十分钟后再试");
			return "login/login";
		}
		loginErrMap.get("err"+userName);
		if(!ca.equals(sesionCode.toLowerCase())){

			model.addAttribute("errormess", "验证码输入错误!");
			req.setAttribute("errormess","验证码输入错误!");
			return "login/login";
		}
		/*
		 * 将用户名分开查找；用户名或者电话号码；
		 * */
		User user=uDao.findOneUser(userName, password);
		if(Objects.isNull(user)){
			if(checkCishubyName(userName)==true){
				model.addAttribute("errormess", "账号或密码错误!");
				return "login/login";
			}
			model.addAttribute("errormess", "账户被锁定10分钟");
			return "login/login";
		}
		System.out.println("是否被锁："+user.getIsLock());
		if(user.getIsLock()==1){
			System.out.println("账号已被冻结!");
			model.addAttribute("errormess", "账号已被冻结!");
			return "login/login";
		}
		Object sessionId=session.getAttribute("userId");
		System.out.println(user);
		if(sessionId==user.getUserId()){
			System.out.println("当前用户已经登录了；不能重复登录");
			model.addAttribute("hasmess", "当前用户已经登录了；不能重复登录");
			session.setAttribute("thisuser", user);
			return "login/login";
		}else{
			session.setAttribute("userId", user.getUserId());
			Browser browser = UserAgent.parseUserAgentString(req.getHeader("User-Agent")).getBrowser();
			Version version = browser.getVersion(req.getHeader("User-Agent"));
			//获取浏览器名字
			String info = browser.getName() + "/" + version.getVersion();
			//获取ip地址
			String ip=InetAddress.getLocalHost().getHostAddress();
			/*新增登录记录*/
			ulService.save(new LoginRecord(ip, new Date(), info, user));
		}
		return "redirect:/index";
	}
	public boolean checkCishubyName(String userName){
		JSONObject errMessage = (JSONObject)loginErrMap.get("err"+userName);
		if(errMessage == null){
			errMessage = new JSONObject();
			errMessage.put("cishu",1);
			errMessage.put("time",new Date());
			loginErrMap.put("err"+userName,errMessage);

		}else {
			Date thatTime = (Date) errMessage.get("time");
			long currentTime = System.currentTimeMillis();
			long diff = (currentTime - thatTime.getTime()) / 1000 / 60;
			if (diff > 10) {
				errMessage = new JSONObject();
				errMessage.put("cishu", 1);
				errMessage.put("time", new Date());
				loginErrMap.put("err" + userName, errMessage);

			} else {
				int cishu = (Integer) errMessage.get("cishu");
				if (cishu == 4) {
					return false;
				} else {
					cishu++;
					errMessage.put("cishu", cishu);
					errMessage.put("time", new Date());

				}
			}

		}
		return true;
	}
	@RequestMapping("handlehas")
	public String handleHas(HttpSession session){
		if(!StringUtils.isEmpty(session.getAttribute("thisuser"))){
			User user=(User) session.getAttribute("thisuser");
			System.out.println(user);
			session.removeAttribute("userId");
			session.setAttribute("userId", user.getUserId());
		}else{
			System.out.println("有问题！");
			return "login/login";
		}
		return "redirect:/index";
		
	}
	
	
	@RequestMapping("captcha")
	public void captcha(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		// 生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		
		// 生成图片
		int w = 135, h = 40;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

		// 将验证码存储在session以便登录时校验
		session.setAttribute(CAPTCHA_KEY, verifyCode.toLowerCase());
	}
	

}
