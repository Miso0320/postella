package com.mycompany.postella.service;

import java.util.List;

import com.mycompany.postella.dto.Review;

public interface ReviewService {
	public List<Review> getAllReviews(int pg_no);
	public String getPrdName(int prd_no);
	public List<Review> searchReviews(String keyword);
	public List<Review> orderByRate(int pg_no, int rate);
	public List<Review> groupByRate(int pg_no, int rate);
}
