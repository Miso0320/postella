package com.mycompany.postella.service;

import com.mycompany.postella.dto.Users;

/**
 * 
 * @author 박재홍
 *
 */
public interface UsersChangeService {
	//유저정보 가져오기
	public Users getUsersInfo(String us_email); 
}
