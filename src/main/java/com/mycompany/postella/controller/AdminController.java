package com.mycompany.postella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김미소
 *
 */
@Slf4j
@Controller
public class AdminController {
	/**
	 * 
	 * 판매자 페이지 메인
	 * 
	 * @return	sellerPage/adminIndex
	 */
	@GetMapping("/adminIndex")
	public String adminIndex() {
		return "sellerPage/adminIndex";
	}
	
	/**
	 * 
	 * 판매자 페이지 로그인
	 * 
	 * @return	sellerPage/login
	 */
	@GetMapping("/adminLoginForm")
	public String loginForm() {
		return "sellerPage/login";
	}
	
	/**
	 * 
	 * 판매자 페이지 상품 목록
	 * 
	 * @return	sellerPage/productList
	 */
	@GetMapping("/productList")
	public String productList() {
		return "sellerPage/productList";
	}

}
