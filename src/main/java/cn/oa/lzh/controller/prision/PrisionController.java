package cn.oa.lzh.controller.prision;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.attendcedao.PrisionDao;
import cn.oa.lzh.model.entity.attendce.Prision;
import cn.oa.lzh.model.entity.user.User;

@Controller
@RequestMapping("/")
public class PrisionController {

	@Autowired
	PrisionDao pDao;

	@RequestMapping("prisionmanage")
	public String prisionManage(Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		Sort sort = new Sort(new Order(Direction.ASC, "prisionArea"));
		Pageable p = new PageRequest(page, size, sort);
		Page<Prision> prision = pDao.findByIsLock(1, p);
		List<Prision> prisionPageList = prision.getContent();
		model.addAttribute("page", prision);
		model.addAttribute("prisions", prisionPageList);
		model.addAttribute("url", "prisionmanagepaging");
		return "attendce/prisionmanage";
	}

	@RequestMapping("prisionmanagepaging")
	public String prisionSearch(
			Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "prisionsearch", required = false) String prisionsearch) {

		System.out.println("条件查询");
		Sort sort = new Sort(new Order(Direction.ASC, "prisionArea"));
		Pageable p = new PageRequest(page, size, sort);
		Page<Prision> prisionPage = null;
		System.out.println("传入条件："+ prisionsearch);
		if (StringUtil.isEmpty(prisionsearch)) {
			prisionPage = pDao.findByIsLock(1, p);
		} else {
			prisionPage = pDao.findNameLike(prisionsearch, p);
		}
		List<Prision> prisionPageList = prisionPage.getContent();
		System.out.println(prisionPageList.toString());
		model.addAttribute("page", prisionPage);
		model.addAttribute("prisions", prisionPageList);
		model.addAttribute("url", "prisionmanagepaging");
		return "attendce/prisionmanagepaging";

	}

	@RequestMapping(value = "prisionedit", method = RequestMethod.GET)
	public String editPrision(
			@RequestParam(value = "prisionId", required = false) Long prisionId,
			Model model) {
		System.out.println("修改的犯人编号：" + prisionId);
		if (prisionId != null) {
			Prision prision = pDao.findOne(prisionId);
			System.out.println(prision.getPrisionName());
			model.addAttribute("prision", prision);
		}
		return "attendce/editprision";
	}

	@RequestMapping(value = "prisionedit", method = RequestMethod.POST)
	public String editPrisionPost(Prision prision, Model model) {

		
		System.out.println("犯人编号"+ prision.getPoliceId());
		System.out.println(prision.toString());
		if (prision.getPrisionId() == null) {
			prision.setIsLock(1);
			pDao.save(prision);
		}else{
			Prision p = pDao.findOne(prision.getPrisionId());
			p.setPrisionName(prision.getPrisionName());
			p.setPrisionArea(prision.getPrisionArea());
			p.setPrisionRoom(prision.getPrisionRoom());
			p.setSex(prision.getSex());
			p.setBirthday(prision.getBirthday());
			p.setIntime(prision.getIntime());
			p.setInreason(prision.getInreason());
			p.setPrisionTermOld(prision.getPrisionTermOld());
			p.setPrisionTermNew(prision.getPrisionTermNew());
			p.setChangeReason(prision.getChangeReason());
			p.setHealth(prision.getHealth());
			p.setEducation(prision.getEducation());
			p.setWork(prision.getWork());
			p.setRemark(prision.getRemark());
			pDao.save(p);
		}
		model.addAttribute("success", 1);
		return "prisionmanage";
	}

	@RequestMapping("prisiondelete")
	public String deletePrision(
			@RequestParam(value = "prisionId", required = false) Long prisionId,
			Model model) {

		Prision prision = pDao.findOne(prisionId);
		prision.setIsLock(0);
		pDao.save(prision);
		model.addAttribute("success", 1);
		return "prisionmanage";
	}
}
