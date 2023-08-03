package com.mycompany.postella.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Order_detailDao {
	public int selectStarAvg(int pg_no);
}
