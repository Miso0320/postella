package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Users;


@Mapper
public interface UsersDao {
	public int insert(Users users);
}
