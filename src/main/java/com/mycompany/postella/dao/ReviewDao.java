package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDao {
	public int selectAll(int pg_no);
}
