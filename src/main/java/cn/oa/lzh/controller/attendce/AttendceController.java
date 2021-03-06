package cn.oa.lzh.controller.attendce;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.support.DefaultConversionService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.common.StringtoDate;
import cn.oa.lzh.model.dao.attendcedao.AttendceDao;
import cn.oa.lzh.model.dao.system.StatusDao;
import cn.oa.lzh.model.dao.system.TypeDao;
import cn.oa.lzh.model.dao.user.UserDao;
import cn.oa.lzh.model.dao.user.UserService;
import cn.oa.lzh.model.entity.attendce.Attends;
import cn.oa.lzh.model.entity.system.SystemStatusList;
import cn.oa.lzh.model.entity.system.SystemTypeList;
import cn.oa.lzh.model.entity.user.User;
import cn.oa.lzh.services.attendce.AttendceService;

@Controller
@RequestMapping("/")
public class AttendceController {

	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	AttendceDao attenceDao;
	@Autowired
	AttendceService attendceService;
	@Autowired
	UserDao uDao;
	@Autowired
	UserService userService;
	@Autowired
	TypeDao typeDao;
	@Autowired
	StatusDao statusDao;

	List<Attends> alist;
	List<User> uList;
	Date start, end;
	String month_;
	// 格式转化导入
	DefaultConversionService service = new DefaultConversionService();

	// 考勤 签到
	@RequestMapping("singin")
	public String Datag(HttpSession session, Model model,
			HttpServletRequest request) throws InterruptedException,
			UnknownHostException {
		// 首先获取ip
		InetAddress ia = null;
		ia = ia.getLocalHost();
		String attendip = ia.getHostAddress();
		// 签到时间规范
		String start = "08:00:00", end = "17:00:00";
		service.addConverter(new StringtoDate());
		// 状态默认是正常
		long typeId, statusId = 10;
		Attends attends = null;
		// 通过session获取id并查询用户信息
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user = uDao.findOne(userId);
		String workType = user.getWorkType();
		System.out.println("当前用户工作类型:" + workType);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowdate = sdf.format(date);
		// 星期 判断该日期是星期几
		SimpleDateFormat sdf3 = new SimpleDateFormat("EEEE");
		// 截取时分
		SimpleDateFormat sdf4 = new SimpleDateFormat("HH:mm");
		// 截取时分秒
		SimpleDateFormat sdf5 = new SimpleDateFormat("HH:mm:ss");
		// 一周当中的星期几
		String weekofday = sdf3.format(date);
		// 时分
		String hourmin = sdf4.format(date);
		// 时分秒
		String hourminsec = sdf5.format(date);
		Long aid = null;
		// 查找用户当天的所有考勤记录（最多两次 上班 下班）
		Integer count = attenceDao.countrecord(nowdate, userId);
		// 通过时间判断能否签到
		if (("白班").equals(workType) && !StringUtil.isEmpty(workType)) {
			if (hourminsec.compareTo(end) > 0) {
				System.out.println("----17点以后不能签到");
				model.addAttribute("error", "1");
			}
			if (hourminsec.compareTo("06:00:00") < 0) {
				System.out.println("----凌晨6点以前不能签到");
				model.addAttribute("error", "2");
			} else if ((hourminsec.compareTo("06:00:00") > 0)
					&& (hourminsec.compareTo(end) < 0)) {
				// 数据库中status规定：10：正常 11：迟到 12：早退 13：旷工 1 type规定： 8：上班 9：下班
				if (count == 0) {
					// count=0 点击是上班
					if (hourminsec.compareTo(end) < 0) {
						typeId = 8;
						if (hourminsec.compareTo(start) > 0) {
							statusId = 11;
						} else if (hourminsec.compareTo(start) < 0) {
							statusId = 10;
						}
						attends = new Attends(typeId, statusId, date, hourmin,
								weekofday, attendip, user);
						attenceDao.save(attends);
					}
				}
				if (count == 1) {
					// 找到当天的一条记录就表示此次点击是下班
					typeId = 9;
					if (hourminsec.compareTo(end) > 0) {
						statusId = 10;
					} else if (hourminsec.compareTo(end) < 0) {
						statusId = 12;
					}
					attends = new Attends(typeId, statusId, date, hourmin,
							weekofday, attendip, user);
					attenceDao.save(attends);
				}
				if (count >= 2) {
					model.addAttribute("error", "4");
				}
			}
		} else if (("夜班").equals(workType) && !StringUtil.isEmpty(workType)) {
			Integer countup = attenceDao.countuprecord(nowdate, userId);
			// 0点~6点系统维护
			if (hourminsec.compareTo(end) < 0) {
				System.out.println("----下午5点以前不能签到");
				model.addAttribute("error", "2");

			} else if (hourminsec.compareTo(end) > 0
					&& hourminsec.compareTo("23:59:59") < 0) {
				// 数据库中status规定：10：正常 11：迟到 12：早退 13：旷工 1 type规定： 8：上班 9：下班

				System.out.println("上班签到");
				typeId = 8;
				if (countup == 0) {
					if (hourminsec.compareTo("18:00:00") > 0) {
						statusId = 11;
					} else if (hourminsec.compareTo("18:00:00") < 0) {
						statusId = 10;
					}
					attends = new Attends(typeId, statusId, date, hourmin,
							weekofday, attendip, user);
					attenceDao.save(attends);
				}else{
					model.addAttribute("error", "5");
					
				}
			} else if (hourminsec.compareTo("08:00:00") < 0
					&& hourminsec.compareTo("06:00:00") > 0) {
				System.out.println("下班签到");
				typeId = 9;
				if (count == 0) {
				if (hourminsec.compareTo("07:00:00") < 0) {
					statusId = 12;
				} else if (hourminsec.compareTo("07:00:00") > 0) {
					statusId = 10;
				}
				attends = new Attends(typeId, statusId, date, hourmin,
						weekofday, attendip, user);
				attenceDao.save(attends);
				}else {
					model.addAttribute("error", "6");
				}
			} else {
				model.addAttribute("error", "1");
			}
		} else {
			model.addAttribute("error", "3");
		}
		// 显示用户当天最新的记录
		Attends aList = attenceDao.findlastest(nowdate, userId);
		if (aList != null) {
			String type = typeDao.findname(aList.getTypeId());
			model.addAttribute("type", type);
		}
		model.addAttribute("alist", aList);
		return "systemcontrol/signin";
	}

