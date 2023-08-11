package com.mycompany.postella.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.UsersDao;
import com.mycompany.postella.dto.Users;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginServiceImpl implements LoginService{
	@Resource
	private UsersDao usersDao;

	@Override
	public LoginResult loginUsers(Users users) {
		Users dbUsers = usersDao.selectByUser(users.getUs_email());
		log.info("sleep" + users.getUs_sleep());
		if(dbUsers == null) {
			return LoginResult.FAIL_UID;
		}		
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(users.getUs_password(), dbUsers.getUs_password())) {
			if(dbUsers.getUs_sleep().equals("N")) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_UENABLED;
			}	
		} else {
			return LoginResult.FAIL_UPASSWORD;
		}
	}

	@Override
	public Users getUser(String us_email) {
		Users users = usersDao.selectByUser(us_email);
		return users;
	}

}
