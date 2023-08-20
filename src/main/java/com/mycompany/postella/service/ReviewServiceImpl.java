package com.mycompany.postella.service;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

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
	
	//리뷰들 가져오기
	@Override
	public List<Review> getAllReviews(int pg_no) {
		List<Review> reviews = reviewDao.selectAllByPgNo(pg_no);
		addReviewInfo(reviews);
		return reviews;
	}
	
	//상품 옵션 이름 가져오기
	@Override
	public String getPrdName(int prd_no) {
		String prdName = reviewDao.selectPrdName(prd_no);
		return prdName;
	}
	
	//리뷰 검색 결과 가져오기
	@Override
	public List<Review> searchReviews(Map<String, Object> map) {
		List<Review> reviews = reviewDao.selectByKeyword(map);
		addReviewInfo(reviews);
		return reviews;
	}	
	
	//별점순으로 리뷰 가져오기
	@Override
	public List<Review> orderByRate(Map<String, Object> map) {
		List<Review> reviews = reviewDao.orderByRate(map);
		addReviewInfo(reviews);
		return reviews;
	}
	
	//날짜순으로 리뷰 가져오기
	@Override
	public List<Review> orderByDate(Map<String, Object> map) {
		List<Review> reviews = reviewDao.orderByDate(map);
		addReviewInfo(reviews);
		return reviews;
	}
	
	//별점별로 리뷰 가져오기
	@Override
	public List<Review> groupByRate(Map<String, Object> map) {
		List<Review> reviews = reviewDao.groupByRate(map);
		addReviewInfo(reviews);
		return reviews;
	}
	
	//리뷰 개수 가져오기
	@Override
	public int countReview(int pg_no) {
		int cnt = reviewDao.selectReviewCnt(pg_no);
		return cnt;
	}
	
	//별점별 리뷰 개수 가져오기
	@Override
	public int countRevWithRate(Map<String, Object> map) {
		int cnt = reviewDao.selectReviewCntWithRate(map);
		return cnt;
	}
	
	//페이지 별 리뷰 가져오기
	@Override
	public List<Review> getReviewsPaged(Map<String, Object> map) {
		List<Review> reviews = reviewDao.selectReviewsByPage(map);
		addReviewInfo(reviews);
		return reviews;
	}
	
	//리뷰에 필요한 추가 정보 가져오기
	public void addReviewInfo(List<Review> reviews) {
		SimpleDateFormat rformat = new SimpleDateFormat("yyyy.MM.dd");
		for(int i=0; i < reviews.size(); i++) {
			reviews.get(i).setUs_name(ordersService.getUserName(reviews.get(i).getOd_no()));
			reviews.get(i).setPrd_name(reviewService.getPrdName(reviews.get(i).getPrd_no()));
			reviews.get(i).setStr_date(rformat.format(reviews.get(i).getRev_date()));
		}
	}
}
