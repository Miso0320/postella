package com.mycompany.postella.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ReviewDao;
import com.mycompany.postella.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> getAllReviews(int pg_no) {
		List<Review> reviews = reviewDao.selectAllByPgNo(pg_no);
		return reviews;
	}
	
	@Override
	public String getPrdName(int prd_no) {
		String prdName = reviewDao.selectPrdName(prd_no);
		return prdName;
	}
	
	@Override
	public List<Review> searchReviews(String keyword) {
		List<Review> reviews = reviewDao.selectByKeyword(keyword);
		return reviews;
	}	
	
	@Override
	public List<Review> orderByRate(int pg_no, int rate) {
		List<Review> reviews = reviewDao.orderByRate(pg_no, rate);
		return reviews;
	}
	
	@Override
	public List<Review> groupByRate(int pg_no, int rate) {
		List<Review> reviews = reviewDao.groupByRate(pg_no, rate);
		return reviews;
	}
	
	@Override
	public int countReview(int pg_no) {
		int cnt = reviewDao.selectReviewCnt(pg_no);
		return cnt;
	}
}
