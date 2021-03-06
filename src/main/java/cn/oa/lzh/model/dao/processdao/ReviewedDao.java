package cn.oa.lzh.model.dao.processdao;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.oa.lzh.model.entity.process.AubUser;
import cn.oa.lzh.model.entity.process.ProcessList;
import cn.oa.lzh.model.entity.process.Reviewed;
import cn.oa.lzh.model.entity.user.User;

public interface ReviewedDao extends PagingAndSortingRepository<Reviewed, Long>{

	//根据审核人查找流程
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='创建公文' and rev.userId=?1 and rev.del=?2 order by rev.statusId")
	Page<AubUser> findDocByUserIdOrderByStatusId(User user,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='申请借调档案' and rev.userId=?1 and rev.del=?2 order by rev.statusId")
	Page<AubUser> findArchByUserIdOrderByStatusId(User user,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='请假申请' and rev.userId=?1 and rev.del=?2 order by rev.statusId")
	Page<AubUser> findHoliByUserIdOrderByStatusId(User user,Boolean bo,Pageable pa);
	
	//根据申请人和审核人查找流程
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId  and pro.typeNmae='创建公文' and rev.userId=?1 and pro.userId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findDocprocesslist(User user,User u,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='申请借调档案' and rev.userId=?1 and pro.userId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findArchprocesslist(User user,User u,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='请假申请' and rev.userId=?1 and pro.userId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findHoliprocesslist(User user,User u,Boolean bo,Pageable pa);
	
	//根据状态和审核人查找流程
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='创建公文' and rev.userId=?1 and rev.statusId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findDocbystatusprocesslist(User user,Long statusid,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='申请借调档案' and rev.userId=?1 and rev.statusId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findArchbystatusprocesslist(User user,Long statusid,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='请假申请' and rev.userId=?1 and rev.statusId=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findHolibystatusprocesslist(User user,Long statusid,Boolean bo,Pageable pa);
	
	//根据类型名和审核人查找流程
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='创建公文' and rev.userId=?1 and pro.typeNmae=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findDocbytypenameprocesslist(User user,String typename,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='申请借调档案' and rev.userId=?1 and pro.typeNmae=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findArchbytypenameprocesslist(User user,String typename,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='请假申请' and rev.userId=?1 and pro.typeNmae=?2 and rev.del=?3 order by rev.statusId")
	Page<AubUser> findHolibytypenameprocesslist(User user,String typename,Boolean bo,Pageable pa);
	
	//根据标题和审核人查找流程
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='创建公文' and rev.userId=?1 and pro.processName like %?2% and rev.del=?3 order by rev.statusId")
	Page<AubUser> findDocbyprocessnameprocesslist(User user,String processname,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='申请借调档案' and rev.userId=?1 and pro.processName like %?2% and rev.del=?3 order by rev.statusId")
	Page<AubUser> findArchbyprocessnameprocesslist(User user,String processname,Boolean bo,Pageable pa);
	
	@Query("select new cn.oa.lzh.model.entity.process.AubUser(pro.processId,pro.typeNmae,pro.deeply,pro.processName,pro.userId.userName,pro.applyTime,rev.statusId) "
			+ "from ProcessList as pro,Reviewed as rev where rev.proId.processId=pro.processId and pro.typeNmae='请假申请' and rev.userId=?1 and pro.processName like %?2% and rev.del=?3 order by rev.statusId")
	Page<AubUser> findHolibyprocessnameprocesslist(User user,String processname,Boolean bo,Pageable pa);
	
	List<Reviewed> findByReviewedTimeNotNullAndProId(ProcessList pro);
	
	@Query(" select re from Reviewed as re where re.proId.processId=?1 and re.userId=?2")
	Reviewed findByProIdAndUserId(Long pro,User u);
	
}
