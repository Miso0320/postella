package com.mycompany.postella.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.Qna;
import com.mycompany.postella.dto.Review;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.dto.Wish;
import com.mycompany.postella.interceptor.Login;
import com.mycompany.postella.service.CartService;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.ProductGroupService;
import com.mycompany.postella.service.QnaService;
import com.mycompany.postella.service.ReviewService;
import com.mycompany.postella.service.WishService;
import com.mycompany.postella.service.productService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DetailViewController {
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private ProductGroupService productGroupService;
	
	@Autowired
	private productService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
    private WishService wishService;
	
	@Autowired
	private QnaService qnaService;
	/**
	 * 
	 * 상품 상세 페이지 가져오기
	 * 
	 * @param pg_no
	 * 			상품 그룹 번호
	 * @param model
	 * @param session
	 * 			HttpSession
	 * @return detailView/detailView
	 */
	@RequestMapping("/detailView")
	public String content(@RequestParam(defaultValue="1") int pg_no, Model model, HttpSession session) {
		model.addAttribute("pg_no",pg_no);
		
		Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    if(user != null) {
	    	int us_no = user.getUs_no();
	    	//찜 목록에 있는지 확인
			int inWish = wishService.checkWish(pg_no, us_no);
			model.addAttribute("wish", inWish);
	    } else {
	    	model.addAttribute("wish", 0);
	    }
		
		//상품 옵션 목록 가져오기
		List<Product> optionList = productService.getOptions(pg_no);
		Image optionImg; 
		int OptionPrd_no;
		
		for(int i=0; i < optionList.size(); i++) {
			OptionPrd_no = optionList.get(i).getPrd_no();
			optionImg = imageService.getImageByPrdNo(OptionPrd_no);
			optionList.get(i).setEncodedFile(optionImg.getEncodedFile());
		}
		Product selectedOption = optionList.get(0);
	
		model.addAttribute("options", optionList);
		model.addAttribute("selectedOption", selectedOption);
		
		//썸네일 리스트 불러오기
		List<Image> imgList = imageService.getImagesByprdNo(selectedOption.getPrd_no());
		
		model.addAttribute("thmImgs", imgList);
		
		//썸네일 리스트 중 대표 썸네일 불러오기
		Image tumnail = imgList.get(0);
		model.addAttribute("thumnail", tumnail);
		
		//상세 이미지 불러오기
		Image detailImg = imageService.getDetailImageByPgNo(pg_no);
		
		if(detailImg != null) {
			model.addAttribute("detailImg", detailImg);
		}
		
		//별점 평균 불러오기
		int starAgv = productService.getStarAvg(pg_no);
		model.addAttribute("stars", starAgv);
		
		//리뷰 개수 불러오기
		int revCnt = reviewService.countReview(pg_no);
		model.addAttribute("revCnt", revCnt);
		
		//상품명 불러오기!
		String title = productGroupService.getTitle(pg_no);
		model.addAttribute("title", title);
		
		//대표 Product 객체의 정보 가져오기
		int TopPrdNo = tumnail.getPrd_no();
		Product topPrd = productService.getInfo(TopPrdNo);
		
		//원가, 세일가, 할인율 가져오기
		int topPrdPrice = topPrd.getPrd_org_price();
		int topPrdSaleprice = topPrd.getPrd_price();
		model.addAttribute("TopPrdPrice", topPrdPrice);
		model.addAttribute("TopPrdSaleprice", topPrdSaleprice);
		double salePercent = (double)(topPrdPrice - topPrdSaleprice) / topPrdPrice * 100 ;
		int intSalePercent = (int)salePercent;
		model.addAttribute("intSalePercent", intSalePercent);
		
		//적립금 가져오기
		double dpoint = topPrdSaleprice * 0.01;
		int point = (int) dpoint;
		model.addAttribute("point", point);
		
		//배송 예정일 가져오기
		LocalDate today = LocalDate.now();
		LocalDate deliverDay = today.plusDays(2);
		DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("MM/dd");
		String StrDeliverDay = fomatter.format(deliverDay);
		model.addAttribute("deliverDay", StrDeliverDay);
		
		//별점 별 리뷰수 가져오기
		int[] reviewCntGroup = new int[5];
		Map<String, Object> rGmap = new HashMap<>();
		rGmap.put("pg_no", pg_no);
		
		for(int i=1; i<=5; i++) {
			rGmap.put("rate", i);
			reviewCntGroup[i-1] = reviewService.countRevWithRate(rGmap);
		}
		
		model.addAttribute("starRevCnt", reviewCntGroup);
		
		//문의 수 가져오기
		int totalQnas = qnaService.getTotalQnasCount(pg_no);
  	    model.addAttribute("totalQnas", totalQnas);
		
		return "detailView/detailView";
	}
	
	/**
	 * 상품 옵션 상세 페이지 보여주기
	 * 
	 * @param prdNo
	 * 			상품(옵션) 식별 번호
	 * @param model
	 * @return detailView/detailView
	 */
	@GetMapping("/setDetailPage")
	public String setDetailPage(@RequestParam(defaultValue="2") int prdNo, Model model, HttpSession session) {
		Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
		
		Product clikedOption  = productService.getInfo(prdNo);
		int pg_no = clikedOption.getPg_no();
		int prd_no = clikedOption.getPrd_no();
		model.addAttribute("pg_no",pg_no);
		
		if(user != null) {
	    	int us_no = user.getUs_no();
	    	//찜 목록에 있는지 확인
			int inWish = wishService.checkWish(pg_no, us_no);
			model.addAttribute("wish", inWish);
	    } else {
	    	model.addAttribute("wish", 0);
	    }
		
		//가격들 세팅
		model.addAttribute("TopPrdPrice", clikedOption.getPrd_org_price());
		model.addAttribute("TopPrdSaleprice", clikedOption.getPrd_price());
		double salePercent = (double)(clikedOption.getPrd_org_price() - clikedOption.getPrd_price()) / clikedOption.getPrd_org_price() * 100 ;
		int intSalePercent = (int)salePercent;
		model.addAttribute("intSalePercent", intSalePercent);
		
		//적립금 가져오기
		double dpoint = clikedOption.getPrd_price() * 0.01;
		int point = (int) dpoint;
		model.addAttribute("point", point);
		
		//썸네일 리스트 불러오기
		List<Image> imgList = imageService.getImagesByprdNo(prd_no);
		model.addAttribute("thmImgs", imgList);
		
		//썸네일 리스트 중 대표 썸네일 불러오기
		Image tumnail = imgList.get(0);
		model.addAttribute("thumnail", tumnail);
		
		//상세 이미지 불러오기
		Image detailImg = imageService.getDetailImageByPgNo(pg_no);
		if(detailImg != null) {
			model.addAttribute("detailImg", detailImg);
		}
		
		//상품 옵션 목록 가져오기
		List<Product> optionList = productService.getOptions(pg_no);
		Image optionImg; 
		int OptionPrd_no;
		
		for(int i=0; i < optionList.size(); i++) {
			OptionPrd_no = optionList.get(i).getPrd_no();
			optionImg = imageService.getImageByPrdNo(OptionPrd_no);
			optionList.get(i).setEncodedFile(optionImg.getEncodedFile());
		}
		model.addAttribute("options", optionList);
		
		clikedOption.setEncodedFile(imgList.get(0).getEncodedFile());
		model.addAttribute("selectedOption", clikedOption);
		
		//상품명 불러오기
		String title = productGroupService.getTitle(pg_no);
		model.addAttribute("title", title);
		
		//별점 평균 불러오기
		int starAgv = productService.getStarAvg(pg_no);
		model.addAttribute("stars", starAgv);
		
		//리뷰 개수 불러오기
		int revCnt = reviewService.countReview(pg_no);
		model.addAttribute("revCnt", revCnt);
		
		//배송 예정일 가져오기
		LocalDate today = LocalDate.now();
		LocalDate deliverDay = today.plusDays(2);
		DateTimeFormatter fomatter = DateTimeFormatter.ofPattern("MM/dd");
		String StrDeliverDay = fomatter.format(deliverDay);
		model.addAttribute("deliverDay", StrDeliverDay);
		
		//별점 별 리뷰수 가져오기
		int[] reviewCntGroup = new int[5];
		Map<String, Object> rGmap = new HashMap<>();
		rGmap.put("pg_no", pg_no);
		
		for(int i=1; i<=5; i++) {
			rGmap.put("rate", i);
			reviewCntGroup[i-1] = reviewService.countRevWithRate(rGmap);
		}
		
		model.addAttribute("starRevCnt", reviewCntGroup);
		
		//문의 수 가져오기
		int totalQnas = qnaService.getTotalQnasCount(pg_no);
  	    model.addAttribute("totalQnas", totalQnas);
		
		return "detailView/detailView";
	}
	
	/**
	 * 리뷰 불러오기(AJAX)
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param page
	 * 			페이지 번호
	 * @return Map<String, Object>
	 */
	@RequestMapping("/getReviewFromDB")
    @ResponseBody
    public Map<String, Object> getReviewFromDB(@RequestParam("pg_no") int pg_no, @RequestParam("page") int page) {
		int itemsPerPage = 5; // 페이지 당 아이템 수
		int totalReviews = reviewService.countReview(pg_no);
		int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage); //총 페이지 수
		int startRow = (page - 1) * itemsPerPage + 1; //시작 페이지
	    int endRow = page * itemsPerPage; //끝 페이지

	    Map<String, Object> map = new HashMap<>();
	    map.put("pg_no", pg_no);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
	    List<Review> reviews = reviewService.getReviewsPaged(map);
	    
	    Map<String, Object> result = new HashMap<>();
	    result.put("reviews", reviews);
	    result.put("totalPages", totalPages);

	    return result;
    }
	
	/**
	 * 리뷰 별점순으로 가져오기(AJAX)
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param page
	 * 			페이지 번호
	 * @return Map<String, Object>
	 */
	@RequestMapping("/orderByStar")
    @ResponseBody
    public Map<String, Object> orderByStar(@RequestParam("pg_no") int pg_no, @RequestParam("page") int page) {
		int itemsPerPage = 5;
	    int totalReviews = reviewService.countReview(pg_no);
	    int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage);

	    int startRow = (page - 1) * itemsPerPage + 1; //시작 페이지
	    int endRow = page * itemsPerPage; //끝 페이지

	    Map<String, Object> map = new HashMap<>();
	    map.put("pg_no", pg_no);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);

	    List<Review> reviews = reviewService.orderByRate(map);

	    Map<String, Object> result = new HashMap<>();
	    result.put("reviews", reviews);
	    result.put("totalPages", totalPages);

	    return result;
    }
	
	/**
	 * 리뷰 최신순으로 가져오기(AJAX)
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param page
	 * 			페이지 번호
	 * @return Map<String, Object>
	 */
	@RequestMapping("/orderByDate")
    @ResponseBody
    public Map<String, Object> orderByDate(@RequestParam("pg_no") int pg_no, @RequestParam("page") int page) {
		int itemsPerPage = 5;
	    int totalReviews = reviewService.countReview(pg_no);
	    int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage);

	    int startRow = (page - 1) * itemsPerPage + 1; //시작 페이지
	    int endRow = page * itemsPerPage; //끝 페이지

	    Map<String, Object> map = new HashMap<>();
	    map.put("pg_no", pg_no);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
		List<Review> reviews = reviewService.orderByDate(map);
		
		Map<String, Object> result = new HashMap<>();
	    result.put("reviews", reviews);
	    result.put("totalPages", totalPages);
		
	    return result;
    }
	
	/**
	 * 리뷰 검색하기(AJAX)
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param keyword
	 * 			검색어
	 * @param page
	 * 			페이지 번호
	 * @return Map<String, Object>
	 */
	@RequestMapping("/searchReview")
    @ResponseBody
    public Map<String, Object> searchReview(@RequestParam("pg_no") int pg_no, @RequestParam("keyword") String keyword, @RequestParam("page") int page) {
		int itemsPerPage = 5;
	    int totalReviews = reviewService.countReview(pg_no);
	    int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage);

	    int startRow = (page - 1) * itemsPerPage + 1; //시작 페이지
	    int endRow = page * itemsPerPage; //끝 페이지

	    Map<String, Object> map = new HashMap<>();
	    map.put("pg_no", pg_no);
	    map.put("keyword", keyword);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
		List<Review> reviews = reviewService.searchReviews(map);
		
		Map<String, Object> result = new HashMap<>();
	    result.put("reviews", reviews);
	    result.put("totalPages", totalPages);
		
	    return result;
    }
	
	/**
	 * 리뷰 별점별로 보기(AJAX)
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param starAmount
	 * 			별점
	 * @param page
	 * 			페이지 번호
	 * @return Map<String, Object>
	 */
	@RequestMapping("/groupByStar")
	@ResponseBody
	public Map<String, Object> groupByStar(@RequestParam("pg_no") int pg_no, @RequestParam("starAmount") int starAmount, @RequestParam("page") int page) {
		int itemsPerPage = 5;
		Map<String, Object> cntMap = new HashMap<>();
		cntMap.put("pg_no", pg_no);
		cntMap.put("rate", starAmount);
	    int totalReviews = reviewService.countRevWithRate(cntMap);
	    int totalPages = (int) Math.ceil((double) totalReviews / itemsPerPage);

	    int startRow = (page - 1) * itemsPerPage + 1; //시작 페이지
	    int endRow = page * itemsPerPage; //끝 페이지

	    Map<String, Object> map = new HashMap<>();
	    map.put("pg_no", pg_no);
	    map.put("starAmount", starAmount);
	    map.put("startRow", startRow);
	    map.put("endRow", endRow);
		
		List<Review> reviews = reviewService.groupByRate(map);
		
		Map<String, Object> result = new HashMap<>();
	    result.put("reviews", reviews);
	    result.put("totalPages", totalPages);
		
	    return result;
	}
	
	/**
	 * 장바구니 담기
	 * 
	 * @param quantity
	 * 			수량
	 * @param prdNo
	 * 			상품 옵션 식별 번호
	 * @param session
	 * 			HttpSession
	 * @return ResponseEntity<String>
	 */
	@PostMapping("/detailView/cartAdd")
	@Login
	@ResponseBody
    public ResponseEntity<String> addToCart(@RequestParam("quantity") int quantity, @RequestParam("prdNo") int prdNo, HttpSession session) {
		Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
		 
	    int usNo = user.getUs_no();
	    // 장바구니에 해당 상품이 이미 담겨있는지 검사
		Map<String, Object> map = new HashMap<>();
		map.put("us_no", usNo);
		map.put("prd_no", prdNo);
		
	    Cart existingCart = cartService.getCart(map);

	    if (existingCart != null) {
	        // 이미 카트에 존재하는 경우, 수량 업데이트
	        existingCart.setCrt_qty(existingCart.getCrt_qty() + quantity);
	        cartService.updateCart(existingCart);
	    } else {
	        // 카트에 없는 경우, 새로 추가
	        Cart cart = new Cart();
	        cart.setUs_no(usNo);
	        cart.setPrd_no(prdNo);
	        cart.setCrt_qty(quantity);
	        cartService.addToCart(cart);
	    }
	    
        return ResponseEntity.ok("success");
    }
	
	/**
	 * 찜 목록에 추가하기
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param session
	 * 			HttpSession
	 * @return ResponseEntity<String>
	 */
	@PostMapping("/insertWish")
	@Login
    public ResponseEntity<String> insertWish(@RequestParam("pg_no") int pg_no, HttpSession session) {
		Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
		int usNo = user.getUs_no();
		log.info("usNo"+usNo);
		Wish wish = new Wish();
		wish.setPg_no(pg_no);
		wish.setUs_no(usNo);
        wishService.addWish(wish);
        return new ResponseEntity<>("찜 목록 추가 성공", HttpStatus.OK);
    }
	
	/**
	 * 찜 목록에서 삭제하기
	 * 
	 * @param pg_no
	 * 			상품 그룹 식별 번호
	 * @param session
	 * 			HttpSession
	 * @return ResponseEntity<String>
	 */
    @PostMapping("/deleteWish")
    @Login
    public ResponseEntity<String> deleteWish(@RequestParam("pg_no") int pg_no, HttpSession session) {
    	Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    int usNo = user.getUs_no();
    	Wish wish = new Wish();
		wish.setPg_no(pg_no);
		wish.setUs_no(usNo);
    	wishService.removeWish(wish);
        return new ResponseEntity<>("찜 목록 삭제 성공", HttpStatus.OK);
    }
    
    /**
     * 상품문의 불러오기
     * 
     * @param pg_no
     * 			상품 그룹 식별 번호
     * @param page
     * 			페이지 번호
     * @param model
     * @return Map<String, Object>
     */
  	@RequestMapping("/getQnaFromDB")
	@ResponseBody
	public Map<String, Object> getQnaFromDB(@RequestParam("pg_no") int pg_no, @RequestParam("page") int page, Model model) {
  		int itemsPerPage = 5; // 페이지 당 아이템 수

  	    int totalQnas = qnaService.getTotalQnasCount(pg_no);
  	    int totalPages = (int) Math.ceil((double) totalQnas / itemsPerPage);

  	    int startRow = (page - 1) * itemsPerPage + 1;
  	    int endRow = page * itemsPerPage;

  	    Map<String, Object> map = new HashMap<>();
  	    map.put("pg_no", pg_no);
  	    map.put("startRow", startRow);
  	    map.put("endRow", endRow);
  	    List<Qna> qnas = qnaService.getQnasPaged(map);
  	    
  	    Map<String, Object> result = new HashMap<>();
  	    result.put("qnas", qnas);
  	    result.put("totalPages", totalPages);

  	    return result;
  		
	}
  	
  	/**
  	 * 문의 작성하기
  	 * @param model
  	 * @return
  	 */
  	@GetMapping("/writeQna")
    public String addAddress(Model model) {
        
        return "detailView/qna"; 
    }
	
}
