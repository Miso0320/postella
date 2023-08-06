package com.mycompany.postella.service;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

public interface JoinService {
	public enum JoinResult {
		SUCCESS,
		FAIL_EMAIL,
		FAIL_TEL
	}
	public JoinResult joinUsers(Users users);
	public void joinAgreement(Agreement agreement);
}
