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

/**
 * 
 * @author 김미소, 박재홍
 *
 */
@Slf4j
@Controller
public class UserController {
	
	@Resource
	private JoinService joinService;
	
	@Resource
	LoginService loginService;
	
	/**
	 * 
	 * 회원가입 폼 불러오기
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
	 * @param users
	 * 			유저 가입 정보
	 * @param agreement
	 * 			약관동의 정보
	 * @param model
	 * 			Model
	 * @return redirect:/productGroup
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
	
	/**
	 * 
	 * 로그인 폼
	 * 
	 * @return String
	 */
	@GetMapping("/login")
	public String loginForm() {
		return "login/login";
	}
	
	/**
	 * 
	 * 유저 가입 정보를 통해 로그인 성공,실패
	 * 
	 * @param users
	 * 			유저 가입 정보
	 * @param model
	 * 			Model
	 * @param session
	 * 			HttpSession
	 * @return
	 * 			로그인 성공 : redirect:/productGroup
	 * 			로그인 실패 : login/login
	 * 			로그아웃 : redirect:/productGroup
	 */
   @PostMapping("/login")
   public String login(Users users, Model model, HttpSession session) {
	LoginResult result = loginService.loginUsers(users);
      String error = "";
      if(result == LoginResult.FAIL_UID) {
    	  error = "MID가 없습니다.";
    	  String errorEmail2 = "이메일이 올바르지 않습니다.";
			model.addAttribute("errorEmail2", errorEmail2);
			return "login/login";
      } else if(result == LoginResult.FAIL_UENABLED) {
    	  error = "MID가 비활성화 되어 있습니다";
      } else if(result == LoginResult.FAIL_UPASSWORD) {
    	  error = "MPASSWORD가 틀립니다";
    	  String errorPassword = "비밀번호가 올바르지 않습니다.";
			model.addAttribute("errorPassword", errorPassword);
			return "login/login";
      } else {
    	  Users dbUsers = loginService.getUser(users.getUs_email());
    	  session.setAttribute("userLogin", dbUsers);
    	  return "redirect:/";
      }
      
      model.addAttribute("error", error);
      return "login/login";
   }
	
   /**
    * 
    * 로그아웃
    * 
    * @param session
    * 			HttpSession
    * @return	redirect:/
    */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userLogin");
		return "redirect:/";
		
	}
}
