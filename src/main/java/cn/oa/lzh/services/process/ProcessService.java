package cn.oa.lzh.services.process;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import java.io.File;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.data.domain.Sort.Order;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.support.DaoSupport;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.notedao.AttachmentDao;
import cn.oa.lzh.model.dao.processdao.ProcessListDao;
import cn.oa.lzh.model.dao.processdao.ReviewedDao;
import cn.oa.lzh.model.dao.roledao.RoleDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.user.DeptDao;
import cn.oa.lzh.model.dao.user.PositionDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.entity.note.Attachment;
import cn.oa.lzh.model.entity.process.AubUser;
import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.process.Reviewed;
import cn.oa.lzh.model.entity.system.SystemStatusList;
import cn.oa.lzh.model.entity.system.SystemTypeList;
import cn.oa.lzh.model.entity.user.Dept;
import cn.oa.lzh.model.entity.user.Position;
import cn.oa.lzh.model.entity.user.User;

@Service
@Transactional
public class ProcessService {

	@Autowired
	private UserDao udao;
	@Autowired
	private DeptDao ddao;
	@Autowired
	private RoleDao rdao;
	@Autowired
	private PositionDao pdao;
	@Autowired
	private StatusDao sdao;
	@Autowired
	private TypeDao tydao;
	@Autowired
	private AttachmentDao attDao;
	@Autowired
	private ProcessListDao prodao;
	@Autowired
	private ReviewedDao redao;
	@Value("${attachment.roopath}")
	private String rootpath;

	/**
	 * 回显用户信息表
	 * 
	 * @param model
	 * @param id
	 * @param page
	 * @param size
	 */
	public void index(Model model, Long id, int page, int size) {
		// 获取申请人信息
		User applyUser = udao.findOne(id);
		Pageable p = new PageRequest(page, size);
		List<SystemTypeList> processType = tydao.findByTypeModel("process");
		// 查看用户并分页
		Page<User> pageUser = udao.findByIsLock(0, p);
		List<User> userList = pageUser.getContent();
		// 查询部门表
		Iterable<Dept> deptList = ddao.findAll();
		// 查询职位表
		Iterable<Position> positionList = pdao.findAll();
		System.out.println("分页"+userList.toString());
		model.addAttribute("page", pageUser);
		model.addAttribute("emplist", userList);
		model.addAttribute("deptlist", deptList);
		model.addAttribute("poslist", positionList);
		model.addAttribute("url", "names"); //用于通讯录回显的/name接口
		model.addAttribute("username", applyUser.getUserName());
		model.addAttribute("processType", processType);
	}

	/**
	 * 存流程信息
	 * 
	 * @param processList
	 * @param val
	 * @param user
	 * @param name
	 */
	public void saveProcess(ProcessList processList, String val, User user,
			String name) {
		processList.setTypeNmae(val);// 流程申请类型
		processList.setApplyTime(new Date());
		processList.setUserId(user);
		processList.setStatusId(23L);// 流程状态 初始23：未处理
		processList.setShenuser(name);// 设置审核人
	}

	/*
	 * 存带附件流程信息
	 */
	public void saveProcessWithAttach(ProcessList processList, String val,
			User user, MultipartFile filePath, String name, String processName)
			throws IllegalStateException, IOException {

		processList.setTypeNmae(val); // 流程申请类型
		processList.setApplyTime(new Date());
		processList.setUserId(user);
		processList.setStatusId(23L); // 流程状态 初始23：未处理
		processList.setShenuser(name);// 设置审核人
		processList.setProcessName(processName);
		Attachment attachment = null;
		if (!StringUtil.isEmpty(filePath.getOriginalFilename())) {
			attachment = upload(filePath, user);
			attachment.setModel("document");
			attDao.save(attachment);
			System.out.println("上传公文附件成功");
			processList.setProFileid(attachment);
		}
	}

