package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Qna;

@Mapper
public interface QnaDao {
	public List<Qna> selectByPgNo(int pg_no);
	public String selectSelName(int pg_no);
	public int selectQnaCnt(int pg_no);
	public List<Qna> selectQnasByPage(Map<String, Object> map);
}
