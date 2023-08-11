package com.mycompany.postella.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import com.mycompany.postella.service.LoginService;
import com.mycompany.postella.service.LoginService.LoginResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {
	@Resource
	private JoinService joinService;
	
	@Resource LoginService loginService;
	
	/**
	 * 
	 * 회원가입 폼
	 * 
	 * @return String
	 */
	@GetMapping("/join")
	public String joinForm() {
		return "join/join";
	}
	
	/**
	 * 
	 * 회원가입
	 * 
	 * @param users 유저 가입 정보
	 * @param agreement 약관동의 정보
	 * @param model
	 * @return String
	 */
	@PostMapping("/join")
	public String join(
			@ModelAttribute("users") Users users, 
			@ModelAttribute("agreement") Agreement agreement,
			Model model ) {
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
	
   @PostMapping("/login")
   public String login(Users users, Model model, HttpSession session) {
	LoginResult result = loginService.loginUsers(users);
      String error = "";
      if(result == LoginResult.FAIL_UID) {
    	  error = "MID가 없습니다.";
      } else if(result == LoginResult.FAIL_UENABLED) {
    	  error = "MID가 비활성화 되어 있습니다";
      } else if(result == LoginResult.FAIL_UPASSWORD) {
    	  error = "MPASSWORD가 틀립니다";
      } else {
    	  Users dbUsers = loginService.getUser(users.getUs_email());
    	  session.setAttribute("userLogin", dbUsers);
    	  return "redirect:/productGroup";
      }
      
      model.addAttribute("error", error);
      return "login/login";
   }
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userLogin");
		return "redirect:/productGroup";
		
	}
	
}
