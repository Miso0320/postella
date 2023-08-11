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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.interceptor.Login;
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
	private CartService cartService;
	
	
	/**
	 * 
	 * @param us_no
	 * @param model
	 * @return
	 */
	@Login
	@GetMapping("/myOrderList")
	public String myOrderList(
			@RequestParam(name = "od_detail_no", defaultValue="1", required = true) int us_no,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "requestYear", required = false) String requestYear,
			Model model ) throws Exception {
		
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
		
		List<Orders> orders = myPageService.getOrderList(map);
		
		// 상품 이미지 가져오기
		Image images = null;
		
		for(int i = 0; i < orders.size(); i++) {
			images = imageService.getImageByPrdNo(orders.get(i).getPrd_no());
			orders.get(i).setImg_type(images.getImg_type());
			orders.get(i).setEncodedFile(Base64.getEncoder().encodeToString(images.getImg_file()));
		}
		
		model.addAttribute("orders", orders);
		
		return "myPage/myOrderList/myOrderList";
	}
	
	@GetMapping("/deleteOrder")
	public String deleteOrder(@RequestParam(name = "od_detail_no", required = true) int od_detail_no) {
		myPageService.removeOrder(od_detail_no);
		return "redirect:/myOrderList";
	}

}
