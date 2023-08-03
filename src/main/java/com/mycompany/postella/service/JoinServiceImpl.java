package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.UsersDao;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.service.JoinService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	private UsersDao usersDao;

	@Override
	public JoinResult joinUsers(Users users) {
		Users dbUsers = usersDao.selectByNo(users.getUs_no());
		log.info("dbUsers : " + dbUsers);
		
		if (dbUsers != null) {
			return JoinResult.FAIL;
		}
		
		// 비밀번호 인코딩 추가 필요
		
		users.setUs_sleep("Y");
		users.setUs_withdrawal("Y");
		
		usersDao.insert(users);
		return JoinResult.SUCCESS;
	}

}
