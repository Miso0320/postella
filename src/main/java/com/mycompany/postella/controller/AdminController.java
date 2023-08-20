package com.mycompany.postella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {
	@GetMapping("/adminIndex")
	public String adminIndex() {
		return "sellerPage/adminIndex";
	}
	
	@GetMapping("/adminLoginForm")
	public String loginForm() {
		return "sellerPage/login";
	}
	
	@GetMapping("/productList")
	public String productList() {
		return "sellerPage/productList";
	}

}
