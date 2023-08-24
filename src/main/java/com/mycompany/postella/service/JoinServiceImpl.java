package com.mycompany.postella.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.UsersDao;
import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김미소
 *
 */
@Slf4j
@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private UsersDao usersDao;
	
	// 회원가입
	@Override
	public JoinResult joinUsers(Users users) {
		// 이메일 중복 여부 확인
		if(usersDao.selectEmail(users.getUs_email()) != null) {
			return JoinResult.FAIL_EMAIL;
		}
		
		// 전화번호 중복 여부 확인
		if(usersDao.selectTel(users.getUs_tel()) != null) {
			return JoinResult.FAIL_TEL;
		}
		
		// 비밀번호 인코딩
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		users.setUs_password(passwordEncoder.encode(users.getUs_password()));
		
		// NULL 방지용 기본값 설정
		users.setUs_sleep("N");
		users.setUs_withdrawal("N");
		
		usersDao.insertUsers(users);
		return JoinResult.SUCCESS;
	}
	
	// 회원가입 시 약관동의 내용 저장
	@Override
	public void joinAgreement(Agreement agreement) {
		usersDao.insertAgree(agreement);
	}

}
