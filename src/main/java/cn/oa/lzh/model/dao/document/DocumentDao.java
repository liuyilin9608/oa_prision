package cn.oa.lzh.model.dao.document;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.oa.lzh.model.entity.document.Document;
import cn.oa.lzh.model.entity.process.ProcessList;

public interface DocumentDao extends PagingAndSortingRepository<Document, Long>{
	
	Document findByProId(ProcessList processList);
}
