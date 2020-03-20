package cn.oa.lzh.model.dao.holiday;

import org.springframework.data.repository.PagingAndSortingRepository;

import cn.oa.lzh.model.entity.holiday.Holiday;
import cn.oa.lzh.model.entity.process.ProcessList;

public interface HolidayDao extends PagingAndSortingRepository<Holiday, Long>{

	Holiday findByProId(ProcessList pro);
}

