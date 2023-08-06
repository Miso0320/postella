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
public class JoinController {
	@Resource
	private JoinService joinService;
	
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}

	@PostMapping("/join")
	public String join(
			@ModelAttribute("users") Users users, 
			@ModelAttribute("agreement") Agreement agreement,
			Model model
			)
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
	
}
