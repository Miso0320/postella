package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Review;

/**
 * 
 * @author 이송미
 *
 */
public interface ReviewService {
	
	//리뷰들 가져오기
	public List<Review> getAllReviews(int pg_no);
	
	//페이지 별 리뷰 가져오기
	public List<Review> getReviewsPaged(Map<String, Object> map);
	
	//상품 옵션 이름 가져오기
	public String getPrdName(int prd_no);
	
	//리뷰 검색 결과 가져오기
	public List<Review> searchReviews(Map<String, Object> map);
	
	//별점순으로 리뷰 가져오기
	public List<Review> orderByRate(Map<String, Object> map);
	
	//날짜순으로 리뷰 가져오기
	public List<Review> orderByDate(Map<String, Object> map);
	
	//별점별로 리뷰 가져오기
	public List<Review> groupByRate(Map<String, Object> map);
	
	//리뷰 개수 가져오기
	public int countReview(int pg_no);
	
	//별점별 리뷰 개수 가져오기
	public int countRevWithRate(Map<String, Object> map);
	
}
