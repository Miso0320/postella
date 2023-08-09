package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	@Resource
	private MyPageService myPageService;
	
	/**
	 * 
	 * @param 파라미터명
	 * 		  파라미터 설명
	 * @param model
	 * 
	 **/
	@GetMapping("/myOrderList")
	public String myOrderList(
			Model model ) 
	{
		// us_no 나중엔 받아오기
		int us_no = 1;
		
		// 주문목록 전체 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("us_no", us_no);
		List<Orders> orders = myPageService.getOrderList(map);
		
		model.addAttribute("orders", orders);
		
		return "myPage/myOrderList/myOrderList";
	}


	
}
