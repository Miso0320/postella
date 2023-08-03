package com.mycompany.postella.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.postella.dto.Users;
import com.mycompany.postella.service.JoinService;
import com.mycompany.postella.service.JoinService.JoinResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JoinController {
	@Resource
	private JoinService joinService;
	
	
	/* 회원관련 */
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}

	@PostMapping("/join")
	public String join(Users users, Model model) {
		
		/*JoinResult result = joinService.joinUsers(users);
		
		if(result == JoinResult.FAIL) {
			String error = "중복된 ID가 존재합니다.";
			model.addAttribute("error", error);
			return "join/join";
		} else {
			joinService.joinUsers(users);
			return "redirect:/productGroup/productGroup";						
		}*/
		
		joinService.joinUsers(users);
		
		return "redirect:/productGroup";	
	}

}
