package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Qna;

@Mapper
public interface QnaDao {
	public List<Qna> selectByPgNo(int pg_no);
	public String selectSelName(int pg_no);
}
