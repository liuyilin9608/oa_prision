package cn.oa.lzh.model.dao.attendcedao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.oa.lzh.model.entity.attendce.Prision;
import cn.oa.lzh.model.entity.user.User;

public interface PrisionDao extends JpaRepository<Prision, Long> {

	
    Page<Prision> findByIsLock(Integer isLock, Pageable p);

    
    @Query("from Prision u where u.prisionName like %?1% or u.sex like %?1% or u.inreason like %?1% or u.health like %?1% or u.education like %?1% or u.work like %?1%")
    Page<Prision>findNameLike(String name, Pageable p);
}
