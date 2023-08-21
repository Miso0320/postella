package com.mycompany.postella.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Product;


@Mapper
public interface ProductDao {
	
	//상품 식별 번호로 상품 정보 가져오기
	public Product selectByPrdNo(int prd_no);
	
	//같은 상품 그룹에 있는 상품들 가져오기
	public List<Product> selectAllByPgNo(int pg_no);
	
	//별점 평균 가져오기
	public int selectStarAvg(int pg_no);
}
