package com.mycompany.postella.service;

import com.mycompany.postella.dto.Users;

public interface LoginService {
	public enum LoginResult {
		SUCCESS,
		FAIL_UID,
		FAIL_UPASSWORD,
		FAIL_UENABLED
	}
	public LoginResult loginUsers(Users users);
	public Users getUser(String us_email);
}
