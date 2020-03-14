package cn.oa.lzh.controller.archive;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/")
public class ArchiveController {

	@RequestMapping("archivemanage")
	public String archiveManage(){
		return "archive/archivemanage";
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
