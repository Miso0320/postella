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
public class CartController {
	
	@Autowired CartService cartService;
	
	@GetMapping("/cartNormal")
	@Login
	public String joinForm() {
		return "cartNormal/cartNormal";
	}
	
	@PostMapping("/cartNormal")
	@Login
	@ResponseBody
	//user별 cart상품
	public List<Cart> getCartProduct(Integer us_no, Model model, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		us_no = users.getUs_no();
		log.info("user : " + us_no);
		
		List<Cart> list = cartService.getProductCart(us_no);
		List<Image> image = cartService.getImageCart();
		log.info("list : " + list);
		
		//카트list에 이미지 추가
		for(Cart cart : list) {
			for(Image img : image) {
				if(cart.getPrd_no() == img.getPrd_no()) {
					String encodedImg = Base64.getEncoder().encodeToString(img.getImg_file());
					cart.setEncodedFile(encodedImg);
					cart.setImg_type(img.getImg_type());
				}
			}
		}
		
		model.addAttribute("list", list);
		
		return list;
	}
	
	//Cart상품삭제
	@GetMapping("/deleteCart")
	@Login
	public String deleteCart(@RequestParam(name = "prd_no", required = true) int prd_no, @RequestParam(name = "us_no", required = true) int us_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("prd_no", prd_no);
		map.put("us_no", us_no);
		cartService.deleteToCart(map);
		
		return "redirect:/cartNormal";
	}
}
