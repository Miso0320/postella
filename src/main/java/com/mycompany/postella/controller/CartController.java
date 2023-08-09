package com.mycompany.postella.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Agreement;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.service.JoinService;
import com.mycompany.postella.service.JoinService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	
	@GetMapping("/cartNormal")
	public String joinForm() {
		return "cartNormal/cartNormal";
	}
	//테스트22
}
