package com.mycompany.postella.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.ReviewDao;
import com.mycompany.postella.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Override
	public List<Review> getAllReviews(int pg_no) {
		List<Review> reviews = reviewDao.selectAllByPgNo(pg_no);
		addReviewInfo(reviews);
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
		addReviewInfo(reviews);
		return reviews;
	}	
	
	@Override
	public List<Review> orderByRate(int pg_no) {
		List<Review> reviews = reviewDao.orderByRate(pg_no);
		addReviewInfo(reviews);
		return reviews;
	}
	
	@Override
	public List<Review> orderByDate(int pg_no) {
		List<Review> reviews = reviewDao.orderByDate(pg_no);
		addReviewInfo(reviews);
		return reviews;
	}
	
	@Override
	public List<Review> groupByRate(int pg_no, int rate) {
		List<Review> reviews = reviewDao.groupByRate(pg_no, rate);
		addReviewInfo(reviews);
		return reviews;
	}
	
	@Override
	public int countReview(int pg_no) {
		int cnt = reviewDao.selectReviewCnt(pg_no);
		return cnt;
	}
	
	@Override
	public List<Review> getReviewsOrderByDate(int pg_no) {
		List<Review> reviews = reviewDao.orderByDate(pg_no);
		addReviewInfo(reviews);
		return reviews;
	}
	
	@Override
	public List<Review> getReviewsOrderByStar(int pg_no) {
		List<Review> reviews = reviewDao.orderByRate(pg_no);
		addReviewInfo(reviews);
		return reviews;
	}
	
	public void addReviewInfo(List<Review> reviews) {
		SimpleDateFormat rformat = new SimpleDateFormat("yyyy.MM.dd");
		for(int i=0; i < reviews.size(); i++) {
			reviews.get(i).setUs_name(ordersService.getUserName(reviews.get(i).getOd_no()));
			reviews.get(i).setPrd_name(reviewService.getPrdName(reviews.get(i).getPrd_no()));
			reviews.get(i).setStr_date(rformat.format(reviews.get(i).getRev_date()));
		}
	}
}