	// 考情列表 给单个用户使用
	@RequestMapping(value = "attendcelist", method = RequestMethod.GET)
	public String test(HttpServletRequest request, Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "time", required = false) String time,
			@RequestParam(value = "icon", required = false) String icon) {
		signsortpaging(request, model, session, page, null, type, status, time,
				icon);
		return "attendce/attendcelist";
	}

	@RequestMapping(value = "attendcelisttable", method = RequestMethod.GET)
	public String testdf(HttpServletRequest request, Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "time", required = false) String time,
			@RequestParam(value = "icon", required = false) String icon) {
		signsortpaging(request, model, session, page, baseKey, type, status,
				time, icon);
		return "attendce/attendcelisttable";
	}

	// 考勤管理某个管理员下面的所有员工的信息
	@RequestMapping("attendceatt")
	public String testdasf(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "time", required = false) String time,
			@RequestParam(value = "icon", required = false) String icon,
			Model model) {
		allsortpaging(request, session, page, baseKey, type, status, time,
				icon, model);
		return "attendce/attendceview";
	}

	// 分頁分页
	@RequestMapping("attendcetable")
	public String table(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "time", required = false) String time,
			@RequestParam(value = "icon", required = false) String icon,
			Model model) {
		allsortpaging(request, session, page, baseKey, type, status, time,
				icon, model);
		return "attendce/attendcetable";
	}

	// 删除
	@RequestMapping("attdelete")
	public String dsfa(HttpServletRequest request, HttpSession session) {
		long aid = Long.valueOf(request.getParameter("aid"));
		attendceService.delete(aid);
		return "redirect:/attendceatt";
	}

	// 月报表
	@RequestMapping("attendcemonth")
	public String test2(HttpServletRequest request, Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey) {
		monthtablepaging(request, model, session, page, baseKey);
		return "attendce/monthtable";
	}

	@RequestMapping("realmonthtable")
	public String dfshe(HttpServletRequest request, Model model,
			HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey) {
		monthtablepaging(request, model, session, page, baseKey);
		return "attendce/realmonthtable";
	}

	// 周报表
	@RequestMapping("attendceweek")
	public String test3(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey) {
		weektablepaging(request, session, page, baseKey);
		return "attendce/weektable";
	}

	@RequestMapping("realweektable")
	public String dsaf(HttpServletRequest request, HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "baseKey", required = false) String baseKey) {
		weektablepaging(request, session, page, baseKey);
		return "attendce/realweektable";

	}

	@RequestMapping("attendceedit")
	public String test4(@Param("aid") String aid, Model model,
			HttpServletRequest request, HttpSession session) {
		Long userid = Long.valueOf(session.getAttribute("userId") + "");
		if (aid == null) {
			model.addAttribute("write", 0);
		} else if (aid != null) {
			long id = Long.valueOf(aid);
			Attends attends = attenceDao.findOne(id);
			model.addAttribute("write", 1);
			model.addAttribute("attends", attends);
		}
		typestatus(request);
		return "attendce/attendceedit";
	}

	@RequestMapping("attendceedit2")
	public String DSAGen(HttpServletRequest request) {
		long id = Long.valueOf(request.getParameter("id"));
		Attends attends = attenceDao.findOne(id);
		request.setAttribute("attends", attends);
		typestatus(request);
		return "attendce/attendceedit2";
	}

	@RequestMapping(value = "attendcesave", method = RequestMethod.GET)
	public void Datadf() {
	}

	// 修改保存
	@RequestMapping(value = "attendcesave", method = RequestMethod.POST)
	public String test4(Model model, HttpSession session,
			HttpServletRequest request) {
		Long userid = Long.parseLong(session.getAttribute("userId") + "");
		String remark = request.getParameter("remark");
		String statusname = request.getParameter("status");
		SystemStatusList statusList = statusDao.findByStatusModelAndStatusName(
				"attends", statusname);
		long id = Long.parseLong(request.getParameter("id"));
		Attends attends = attenceDao.findOne(id);
		attends.setAttendsRemark(remark);
		attends.setStatusId(statusList.getStatusId());
		attenceDao.save(attends);
		// attendceService.updatereamrk(remark, id);
		return "redirect:/attendceatt";
	}

	// 状态类型方法
	private void typestatus(HttpServletRequest request) {
		List<SystemTypeList> type = (List<SystemTypeList>) typeDao
				.findByTypeModel("attends");
		List<SystemStatusList> status = (List<SystemStatusList>) statusDao
				.findByStatusModel("attends");
		request.setAttribute("typelist", type);
		request.setAttribute("statuslist", status);
	}

	public void setSomething(String baseKey, Object type, Object status,
			Object time, Object icon, Model model) {
		if (!StringUtils.isEmpty(icon)) {
			model.addAttribute("icon", icon);
			if (!StringUtils.isEmpty(type)) {
				model.addAttribute("type", type);
				if ("1".equals(type)) {
					model.addAttribute("sort", "&type=1&icon=" + icon);
				} else {
					model.addAttribute("sort", "&type=0&icon=" + icon);
				}
			}
			if (!StringUtils.isEmpty(status)) {
				model.addAttribute("status", status);
				if ("1".equals(status)) {
					model.addAttribute("sort", "&status=1&icon=" + icon);
				} else {
					model.addAttribute("sort", "&status=0&icon=" + icon);
				}
			}
			if (!StringUtils.isEmpty(time)) {
				model.addAttribute("time", time);
				if ("1".equals(time)) {
					model.addAttribute("sort", "&time=1&icon=" + icon);
				} else {
					model.addAttribute("sort", "&time=0&icon=" + icon);
				}
			}
		}
		if (!StringUtils.isEmpty(baseKey)) {
			model.addAttribute("sort", "&baseKey=" + baseKey);
		}
	}

	// 单个用户的排序和分页
	private void signsortpaging(HttpServletRequest request, Model model,
			HttpSession session, int page, String baseKey, String type,
			String status, String time, String icon) {
		Long userid = Long.valueOf(session.getAttribute("userId") + "");
		setSomething(baseKey, type, status, time, icon, model);
		Page<Attends> page2 = attendceService.singlepage(page, baseKey, userid,
				type, status, time);
		typestatus(request);
		request.setAttribute("alist", page2.getContent());
		for (Attends attends : page2.getContent()) {
			System.out.println(attends);
		}
		request.setAttribute("page", page2);
		request.setAttribute("url", "attendcelisttable");
	}

	// 该管理下面的所有用户
	private void allsortpaging(HttpServletRequest request, HttpSession session,
			int page, String baseKey, String type, String status, String time,
			String icon, Model model) {
		setSomething(baseKey, type, status, time, icon, model);
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		List<Long> ids = new ArrayList<>();
		// 查询所有手下的id
		List<User> users = uDao.findByFatherId(userId);
		for (User user : users) {
			ids.add(user.getUserId());
		}
		if (ids.size() == 0) {
			ids.add(0L);
		}
		User user = uDao.findOne(userId);
		typestatus(request);
		Page<Attends> page2 = attendceService.paging(page, baseKey, ids, type,
				status, time);
		request.setAttribute("alist", page2.getContent());
		request.setAttribute("page", page2);
		request.setAttribute("url", "attendcetable");
	}

	// 周报表分页
	private void weektablepaging(HttpServletRequest request,
			HttpSession session, int page, String baseKey) {
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		// 格式转化
		service.addConverter(new StringtoDate());
		Date startdate = service.convert(starttime, Date.class);
		Date enddate = service.convert(endtime, Date.class);

		// 用来查找该用户下面管理的所有用户信息
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		List<Long> ids = new ArrayList<>();
		Page<User> userspage = userService.findmyemployuser(page, baseKey,
				userId);
		for (User user : userspage) {
			ids.add(user.getUserId());
		}
		if (ids.size() == 0) {
			ids.add(0L);
		}

		// 找到某个管理员下面的所有用户的信息 保证传过来的是正确的数据 分页之后可以使用全局变量来记住开始和结束日期
		if (startdate != null && enddate != null) {
			start = startdate;
			end = enddate;
		}
		if (startdate == null && enddate == null)
			startdate = start;
		enddate = end;
		System.out.println("再次获取" + startdate + "结束" + enddate);
		List<Attends> alist = attenceDao.findoneweek(startdate, enddate, ids);
		Set<Attends> attenceset = new HashSet<>();
		for (User user : userspage) {
			for (Attends attence : alist) {
				if (attence.getUser().getUserId() == user.getUserId()) {
					attenceset.add(attence);
				}
			}
			user.setaSet(attenceset);
		}
		String[] weekday = { "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日" };
		request.setAttribute("ulist", userspage.getContent());
		request.setAttribute("page", userspage);
		request.setAttribute("weekday", weekday);
		request.setAttribute("url", "realweektable");
	}

	// 月报表
	private void monthtablepaging(HttpServletRequest request, Model model,
			HttpSession session, int page, String baseKey) {
		Integer offnum, toworknum;
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		List<Long> ids = new ArrayList<>();
		Page<User> userspage = userService.findmyemployuser(page, baseKey,
				userId);
		for (User user : userspage) {
			ids.add(user.getUserId());
		}
		if (ids.size() == 0) {
			ids.add(0L);
		}
		String month = request.getParameter("month");

		if (month != null)
			month_ = month;
		else
			month = month_;

		Map<String, List<Integer>> uMap = new HashMap<>();
		List<Integer> result = null;

		for (User user : userspage) {
			result = new ArrayList<>();
			// 当月该用户下班次数
			offnum = attenceDao.countoffwork(month, user.getUserId());
			// 当月该用户上班次数
			toworknum = attenceDao.counttowork(month, user.getUserId());
			for (long statusId = 10; statusId < 13; statusId++) {
				// 这里面记录了正常迟到早退等状态
				if (statusId == 12)
					result.add(attenceDao.countnum(month, statusId,
							user.getUserId())
							+ toworknum - offnum);
				else
					result.add(attenceDao.countnum(month, statusId,
							user.getUserId()));
			}
			// 添加请假和出差的记录//应该是查找 使用sql的sum（）函数来统计出差和请假的次数
			System.out.println("请假天数"
					+ attenceDao.countothernum(month, 46L, user.getUserId()));
			if (attenceDao.countothernum(month, 46L, user.getUserId()) != null)
				result.add(attenceDao.countothernum(month, 46L,
						user.getUserId()));
			else
				result.add(0);
			if (attenceDao.countothernum(month, 47L, user.getUserId()) != null)
				result.add(attenceDao.countothernum(month, 47L,
						user.getUserId()));
			else
				result.add(0);
			// 这里记录了旷工的次数 还有请假天数没有记录 旷工次数=30-8-请假次数-某天签到次数
			// 这里还有请假天数没有写
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String date_month = sdf.format(date);
			if (month != null) {
				if (month.compareTo(date_month) >= 0)
					result.add(0);
				else
					result.add(30 - 8 - offnum);
			}

			uMap.put(user.getUserName(), result);
		}
		model.addAttribute("uMap", uMap);
		model.addAttribute("ulist", userspage.getContent());
		model.addAttribute("page", userspage);
		model.addAttribute("url", "realmonthtable");
	}
}
