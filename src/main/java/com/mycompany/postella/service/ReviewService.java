package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Review;

public interface ReviewService {
	public List<Review> getAllReviews(int pg_no);
	public List<Review> getReviewsPaged(Map<String, Object> map);
	public String getPrdName(int prd_no);
	public List<Review> searchReviews(Map<String, Object> map);
	public List<Review> orderByRate(Map<String, Object> map);
	public List<Review> orderByDate(Map<String, Object> map);
	public List<Review> groupByRate(Map<String, Object> map);
	public int countReview(int pg_no);
	public int countRevWithRate(Map<String, Object> map);
	
}
