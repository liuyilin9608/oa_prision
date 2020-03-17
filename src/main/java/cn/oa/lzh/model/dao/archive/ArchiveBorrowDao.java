package cn.oa.lzh.model.dao.archive;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.oa.lzh.model.entity.archive.Archive;
import cn.oa.lzh.model.entity.archive.ArchiveBorrow;
import cn.oa.lzh.model.entity.document.Document;
import cn.oa.lzh.model.entity.process.ProcessList;

public interface ArchiveBorrowDao extends PagingAndSortingRepository<ArchiveBorrow, Long>{

	ArchiveBorrow findByProId(ProcessList processList);
}
