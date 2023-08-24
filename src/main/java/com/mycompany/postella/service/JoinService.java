package com.mycompany.postella.service;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

/**
 * 
 * @author 김미소
 *
 */
public interface JoinService {
	// 회원가입 결과 ENUM
	public enum JoinResult {
		SUCCESS,
		FAIL_EMAIL,
		FAIL_TEL
	}
	
	// 회원가입
	public JoinResult joinUsers(Users users);
	
	// 회원가입 시 약관동의 내용 저장
	public void joinAgreement(Agreement agreement);
}
