package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Board;

/**
 * 
 * @author 김미소
 *
 */
@Mapper
public interface AdminBoardDao {
	
	// 전체리스트 페이징하기
	public List<Board> selectByPage(Map<String, Object> map);
	
	// 총 상품갯수 카운트
	public int count(Map<String, Object> map);
}
