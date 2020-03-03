package cn.oa.lzh.services.user;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.oa.lzh.model.dao.user.UserLogRecordDao;
import cn.oa.lzh.model.entity.user.LoginRecord;

@Service
@Transactional
public class UserLongRecordService {
	@Autowired
	private UserLogRecordDao  ulDao;
	
	public LoginRecord save(LoginRecord lr){
		return ulDao.save(lr);
	}
	
}