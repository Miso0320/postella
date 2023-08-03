package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProductDao {
	public String selectByPgNo(int pg_no);
}
