package com.mycompany.postella.service;

import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.postella.dao.CartDao;
import com.mycompany.postella.dao.ImageDao;
import com.mycompany.postella.dao.ProductDao;
import com.mycompany.postella.dao.ProductGroupDao;
import com.mycompany.postella.dao.QnaDao;
import com.mycompany.postella.dao.ReviewDao;
import com.mycompany.postella.dao.WishDao;
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
@Service
public class ProductDetailServiceImpl implements ProductDetailService{
	
	@Autowired
	private WishDao wishDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private QnaDao qnaDao;
	
	@Autowired
	private ProductGroupDao productGroupDao;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ReviewService reviewService;
	
	//찜 목록에 있는지 검사
	@Override
	public int checkWish(int pg_no, int us_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("pg_no", pg_no);
		map.put("us_no", us_no);
		int result = wishDao.selectWish(map);
		return result;
	}
	
	//상품 옵션 목록 가져오기
	@Override
	public List<Product> getOptions(int pg_no) {
		List<Product> options = productDao.selectAllByPgNo(pg_no);
		return options;
	}
	
	//상품 옵션 대표 이미지 가져오기
	@Override
	public Image getImageByPrdNo(int prd_no) {
		Image image = imageDao.selectByPrdNo(prd_no);
		encodeImg(image);
		return image;
	}
	
	//상품 옵션 이미지들 가져오기
	@Override
	public List<Image> getImagesByprdNo(int prd_no) {
		List<Image> imgs = imageDao.selectAllByPrdNo(prd_no);
		encodeImgList(imgs);
	    return imgs;
	}
	
	//상품 상세이미지 가져오기
	@Override
	public Image getDetailImageByPgNo(int pg_no) {
		Image img = imageDao.selectdetailImg(pg_no);
		if(img != null) {
			encodeImg(img);
			return img;
		} else {
			return null;
		}
	}
	
	//별점 평균 가져오기
	@Override
	public int getStarAvg(int pg_no) {
		int starAvg = productDao.selectStarAvg(pg_no);
	    return starAvg;
	}
	
	//리뷰 개수 가져오기
	@Override
	public int countReview(int pg_no) {
		int cnt = reviewDao.selectReviewCnt(pg_no);
		return cnt;
	}
	
	//상품명 불러오기
	@Override
	public String getTitle(int pg_no) {
		String title = productGroupDao.selectTitleByPgNo(pg_no);
		return title;
	}
	
	//상품 정보 가져오기
	@Override
	public Product getInfo(int prd_no) {
		Product prd = productDao.selectByPrdNo(prd_no);
		return prd;
	}
	
	//별점별 리뷰 개수 가져오기
	@Override
	public int countRevWithRate(Map<String, Object> map) {
		int cnt = reviewDao.selectReviewCntWithRate(map);
		return cnt;
	}
	
	//상품 문의 개수 가져오기
	@Override
	public int getTotalQnasCount(int pg_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//페이지 별 리뷰 가져오기
	@Override
	public List<Review> getReviewsPaged(Map<String, Object> map) {
		List<Review> reviews = reviewDao.selectReviewsByPage(map);
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
	
	//리뷰 검색 결과 가져오기
	@Override
	public List<Review> searchReviews(Map<String, Object> map) {
		List<Review> reviews = reviewDao.selectByKeyword(map);
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
	
	// 장바구니에 담긴 상품 하나 검색
	@Override
	public Cart getCart(Map<String, Object> map) {
		Cart cart = cartDao.selectCart(map);
		return cart;
	}
	
	// 장바구니 업데이트
	@Override
	public void updateCart(Cart cart) {
		cartDao.updateCart(cart);
	}
	
	// 장바구니에 상품 담기
	@Override
	public void addToCart(Cart cart) {
		cartDao.insertPrdToCart(cart);
	}
	
	//찜 목록에 추가하기
	@Override
	public void addWish(Wish wish) {
		wishDao.insertWish(wish);
	}
	
	//찜 목록에서 삭제하기
	@Override
	public void removeWish(Wish wish) {
		wishDao.deleteWish(wish);
	}
	
	//페이지별 상품 문의 가져오기
	@Override
	public List<Qna> getQnasPaged(Map<String, Object> map) {
		List<Qna> qna = qnaDao.selectQnasByPage(map);
		addQnaInfo(qna);
		return qna;
	}
	
	//문의 등록하기
	@Override
	public void putQna(Qna qna) {
		qna.setSel_name(qnaDao.selectSelName(qna.getPg_no()));
		qnaDao.insertQna(qna);
	}
	
	//이미지 리스트 인코딩
	public List<Image> encodeImgList(List<Image> imgList) {

		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
				imgList.get(i).setNullOrnot(true);
			} else {
				imgList.get(i).setNullOrnot(false);
			}
		}
		
		return imgList;
	}
	
	//이미지 인코딩
	public Image encodeImg(Image img) {

		if(img.getImg_file() != null) {
			img.setEncodedFile(Base64.getEncoder().encodeToString(img.getImg_file()));
			img.setNullOrnot(true);
		} else {
			img.setNullOrnot(false);
		}
		
		return img;
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
	
	//상품 문의에 필요한 정보 추가하기
	public void addQnaInfo(List<Qna> qnas) {
		SimpleDateFormat rformat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		for(int i=0; i < qnas.size(); i++) {
			qnas.get(i).setPrd_name(qnaDao.selectPrdName(qnas.get(i).getPrd_no()));
			qnas.get(i).setSel_name(qnaDao.selectSelName(qnas.get(i).getPg_no()));
			qnas.get(i).setStringQdate(rformat.format(qnas.get(i).getQ_date()));
			if(qnas.get(i).getA_date() != null) {
				qnas.get(i).setStringAdate(rformat.format(qnas.get(i).getA_date()));
			}
		}
	}
	@Override
	public Map<String, Object> getPrdDetailInfo(int us_no, int pg_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
