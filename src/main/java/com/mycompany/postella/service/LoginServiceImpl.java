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
	
	//로그인결과
	@Override
	public LoginResult loginUsers(Users users) {
		Users dbUsers = usersDao.selectByUser(users.getUs_email());
		if(dbUsers == null) {
			return LoginResult.FAIL_UID;
		}		
		
		//암호화된 비밀번호와 입력한 비밀번호 비교결과
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(passwordEncoder.matches(users.getUs_password(), dbUsers.getUs_password())) {
			//휴면유저 여부 Y/N
			/**
			 * SUCCESS: 휴면회원이 아니고, 비밀번호가 맞는 경우
			 * FAIL_UENABLED: 비밀번호는 맞지만 휴면회원인 경우
			 * FAIL_UPASSWORD: 비밀번호가 맞지않는 경우
			 */
			if(dbUsers.getUs_sleep().equals("N")) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_UENABLED;
			}	
		} else {
			return LoginResult.FAIL_UPASSWORD;
		}
	}
		
	//유저 이메일을 기준으로 users객체로 반환
	@Override
	public Users getUser(String us_email) {
		Users users = usersDao.selectByUser(us_email);
		return users;
	}

}
