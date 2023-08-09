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
public class UserController {
	@Resource
	private JoinService joinService;
	
	// 회원가입
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}
	
	/**
	 * 
	 * @param users
	 * 		  유저 가입 정보
	 * @param agreement
	 * 		  약관동의 정보
	 * @param model
	 * 
	 **/
	@PostMapping("/join")
	public String join(
			@ModelAttribute("users") Users users, 
			@ModelAttribute("agreement") Agreement agreement,
			Model model )
	{
		JoinResult result = joinService.joinUsers(users);
		
		if(result == JoinResult.FAIL_EMAIL) {
			String errorEmail = "이미 가입된 이메일입니다.";
			model.addAttribute("errorEmail", errorEmail);
			return "join/join";
		} else if(result == JoinResult.FAIL_TEL) {
			String errorTel = "이미 가입된 전화번호입니다.";
			model.addAttribute("errorTel", errorTel);
			return "join/join";
		} else {
			joinService.joinUsers(users);
			agreement.setUs_no(users.getUs_no());
			
			joinService.joinAgreement(agreement);
			return "redirect:/productGroup";	
		}
	}
	
	// 로그인
	@GetMapping("/login")
	public String loginForm() {
		return "login/login";
	}
	
}
