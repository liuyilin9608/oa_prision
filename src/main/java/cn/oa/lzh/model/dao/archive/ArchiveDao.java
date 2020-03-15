package cn.oa.lzh.model.dao.archive;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.oa.lzh.model.entity.archive.Archive;

public interface ArchiveDao extends PagingAndSortingRepository<Archive, Long>{

    Page<Archive> findByIsLock(Integer isLock, Pageable p);

    //题目  案卷号 主题词  副题名  管室号  第一责任人模糊查询
    @Query("from Archive u where u.isLock=1 and u.title like %?1% or u.archno like %?1% or u.keyword like %?1% or u.subtitle like %?1% or u.roomno like %?1% or u.firstResp like %?1% ")
    Page<Archive> findNameLike(String name, Pageable p);
}
