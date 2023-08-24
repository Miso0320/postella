package com.mycompany.postella.service;

import java.util.List;

import java.util.Map;

import com.mycompany.postella.dto.Board;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 김미소
 *
 */
public interface AdminService {
	
	// 전체 상품 리스트 페이징하기
	public List<Product> getList(Map<String, Object> map);

	// 상품 전체 개수
	public int getTotalProductCnt(Map<String, Object> map);
	
	// 전체 공지사항 리스트 페이징하기
	public List<Board> getBoardList(Map<String, Object> map);
	
	// 공지사항 전체 개수
	public int getTotalBoardCnt(Map<String, Object> map);
}