	/**
	 * 上传附件
	 */
	public Attachment upload(MultipartFile file, User user)
			throws IllegalStateException, IOException {
		System.out.println();
		System.out.println("1111111111");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM");
		File root = new File(rootpath, simpleDateFormat.format(new Date()));
		File savepath = new File(root, user.getUserName());

		if (!savepath.exists()) {
			savepath.mkdirs();
		}
		String fileName = file.getOriginalFilename();
		if (!StringUtil.isEmpty(fileName)) {
			String suffix = FilenameUtils.getExtension(fileName);
			String newFileName = UUID.randomUUID().toString().toLowerCase()
					+ "." + suffix;
			File targetFile = new File(savepath, newFileName);
			file.transferTo(targetFile);

			Attachment attachment = new Attachment();
			attachment.setAttachmentName(file.getOriginalFilename());
			attachment.setAttachmentPath(targetFile.getAbsolutePath()
					.replace("\\", "/").replace(rootpath, ""));
			attachment.setAttachmentShuffix(suffix);
			attachment.setAttachmentSize(file.getSize());
			attachment.setAttachmentType(file.getContentType());
			attachment.setUploadTime(new Date());
			attachment.setUserId(user.getUserId() + "");
			return attachment;
		}
		return null;
	}

	/**
	 * 存审核信息
	 */
	public void saveVerify(User user, ProcessList processList) {
		Reviewed reviewed = new Reviewed();
		//存入审核人ID
		reviewed.setUserId(user);
		reviewed.setStatusId(23L);
		reviewed.setProId(processList);
		redao.save(reviewed);
	}
	/**
	 * 
	 * 条件查询审核信息
	 */
	public Page<AubUser> verifyDoc(User user,int page,int size,String val,Model model){
		Pageable pa=new PageRequest(page, size);
		Page<AubUser> pagelist=null;
		Page<AubUser> pagelist2=null;
		List<Order> orders = new ArrayList<>();
		User u=udao.findByUserName(val);
		SystemStatusList status=sdao.findByStatusModelAndStatusName("process", val);
		System.out.println("状态：" + status);
		if(StringUtil.isEmpty(val)){
			orders.add(new Order(Direction.DESC, "applyTime"));
			Sort sort = new Sort(orders);
			pa=new PageRequest(page,size,sort);
			pagelist=redao.findDocByUserIdOrderByStatusId(user,false, pa);
			System.out.println("分页数据：" + pagelist);
		}else if(!Objects.isNull(u)){
			pagelist=redao.findDocprocesslist(user,u,false,pa);
			model.addAttribute("sort", "&val="+val);
		}else if(!Objects.isNull(status)){
			pagelist=redao.findDocbystatusprocesslist(user,status.getStatusId(),false,pa);
			model.addAttribute("sort", "&val="+val);
		}else{
			pagelist2=redao.findDocbytypenameprocesslist(user, val,false, pa);
			if(!pagelist2.hasContent()){
				pagelist2=redao.findDocbyprocessnameprocesslist(user, val,false, pa);
			}
			model.addAttribute("sort", "&val="+val);
			return pagelist2;
		}
		return pagelist;
	}
	
	public Page<AubUser> verifyArch(User user,int page,int size,String val,Model model){
		Pageable pa=new PageRequest(page, size);
		Page<AubUser> pagelist=null;
		Page<AubUser> pagelist2=null;
		List<Order> orders = new ArrayList<>();
		User u=udao.findByUserName(val);
		SystemStatusList status=sdao.findByStatusModelAndStatusName("process", val);
		System.out.println("状态：" + status);
		if(StringUtil.isEmpty(val)){
			orders.add(new Order(Direction.DESC, "applyTime"));
			Sort sort = new Sort(orders);
			pa=new PageRequest(page,size,sort);
			pagelist=redao.findArchByUserIdOrderByStatusId(user,false, pa);
			System.out.println("分页数据：" + pagelist);
		}else if(!Objects.isNull(u)){
			pagelist=redao.findArchprocesslist(user,u,false,pa);
			model.addAttribute("sort", "&val="+val);
		}else if(!Objects.isNull(status)){
			pagelist=redao.findArchbystatusprocesslist(user,status.getStatusId(),false,pa);
			model.addAttribute("sort", "&val="+val);
		}else{
			pagelist2=redao.findArchbytypenameprocesslist(user, val,false, pa);
			if(!pagelist2.hasContent()){
				pagelist2=redao.findArchbyprocessnameprocesslist(user, val,false, pa);
			}
			model.addAttribute("sort", "&val="+val);
			return pagelist2;
		}
		return pagelist;
	}
	
