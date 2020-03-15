package cn.oa.lzh.controller.archive;

import java.util.List;

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

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.archive.ArchiveDao;
import cn.oa.lzh.model.entity.archive.Archive;
@Controller
@RequestMapping("/")
public class ArchiveController {

	@Autowired
	ArchiveDao aDao;
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
	/**\
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
		System.out.println("传入条件："+ archivesearch);
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
		}else{
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
	
	@RequestMapping("borrowarchive")
	public String borrowArchive(){
		return "archive/borrowarchive";
	} 
	@RequestMapping("myarchives")
	public String myArchive(){
		return "archive/myarchives";
	}
	
	@RequestMapping("verifyarchives")
	public String verifyArchives(){
		return "archive/verifyarchives";
	}
}
