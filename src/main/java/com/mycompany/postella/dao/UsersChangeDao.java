package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

/**
 * 
 * @author 박재홍
 *
 */
@Mapper
public interface UsersChangeDao {
	
	//변경할 유저 정보
	public Users selectByUser(String us_email);
}
