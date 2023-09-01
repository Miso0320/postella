package com.mycompany.postella.service;

import com.mycompany.postella.dto.Users;

/**
 * 
 * @author 박재홍
 *
 */
public interface LoginService {
	
	// 로그인 결과
	public enum LoginResult {
		SUCCESS,
		FAIL_UID,
		FAIL_UPASSWORD,
		FAIL_UENABLED
	}
	
	// 로그인 결과 처리
	public LoginResult loginUsers(Users users);
	// 유저정보 가져오기
	public Users getUser(String us_email);
}
