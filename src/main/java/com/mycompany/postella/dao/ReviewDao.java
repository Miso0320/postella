package com.mycompany.postella.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.postella.dto.Review;

@Mapper
public interface ReviewDao {
	
	//같은 상품 그룹 번호를 가진 리뷰 가져오기
	public List<Review> selectAllByPgNo(int pg_no);
	
	//상품명 가져오기
	public String selectPrdName(int prd_no);
	
	//검색어로 리뷰 가져오기
	public List<Review> selectByKeyword(Map<String, Object> map);
	
	//별점 순으로 리뷰 가져오기
	public List<Review> orderByRate(Map<String, Object> map);
	
	//날짜순으로 리뷰 가져오기
	public List<Review> orderByDate(Map<String, Object> map);
	
	//별점 별로 리뷰 가져오기
	public List<Review> groupByRate(Map<String, Object> map);
	
	//리뷰 개수 가져오기
	public int selectReviewCnt(int pg_no);
	
	//별점 별 리뷰 개수 가져오기
	public int selectReviewCntWithRate(Map<String, Object> map);
	
	//페이지 당 리뷰 가져오기
	public List<Review> selectReviewsByPage(Map<String, Object> map);
}
