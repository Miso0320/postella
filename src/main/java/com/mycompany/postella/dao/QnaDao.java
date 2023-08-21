package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Qna;

@Mapper
public interface QnaDao {
	
	//같은 상품 그룹을 가진 상품 문의들 가져오기
	public List<Qna> selectByPgNo(int pg_no);
	
	//판매자 이름 가져오기
	public String selectSelName(int pg_no);
	
	//상품 문의 개수 가져오기
	public int selectQnaCnt(int pg_no);
	
	//페이지 별 문의 가져오기
	public List<Qna> selectQnasByPage(Map<String, Object> map);
	
	//상품 옵션 이름 가져오기
	public String selectPrdName(int pg_no);
}
