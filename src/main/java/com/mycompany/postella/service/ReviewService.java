package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Review;

public interface ReviewService {
	public List<Review> getAllReviews(int pg_no);
	public String getPrdName(int prd_no);
	public List<Review> searchReviews(Map<String, Object> map);
	public List<Review> orderByRate(int pg_no);
	public List<Review> orderByDate(int pg_no);
	public List<Review> groupByRate(Map<String, Object> map);
	public int countReview(int pg_no);
	public int countRevWithRate(Map<String, Object> map);
	public List<Review> getReviewsOrderByStar(int pg_no);
	public List<Review> getReviewsOrderByDate(int pg_no);
	
}
