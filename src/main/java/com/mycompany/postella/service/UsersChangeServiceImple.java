package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.PriceDao;
import com.mycompany.postella.dao.UsersChangeDao;
import com.mycompany.postella.dto.Price;
import com.mycompany.postella.dto.Users;

@Service
public class UsersChangeServiceImple implements UsersChangeService {
	
	@Autowired
	private UsersChangeDao usersChangeDao;
	
	//유저 이메일 가져오기
	@Override
	public Users getUsersInfo(String us_email) {
		Users users = usersChangeDao.selectByUser(us_email);
		return users;
	}
}
