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
		
		List<Cart> list = cartService.getProductCart(us_no);
		List<Image> image = cartService.getImageCart();
		List<Cart> cartItems = list;
		
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
		session.setAttribute("cartItems", cartItems);		
		model.addAttribute("list", list);
		
		return list;
	}
	
	//Cart상품 삭제
	@GetMapping("/deleteCart")
	@Login
	public String deleteCart(@RequestParam(name = "prd_no", required = true) int prd_no, @RequestParam(name = "us_no", required = true) int us_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("prd_no", prd_no);
		map.put("us_no", us_no);
		cartService.deleteToCart(map);
		
		return "redirect:/cartNormal";
	}
	
	//Cart상품 선택삭제
	@RequestMapping("/deleteCheckCart")
	@Login
	public String deleteCheckCart( @RequestParam(name = "prd_no", required = true) List<Integer> prd_no,  HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");

		int userNo = users.getUs_no();
		for(Integer productNo : prd_no) {
			Map<String, Object> map = new HashMap<>();
			map.put("prd_no", productNo);
			map.put("us_no", userNo);
			
			cartService.deleteToCart(map);
		}

	    return "redirect:/cartNormal";
	}
	
	//Cart 상품수량 변경 update
	@RequestMapping("/updateCart")
	@Login
	public String updateCart(@RequestParam(name = "prd_no", required = true) int prd_no, @RequestParam("selectedValue") Integer selectedValue, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		
		Cart cart = new Cart();
	    cart.setUs_no(users.getUs_no());
	    cart.setCrt_qty(selectedValue);
	    cart.setPrd_no(prd_no);
	    log.info("cart : " + cart);
		cartService.updateCart(cart);
		
		return "redirect:/cartNormal";
	}
}
