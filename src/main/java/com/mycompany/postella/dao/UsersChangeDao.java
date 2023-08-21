package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;

@Mapper
public interface UsersChangeDao {
	public Users selectByNo(int us_no);
	public Users selectEmail(String us_email);
	public Users selectTel(String us_tel);
	public Users selectByUser(String us_email);
	public Users updatePassword(Users users);
	public Users updateNickname(String us_email);
}
