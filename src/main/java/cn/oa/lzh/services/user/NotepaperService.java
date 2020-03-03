package cn.oa.lzh.services.user;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;

import cn.oa.lzh.model.dao.processdao.NotepaperDao;

@Service
@Transactional
public class NotepaperService {
	
	@Autowired
	private NotepaperDao ndao;
	
	@Value("${img.rootpath}")
	private String rootpath;
	
	public void delete(Long id){
		ndao.delete(id);
	}
	
	/**
	 * 上传头像
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public String upload(MultipartFile file) throws IllegalStateException, IOException{
		//创建文件夹
		File dir=new File(rootpath);
		if(!dir.exists()){
			dir.mkdirs();
		}
		//得到上传时候的文件名
		String fileName=file.getOriginalFilename();
		if(!StringUtil.isEmpty(fileName)){
			//获取文件扩展名 .jpg
			String suffix=FilenameUtils.getExtension(fileName);
			//生成一个独一无二的新名字（UUID）
			String newFileName = UUID.randomUUID().toString().toLowerCase() + "." + suffix;
			//在指定文件夹创建文件
			File targetFile = new File(dir,newFileName);
			//保存文件在指定路径
			file.transferTo(targetFile);
			System.out.println(newFileName+"mmm");
			//获得路径给Controller层存入数据库   user.setImg(imgpath)
			String imgpath=targetFile.getPath().replace("\\", "/").replace(rootpath, "");
			System.out.println(imgpath);
			return imgpath;
		}else{
			return null;
		}
	}
}
