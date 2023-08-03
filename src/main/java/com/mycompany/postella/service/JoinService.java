package com.mycompany.postella.service;

import com.mycompany.postella.dto.Users;

public interface JoinService {
	public enum JoinResult {
		SUCCESS,
		FAIL
	}
	public JoinResult joinUsers(Users users);
}
