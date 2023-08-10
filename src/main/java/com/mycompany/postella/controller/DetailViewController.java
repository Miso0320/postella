package com.mycompany.postella.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mycompany.postella.dto.Review;
import com.mycompany.postella.dto.Wish;
import com.mycompany.postella.service.CartService;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.OrdersService;
import com.mycompany.postella.service.ProductGroupService;
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
	private OrdersService ordersService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
    private WishService wishService;
	
	@RequestMapping("/detailView")
	public String content(@RequestParam(defaultValue="1") int pg_no, Model model) {
		pg_no = 3;
		model.addAttribute("pg_no",pg_no);
		//상품 옵션 목록 가져오기
		List<Product> optionList = productService.getOptions(pg_no);
		Image optionImg; 
		int OptionPrd_no;
		
		for(int i=0; i < optionList.size(); i++) {
			OptionPrd_no = optionList.get(i).getPrd_no();
			optionImg = imageService.getImageByPrdNo(OptionPrd_no);
			if(optionImg.getImg_file() != null) {
				optionList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(optionImg.getImg_file()));
			}
		}
		Product selectedOption = optionList.get(0);
	
		model.addAttribute("options", optionList);
		model.addAttribute("selectedOption", selectedOption);
		
		//썸네일 리스트 불러오기
		List<Image> imgList = imageService.getImagesByprdNo(selectedOption.getPrd_no());
		
		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
			}
		}
		model.addAttribute("thmImgs", imgList);
		
		//썸네일 리스트 중 대표 썸네일 불러오기
		Image tumnail = imgList.get(0);
		model.addAttribute("thumnail", tumnail);
		
		//별점 평균 불러오기
		int starAgv = productService.getStarAvg(pg_no);
		model.addAttribute("stars", starAgv);
		
		//리뷰 개수 불러오기
		int revCnt = reviewService.countReview(pg_no);
		model.addAttribute("revCnt", revCnt);
		
		//상품명 불러오기
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
		
		//리뷰 목록 가져오기
		List<Review> reviews = getReviewFromDB(pg_no);
		model.addAttribute("reviews", reviews);
		
		//별점 별 리뷰수 가져오기
		int[] reviewCntGroup = new int[5];
		Map<String, Object> rGmap = new HashMap<>();
		rGmap.put("pg_no", pg_no);
		
		for(int i=1; i<=5; i++) {
			rGmap.put("rate", i);
			reviewCntGroup[i-1] = reviewService.countRevWithRate(rGmap);
		}
		
		model.addAttribute("starRevCnt", reviewCntGroup);
		
		return "detailView/detailView";
	}
	
	@GetMapping("/setDetailPage")
	public String setDetailPage(@RequestParam(defaultValue="2") int prdNo, Model model) {
		Product clikedOption  = productService.getInfo(prdNo);
		int pg_no = clikedOption.getPg_no();
		int prd_no = clikedOption.getPrd_no();
		model.addAttribute("pg_no",pg_no);
		
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
		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
			}
		}
		model.addAttribute("thmImgs", imgList);
		
		//썸네일 리스트 중 대표 썸네일 불러오기
		Image tumnail = imgList.get(0);
		model.addAttribute("thumnail", tumnail);
		
		//상품 옵션 목록 가져오기
		List<Product> optionList = productService.getOptions(pg_no);
		Image optionImg; 
		int OptionPrd_no;
		
		for(int i=0; i < optionList.size(); i++) {
			OptionPrd_no = optionList.get(i).getPrd_no();
			optionImg = imageService.getImageByPrdNo(OptionPrd_no);
			if(optionImg.getImg_file() != null) {
				optionList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(optionImg.getImg_file()));
				optionList.get(i).setImg_type(optionImg.getImg_type());
			}
		}
		model.addAttribute("options", optionList);
		//인코딩
		clikedOption.setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(0).getImg_file()));
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
		
		//리뷰 목록 가져오기
		List<Review> reviews = getReviewFromDB(pg_no);
		model.addAttribute("reviews", reviews);
		
		//별점 별 리뷰수 가져오기
		int[] reviewCntGroup = new int[5];
		Map<String, Object> rGmap = new HashMap<>();
		rGmap.put("pg_no", pg_no);
		
		for(int i=1; i<=5; i++) {
			rGmap.put("rate", i);
			reviewCntGroup[i-1] = reviewService.countRevWithRate(rGmap);
		}
		
		model.addAttribute("starRevCnt", reviewCntGroup);
		
		
		return "detailView/detailView";
	}
	//리뷰 불러오기
	@RequestMapping("/getReviewFromDB")
    @ResponseBody
    public List<Review> getReviewFromDB(@RequestParam("pg_no") int pg_no) {
		List<Review> reviews = reviewService.getAllReviews(pg_no);
		
        return reviews; 
    }
	
	//리뷰 별점순으로 가져오기
	@RequestMapping("/orderByStar")
    @ResponseBody
    public ResponseEntity<List<Review>> orderByStar(@RequestParam("pg_no") int pg_no) {
		List<Review> reviews = reviewService.orderByRate(pg_no);
		
        return ResponseEntity.ok(reviews);
    }
	
	//리뷰 최신순으로 가져오기
	@RequestMapping("/orderByDate")
    @ResponseBody
    public ResponseEntity<List<Review>> orderByDate(@RequestParam("pg_no") int pg_no) {
		List<Review> reviews = reviewService.orderByDate(pg_no);
		
        return ResponseEntity.ok(reviews);
    }
	
	//리뷰 검색하기
	@RequestMapping("/searchReview")
    @ResponseBody
    public ResponseEntity<List<Review>> searchReview(@RequestParam("pg_no") int pg_no, @RequestParam("keyword") String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("pg_no", pg_no);
		map.put("keyword", keyword);
		
		List<Review> reviews = reviewService.searchReviews(map);
		
        return ResponseEntity.ok(reviews);
    }
	
	//리뷰 별점별로 보기
	@RequestMapping("/groupByStar")
	@ResponseBody
	public ResponseEntity<List<Review>> orderByStar(@RequestParam("pg_no") int pg_no, @RequestParam("starAmount") int starAmount) {
		Map<String, Object> map = new HashMap<>();
		map.put("pg_no", pg_no);
		map.put("starAmount", starAmount);
		
		List<Review> reviews = reviewService.groupByRate(map);
	    return ResponseEntity.ok(reviews);
	}

	@PostMapping("/detailView/cartAdd")
    @ResponseBody
    public String addToCart(@RequestParam("quantity") int quantity, @RequestParam("prdNo") int prdNo) {
		int usNo = 1;
        
		Cart cart = new Cart();
        
        cart.setUs_no(usNo);
        cart.setPrd_no(prdNo);
        cart.setCrt_qty(quantity);
        
		cartService.addToCart(cart);
        return "success";
    }
	
	@PostMapping("/insertWish")
    public ResponseEntity<String> insertWish(@RequestParam("pg_no") int pg_no) {
		int usNo = 1;
		Wish wish = new Wish();
		wish.setPg_no(pg_no);
		wish.setUs_no(usNo);
        wishService.addWish(wish);
        return new ResponseEntity<>("찜 목록 추가 성공", HttpStatus.OK);
    }

    @PostMapping("/deleteWish")
    public ResponseEntity<String> deleteWish(@RequestParam("pg_no") int pg_no) {
    	int usNo = 1;
    	Wish wish = new Wish();
		wish.setPg_no(pg_no);
		wish.setUs_no(usNo);
    	wishService.removeWish(wish);
        return new ResponseEntity<>("찜 목록 삭제 성공", HttpStatus.OK);
    }
	
}
