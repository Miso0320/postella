package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Price;
import com.mycompany.postella.dto.Users;

public interface UsersChangeService {
	//유저정보 가져오기
	public Users getUsersInfo(String us_email); 
}
