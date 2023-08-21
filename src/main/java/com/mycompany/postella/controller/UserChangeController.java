package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.postella.dto.Cart;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Users;
import com.mycompany.postella.interceptor.Login;
import com.mycompany.postella.service.CartService;
import com.mycompany.postella.service.UsersChangeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//회원정보수정 페이지
public class UserChangeController {
	
	@Autowired UsersChangeService usersChangeService;
	
	@GetMapping("/userChange")
	@Login
	//현재 로그인된 이메일 정보 
	public String getUser(Model model, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");	
		String userEmail = users.getUs_email();
		
		model.addAttribute("users", users);
		return "userChange/userChange";
	}
	
	@PostMapping("/updatePassword")
	@Login
	public String updatePassword(@RequestParam(name = "inputValue", required = false) String inputValue, String us_password, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		users.setUs_password(us_password);
		users.setUs_nickname(inputValue);
		usersChangeService.updatePassword(users);
		usersChangeService.updateNickname(inputValue);
		
		return "redirect:/productGroup";
	}
	@PostMapping("/updateNickname")
	public String updateNickName() {	
		return "redirect:/userChange";
	}
}
