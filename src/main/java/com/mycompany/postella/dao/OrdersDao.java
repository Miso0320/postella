package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OrdersDao {
	public String selectUsName(int od_no);
	
}
