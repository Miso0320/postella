package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.AdminBoardDao;
import com.mycompany.postella.dao.AdminProductDao;
import com.mycompany.postella.dto.Board;
import com.mycompany.postella.dto.Product;

/**
 * 
 * @author 김미소
 *
 */
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminProductDao adminProductDao;

	@Autowired
	private AdminBoardDao adminBoardDao;

	// 전체 상품 리스트 페이징하기
	@Override
	public List<Product> getList(Map<String, Object> map) {
		List<Product> list = adminProductDao.selectByPage(map);
		return list;
	}

	// 상품전체 개수
	@Override
	public int getTotalProductCnt(Map<String, Object> map) {
		int totalProductGroupNum = adminProductDao.count(map);
		return totalProductGroupNum;
	}

	// 전체 공지사항 리스트 페이징하기
	@Override
	public List<Board> getBoardList(Map<String, Object> map) {
		List<Board> list = adminBoardDao.selectByPage(map);
		return list;
	}

	// 공지사항 전체 개수
	@Override
	public int getTotalBoardCnt(Map<String, Object> map) {
		int totalProductGroupNum = adminBoardDao.count(map);
		return totalProductGroupNum;
	}
}
