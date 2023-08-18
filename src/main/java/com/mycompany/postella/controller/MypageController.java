package com.mycompany.postella.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.service.CartService;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	@Resource
	private MyPageService myPageService;
	
	@Resource
	private ImageService imageService;
	
	@Resource
	CartService cartService;
	
	/**
	 * 
	 * 마이페이지 주문목록 가져오기
	 * 
	 * @param keyword
	 * 			검색어
	 * @param requestYear
	 * 			연도별 필터
	 * @param pageNo
	 * 			현재 페이지 번호
	 * @param model
	 * 			Model
	 * @param session
	 * 			HttpSession
	 * @return	myPage/myOrderList/myOrderList
	 * @throws Exception
	 */
	/*@Login*/
	@GetMapping("/myOrderList")
	public String myOrderList(
			@RequestParam(name = "keyword", required = false) 
			String keyword,
			@RequestParam(name = "requestYear", required = false)
			String requestYear,
			@RequestParam(name="pageNo", required=false)
			String pageNo,
			Model model, HttpSession session ) throws Exception {
		
		// 유저식별번호 가져오기
		/*Users users = (Users) session.getAttribute("userLogin");
		int us_no = users.getUs_no();*/
		int us_no = 121;
		
		// 주문목록 전체 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("us_no", us_no);
		
		// 검색 기능 추가
		if(keyword != null) {
			map.put("keyword", keyword);
		}
		
		// 연도별 목록
		// 연도별 날짜를 불러올 때 사용할 변수
		int year = 0;
		int startMonth = 1;
		int startDay = 1;
		int endMonth = 12;
		int endDay = 31;
		Date startDate = null;
		Date endDate = null;
		
        if(requestYear != null) {
        	if(requestYear.equals("2020year")) {
    			year = 2020;
    		} else if(requestYear.equals("2021year")) {
    			year = 2021;
    		} else if(requestYear.equals("2022year")) {
    			year = 2022;
    		} else if(requestYear.equals("2023year")) {
    			year = 2023;
    		}
        	
        	LocalDate localStartDate = LocalDate.of(year, startMonth, startDay);
        	startDate = Date.from(localStartDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
            
            LocalDate localEndDate = LocalDate.of(year, endMonth, endDay);
            endDate = Date.from(localEndDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
            
            // 최근 6개월
            if(requestYear.equals("recent6Month")) {
            	Calendar calendar = Calendar.getInstance();
                Date today = calendar.getTime();
                
                calendar.add(Calendar.MONTH, -6);
                Date sixMonthsAgo = calendar.getTime();
                
                startDate = sixMonthsAgo;
                endDate = today;
            }
            
            // Date -> String 변환
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
            String startDateStr = dateFormat.format(startDate);
            String endDateStr = dateFormat.format(endDate);
            
            map.put("startDate", startDateStr);
            map.put("endDate", endDateStr);
            map.put("requestYear", requestYear);
        }
        
        // 페이징 객체 생성
        if(pageNo == null) {
        	pageNo = "1";
        }
        
        int intpageNo = Integer.parseInt(pageNo);
        int totalOrderNum = myPageService.getTotalOrderNum(map);
        
        Pager pager = new Pager(6, 10, totalOrderNum, intpageNo);
        map.put("pager", pager);
		
        // 주문목록 가져오기
		List<Orders> orders = myPageService.getOrderList(map);
		
		// 주문목록 이미지 가져오기
		Image orderImages = null;
		
		for(int i = 0; i < orders.size(); i++) {
			orderImages = imageService.getImageByPrdNo(orders.get(i).getPrd_no());
			orders.get(i).setImg_type(orderImages.getImg_type());
			orders.get(i).setEncodedFile(Base64.getEncoder().encodeToString(orderImages.getImg_file()));
		}
		
		// 사이드바 장바구니 목록 가져오기
		List<Cart> carts = cartService.getProductCart(us_no);
		
		// 장바구니 이미지 가져오기
		Image cartImages = null;
		
		for(int i = 0; i < carts.size(); i++) {
			cartImages = imageService.getImageByPrdNo(carts.get(i).getPrd_no());
			carts.get(i).setImg_type(cartImages.getImg_type());
			carts.get(i).setEncodedFile(Base64.getEncoder().encodeToString(cartImages.getImg_file()));
		}
		
		int totalCartCnt = cartService.getTotalCartCnt(us_no);
		
		model.addAttribute("orders", orders);
		model.addAttribute("pager", pager);
		model.addAttribute("keyword", keyword);
		model.addAttribute("requestYear", requestYear);
		model.addAttribute("carts", carts);
		model.addAttribute("totalCartCnt", totalCartCnt);
		
		return "myPage/myOrderList/myOrderList";
	}
	
	/**
	 * 
	 * 마이페이지 주문목록 삭제하기
	 * 
	 * @param od_detail_no
	 * 			개별주문식별번호
	 * @param us_no
	 * 			회원고유번호
	 * @param od_no
	 * 			주문식별번호
	 * @param od_item_cnt
	 * 			주문상품 종류의 개수
	 * @return redirect:/myOrderList
	 */
	@RequestMapping("/deleteOrder")
	public String deleteOrder(
			@RequestParam(name = "od_detail_no", required = true) int od_detail_no,
			@RequestParam(name = "us_no", required = false) int us_no,
			@RequestParam(name = "od_no", required = false) int od_no,
			@RequestParam(name = "od_item_cnt", required = false) int od_item_cnt
			) {
		
		myPageService.updateOrderDelete(us_no, od_no, od_item_cnt);
		myPageService.removeOrder(od_detail_no);
		return "redirect:/myOrderList";
	}
	
	/**
	 * 
	 * 사이드바 장바구니 항목 삭제
	 * 
	 * @param prd_no
	 * 			상품식별번호
	 * @return	redirect:/myOrderList
	 */
	@RequestMapping("/deleteCartInOrderList")
	public String deleteCartInOrderList(
			@RequestParam(name = "prd_no", required = true) int prd_no) {
		
		/*Users users = (Users) session.getAttribute("userLogin");
		int us_no = users.getUs_no();*/
		int us_no = 121;
		
		Map<String, Object> map = new HashMap<>();
		map.put("prd_no", prd_no);
		map.put("us_no", us_no);
		
		cartService.deleteToCart(map);
		
		return "redirect:/myOrderList";
	}
	
	@RequestMapping("/addCartInOrderList")
	public String addCartInOrderList(
			@RequestParam(name = "prd_no", required = true) int prd_no) {
		
		/*Users users = (Users) session.getAttribute("userLogin");
		int us_no = users.getUs_no();*/
		int us_no = 121;
		
		int crt_qty = 1;
		
		// 카트객체 생성
		Cart cart = new Cart();
		cart.setUs_no(us_no);
		cart.setPrd_no(prd_no);
		cart.setCrt_qty(crt_qty);
		
		// 비교를 위해 사용자의 장바구니 목록 가져오기
		List<Cart> carts = cartService.getProductCart(us_no);
		
		// 사용자의 장바구니에 상품이 있는지 여부 확인
		boolean existProduct = false;
		
		// 이미 담겨있는 상품의 경우 수량 +1
		for(int i = 0; i < carts.size(); i++) {
			if(carts.get(i).getPrd_no() == prd_no) {
				// 장바구니에 상품이 있음을 저장
				existProduct = true;
				
				// 장바구니에 수량을 +1
				crt_qty = cart.getCrt_qty();
				crt_qty++;
				cart.setCrt_qty(crt_qty);
				cartService.updateCart(cart);
			} 
		}
		
		// 사용자의 장바구니에 해당 상품이 없는 경우
		if(!existProduct) {
			// 장바구니에 상품 추가
			cartService.addToCart(cart);
		}
		
		// ajax로 값 넘기기 수정 필요!!!
		return "redirect:/myOrderList";
	}

}
