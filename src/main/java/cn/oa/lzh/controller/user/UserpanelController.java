package cn.oa.lzh.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


import cn.oa.lzh.common.formValid.ResultVO;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.common.formValid.BindingResultVOUtil;
import cn.oa.lzh.common.formValid.MapToList;
import cn.oa.lzh.common.formValid.ResultEnum;
import cn.oa.lzh.model.dao.processdao.NotepaperDao;
import cn.oa.lzh.model.dao.user.DeptDao;
import cn.oa.lzh.model.dao.user.PositionDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.mail.Mailreciver;
import cn.oa.lzh.model.entity.process.Notepaper;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.user.NotepaperService;
/**
 * 主页面用户面板中的便签框  点击进入类似个人中心包含个人信息设置
 * @author ThinkPad
 *
 */
@Controller
@RequestMapping("/")
public class UserpanelController {
	@Autowired
	private UserDao udao;
	@Autowired
	private DeptDao ddao;
	@Autowired
	private PositionDao pdao;
	@Autowired
	private NotepaperDao ndao;
	@Autowired
	private NotepaperService nservice;
	
	@Value("${img.rootpath}")
	private String rootpath;
	
	@RequestMapping("userpanel")
	public String index(@SessionAttribute("userId") Long userId,Model model,HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		
		Pageable pa=new PageRequest(page, size);
		User user=null;
		if(!StringUtil.isEmpty((String) req.getAttribute("errormess"))){
			 user=(User) req.getAttribute("users");
			 req.setAttribute("errormess",req.getAttribute("errormess"));
		}
		else if(!StringUtil.isEmpty((String) req.getAttribute("success"))){
			user=(User) req.getAttribute("users"); 
			req.setAttribute("success","fds");
		}
		else{
			//找到这个用户
			user=udao.findOne(userId);
		}
		//找到部门名称
		String deptname=ddao.findname(user.getDept().getDeptId());
		//找到职位名称
		String positionname=pdao.findById(user.getPosition().getId());
		//找便签
		Page<Notepaper> list=ndao.findByUserIdOrderByCreateTimeDesc(user,pa);
		List<Notepaper> notepaperlist=list.getContent();
		model.addAttribute("user", user);
		model.addAttribute("deptname", deptname);
		model.addAttribute("positionname", positionname);
		model.addAttribute("notepaperlist", notepaperlist);
		model.addAttribute("page", list);
		model.addAttribute("url", "panel");
		return "user/userpanel";
	}
	/**
	 * 我的便签 便签信息的显示
	 */
	@RequestMapping("panel")
	public String index(@SessionAttribute("userId") Long userId,Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		Pageable pa=new PageRequest(page, size);
		User user=udao.findOne(userId);
		//根据用户找便签
		Page<Notepaper> list=ndao.findByUserIdOrderByCreateTimeDesc(user,pa);
		List<Notepaper> notepaperlist=list.getContent();
		model.addAttribute("notepaperlist", notepaperlist);
		model.addAttribute("page", list);
		model.addAttribute("url", "panel");
		return "user/panel";
	}
	/**
	 * 存便签
	 */
	@RequestMapping("writep")
	public String savepaper(Notepaper npaper,@SessionAttribute("userId") Long userId,@RequestParam(value="concent",required=false)String concent){
		User user=udao.findOne(userId);
		npaper.setCreateTime(new Date());
		npaper.setUserId(user);
		System.out.println("内容"+npaper.getConcent());
		if(npaper.getTitle()==null||npaper.getTitle()=="")
			npaper.setTitle("无标题");
		if(npaper.getConcent()==null||npaper.getConcent()=="")
			npaper.setConcent(concent);
		ndao.save(npaper);		
		return "redirect:/userpanel";
	}
	/**
	 * 删除便签
	 */
	@RequestMapping("notepaper")
	public String deletepaper(HttpServletRequest request,@SessionAttribute("userId") Long userId){
		User user=udao.findOne(userId);
		String paperid=request.getParameter("id");
		Long lpid = Long.parseLong(paperid);
		Notepaper note=ndao.findOne(lpid);
		if(user.getUserId().equals(note.getUserId().getUserId())){
			nservice.delete(lpid);
		}else{
			System.out.println("权限不匹配，不能删除");
			return "redirect:/notlimit";
		}
		return "redirect:/userpanel";
		
	}
	/**
	 * 修改用户
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("saveuser")
	public String saveemp(@RequestParam("filePath")MultipartFile filePath,HttpServletRequest request,@Valid User user,
			BindingResult br,@SessionAttribute("userId") Long userId) throws IllegalStateException, IOException{
		String imgpath=nservice.upload(filePath);
		User users=udao.findOne(userId);
		
		//重新set用户
		users.setRealName(user.getRealName());
		users.setUserTel(user.getUserTel());
		users.setEamil(user.getEamil());
		users.setAddress(user.getAddress());
		users.setUserEdu(user.getUserEdu());
		users.setSchool(user.getSchool());
		users.setIdCard(user.getIdCard());
		users.setBank(user.getBank());
		users.setSex(user.getSex());
		users.setThemeSkin(user.getThemeSkin());
		users.setBirth(user.getBirth());
		if(!StringUtil.isEmpty(user.getUserSign())){
			users.setUserSign(user.getUserSign());
		}
		if(!StringUtil.isEmpty(user.getPassword())){
			users.setPassword(user.getPassword());
		}
		if(!StringUtil.isEmpty(imgpath)){
			users.setImgPath(imgpath);
			
		}
		request.setAttribute("users", users);
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
			List<Object> list = new MapToList<>().mapToList(res.getData());
			request.setAttribute("errormess", list.get(0).toString());
			
			System.out.println("list错误的实体类信息：" + user);
			System.out.println("list错误详情:" + list);
			System.out.println("list错误第一条:" + list.get(0));
			System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
			
		}else{
			udao.save(users);
			request.setAttribute("success", "执行成功！");
		}
		return "forward:/userpanel";
		
	}
	@RequestMapping("image/**")
	public void image(Model model, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		//获取前端申请url： /image//c78405f8-63c6-4800-a393-be80f0612ab5.png
		String startpath = new String(URLDecoder.decode(request.getRequestURI(), "utf-8"));
		System.out.print(startpath);
		//截取前面地址
		String path = startpath.replace("/image", "");
		//创建文件
		File f = new File(rootpath, path);
		//创建输出流
		ServletOutputStream sos = response.getOutputStream();
		//输入流读取文件
		FileInputStream input = new FileInputStream(f.getPath());
	    //创建字节数组
		byte[] data = new byte[(int) f.length()];
		//从输入流读取数据内容到字节数组
		IOUtils.readFully(input, data);
		// 将数据写入到浏览器
		IOUtils.write(data, sos);
		input.close();
		sos.close();
	}

}
