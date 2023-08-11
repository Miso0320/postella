package com.mycompany.postella.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.interceptor.Login;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	
	@GetMapping("/cartNormal")
	@Login
	public String joinForm() {
		return "cartNormal/cartNormal";
	}
	
	@GetMapping("/getCartList")

	@PostMapping("/addCart")
	@ResponseBody
	public ResponseEntity<String> addCart(@RequestBody Cart cart) {
		log.info("피알디" + cart.getPrd_no());
		log.info("유저" + cart.getUs_no());
		log.info("수량" + cart.getCrt_qty());
		
		return ResponseEntity.ok("success");
	}
	
}
