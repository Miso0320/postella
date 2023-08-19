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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//회원정보수정 페이지
public class UserChangeController {
	@GetMapping("/userChange")
	public String getUserInfo() {
		return "userChange/userChange";
	}
	
}
