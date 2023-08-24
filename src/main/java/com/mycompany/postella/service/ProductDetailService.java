package com.mycompany.postella.service;

import java.util.List;
import java.util.Map;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.Qna;
import com.mycompany.postella.dto.Review;
import com.mycompany.postella.dto.Wish;

/**
 * 
 * @author 이송미
 *
 */
public interface ProductDetailService {
	
	// 찜 목록에 있는지 검사
	public int checkWish(int pg_no, int us_no);
	
	// 상품 옵션 목록 가져오기
	public List<Product> getOptions(int pg_no);
	
	// 상품 옵션 대표 이미지 가져오기
	public Image getImageByPrdNo(int prd_no);
	
	// 상품 옵션 이미지들 가져오기
	public List<Image> getImagesByprdNo(int prd_no);
	
	// 상품 상세이미지 가져오기
	public Image getDetailImageByPgNo(int pg_no);
	
	// 별점 평균 가져오기
	public int getStarAvg(int pg_no);
	
	// 리뷰 개수 가져오기
	public int countReview(int pg_no);
	
	// 상품명 불러오기
	public String getTitle(int pg_no);
	
	// 상품 정보 가져오기
	public Product getInfo(int prd_no);
	
	// 별점별 리뷰 개수 가져오기
	public int countRevWithRate(Map<String, Object> map);
	
	// 상품 문의 개수 가져오기
	public int getTotalQnasCount(int pg_no);
	
	// 페이지 별 리뷰 가져오기
	public List<Review> getReviewsPaged(Map<String, Object> map);
	
	// 별점순으로 리뷰 가져오기
	public List<Review> orderByRate(Map<String, Object> map);
	
	// 날짜순으로 리뷰 가져오기
	public List<Review> orderByDate(Map<String, Object> map);
	
	// 리뷰 검색 결과 가져오기
	public List<Review> searchReviews(Map<String, Object> map);
	
	// 별점별로 리뷰 가져오기
	public List<Review> groupByRate(Map<String, Object> map);
	
	// 장바구니에 담긴 상품 하나 검색
	public Cart getCart(Map<String, Object> map);
	
	// 장바구니 업데이트
	public void updateCart(Cart cart);
	
	// 장바구니에 상품 담기
	public void addToCart(Cart cart);
	
	// 찜 목록에 추가하기
	public void addWish(Wish wish);
	
	// 찜 목록에서 삭제하기
	public void removeWish(Wish wish);
	
	// 페이지별 상품 문의 가져오기
	public List<Qna> getQnasPaged(Map<String, Object> map);
	
	// 문의 등록하기
	public void putQna(Qna qna);
}