	public Page<AubUser> verifyHoliday(User user,int page,int size,String val,Model model){
		Pageable pa=new PageRequest(page, size);
		Page<AubUser> pagelist=null;
		Page<AubUser> pagelist2=null;
		List<Order> orders = new ArrayList<>();
		User u=udao.findByUserName(val);
		SystemStatusList status=sdao.findByStatusModelAndStatusName("process", val);
		System.out.println("状态：" + status);
		if(StringUtil.isEmpty(val)){
			orders.add(new Order(Direction.DESC, "applyTime"));
			Sort sort = new Sort(orders);
			pa=new PageRequest(page,size,sort);
			pagelist=redao.findHoliByUserIdOrderByStatusId(user,false, pa);
			System.out.println("分页数据：" + pagelist);
		}else if(!Objects.isNull(u)){
			pagelist=redao.findHoliprocesslist(user,u,false,pa);
			model.addAttribute("sort", "&val="+val);
		}else if(!Objects.isNull(status)){
			pagelist=redao.findHolibystatusprocesslist(user,status.getStatusId(),false,pa);
			model.addAttribute("sort", "&val="+val);
		}else{
			pagelist2=redao.findHolibytypenameprocesslist(user, val,false, pa);
			if(!pagelist2.hasContent()){
				pagelist2=redao.findHolibyprocessnameprocesslist(user, val,false, pa);
			}
			model.addAttribute("sort", "&val="+val);
			return pagelist2;
		}
		return pagelist;
	}
	/**
	 * 审核页数据封装
	 */
	public List<Map<String, Object>> verifyData(Page<AubUser> page, User user){
		
		List<Map<String, Object>> list = new ArrayList<>();
		List<AubUser> proList = page.getContent();
		for (int i = 0; i < proList.size(); i++) {
			String type = tydao.findname(proList.get(i).getDeeply());
			SystemStatusList status = sdao.findOne(proList.get(i).getStatusId());
			Map<String, Object> result=new HashMap<String,Object>();
			result.put("typename", proList.get(i).getTypeNmae());
			result.put("title", proList.get(i).getProcessName());
			result.put("pushuser", proList.get(i).getUserName());
			result.put("applytime",  proList.get(i).getApplyTime());
			result.put("harry", type);
			result.put("statusname", status.getStatusName());
			result.put("statuscolor", status.getStatusColor());
			result.put("proid", proList.get(i).getProcessId());
			list.add(result);
		}
		System.out.println("审核页数据" +list.toString());
		return list;
	}
	/**
	 * 申请相关数据封装
	 */
	public Map<String, Object> apply(String name, User user, String typename, ProcessList process){
		System.out.println("当前用户角色："+ name);
		Map<String,Object> result=new HashMap<>();
		String harryname=tydao.findname(process.getDeeply());
		result.put("proId", process.getProcessId());
		result.put("harryname", harryname);
		result.put("processName", process.getProcessName());
		result.put("processDescribe",process.getProcessDescribe());
		if(("审核").equals(name)){
			result.put("username", process.getUserId().getUserName());//提单人员
			result.put("deptname", ddao.findname(process.getUserId().getDept().getDeptId()));//部门
		}else if(("申请").equals(name)){
			result.put("username", user.getUserName());
			result.put("deptname", ddao.findname(process.getUserId().getDept().getDeptId()));
		}
		result.put("applytime", process.getApplyTime());
		if(!Objects.isNull(process.getProFileid())){
			result.put("file", process.getProFileid());
		}else{
			result.put("file", "file");
		}
		result.put("name", name);
		result.put("typename", process.getTypeNmae());
		result.put("startime", process.getStartTime());
		result.put("endtime", process.getEndTime());
		result.put("tianshu", process.getProcseeDays());
		result.put("statusid", process.getStatusId());
		return result;
	}
	/**
	 * 用户信息封装
	 */
	public void user(int page,int size,Model model){
		Pageable pa=new PageRequest(page, size);
		//查看用户并分页
		Page<User> pageuser=udao.findAll(pa);
		List<User> userlist=pageuser.getContent();
		// 查询部门表
		Iterable<Dept> deptlist = ddao.findAll();
		// 查职位表
		Iterable<Position> poslist = pdao.findAll();
		model.addAttribute("page", pageuser);
		model.addAttribute("emplist", userlist);
		model.addAttribute("deptlist", deptlist);
		model.addAttribute("poslist", poslist);
		model.addAttribute("url", "names");
	}
	/**
	 * 审核人信息封装
	 */
	public List<Map<String,Object>> auditor(ProcessList process){
		List<Map<String,Object>> relist=new ArrayList<>();
		List<Reviewed> revie=redao.findByReviewedTimeNotNullAndProId(process);
		for (int i = 0; i <revie.size(); i++) {
			Map<String, Object> result=new HashMap<>();
			User u=udao.findOne(revie.get(i).getUserId().getUserId());
			Position po=pdao.findOne(u.getPosition().getId());
			SystemStatusList status=sdao.findOne(revie.get(i).getStatusId());
			result.put("poname", po.getName());
			result.put("username", u.getUserName());
			result.put("retime",revie.get(i).getReviewedTime());
			result.put("restatus",status.getStatusName());
			result.put("statuscolor",status.getStatusColor());
			result.put("des", revie.get(i).getAdvice());
			result.put("img",u.getImgPath());
			result.put("positionid",u.getPosition().getId());
			relist.add(result);
		}
		return relist;
	}
	/**
	 * 写方法
	 */
	public void writeFile(HttpServletResponse response, File file){
		ServletOutputStream out = null;
		FileInputStream in = null;
		try {
			in = new FileInputStream(file);
			out = response.getOutputStream();
			byte[] data = new byte[(int)file.length()];
			//读取文件字节
			IOUtils.readFully(in, data);
			//将文件流输出到浏览器
			IOUtils.write(data, out);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				out.close();
				in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	/**
	 * 审核并流转
	 */
	public void save(Long proId, User user, Reviewed reviewed, ProcessList process, User userNext){
		
		//1.一级审核表：修改状态（未处理23 —》已批准25），添加审核人建议
		Reviewed r = redao.findByProIdAndUserId(proId, user);
		r.setAdvice(reviewed.getAdvice());
		r.setStatusId(reviewed.getStatusId());
		r.setReviewedTime(new Date());
		System.out.println("一级审核表状态："+ r);
		redao.save(r);
		
		//2.创建下一级审核表 修改状态  24处理中
		Reviewed rNext = new Reviewed();
		rNext.setProId(process);
		rNext.setUserId(userNext);
		rNext.setStatusId(24L);
		redao.save(rNext);
		
		//3.在流程表中设置新的审核人，并修改流程状态 24处理中
		process.setShenuser(process.getShenuser()+";"+userNext.getUserName());
		process.setStatusId(24L);
		prodao.save(process);
	}
	
	/**
	 * 存入档案申请信息
	 */
	public void saveArchApply(ProcessList processList, String val, User user, String name, String processName)
			throws IllegalStateException, IOException {
		processList.setTypeNmae(val); // 流程申请类型
		processList.setApplyTime(new Date());
		processList.setUserId(user);
		processList.setStatusId(23L); // 流程状态 初始23：未处理
		processList.setShenuser(name);// 设置审核人
		processList.setProcessName(processName);
	}
}
