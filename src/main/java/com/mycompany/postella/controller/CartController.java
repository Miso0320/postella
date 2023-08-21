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
import org.springframework.web.bind.annotation.RequestBody;
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
	
	/**
	 * 
	 * @param us_no
	 * 			회원고유번호
	 * @param model
	 * 			list(장바구니에 담긴 상품목록)를 뷰로 전달
	 * @param session
	 * 			cartItems를 세션에 저장,
	 * 			다른 요청이나 페이지에서 세션을 통해 장바구니 정보를 가져와 사용
	 * @return list
	 */
	@PostMapping("/cartNormal")
	@Login
	//반환값을 직접 HTML본문으로 보내준다
	@ResponseBody
	
	//user별 cart상품
	public List<Cart> getCartProduct(@RequestParam(name="prd_no", required = false) List<Cart> prdNos, Integer us_no, Model model, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		us_no = users.getUs_no();
		log.info("prdprdrpdrpd : " + prdNos);
		
		//카트list의 정보 가져오기
		List<Cart> list = cartService.getProductCart(us_no);
		List<Image> image = cartService.getImageCart();
		List<Cart> pgNameList = cartService.getPgName(us_no);
		List<Cart> cartItems = list;
		
		//카트list에 이미지 넣기
		for(Cart cart : list) {
			for(Image img : image) {
				if(cart.getPrd_no() == img.getPrd_no()) {
					String encodedImg = Base64.getEncoder().encodeToString(img.getImg_file());
					cart.setEncodedFile(encodedImg);
					cart.setImg_type(img.getImg_type());
				}
			}
		}
		//카트list에 상품 대분류 이름 넣기
		for (int i = 0; i < pgNameList.size(); i++) {
		    Cart cart = list.get(i);
		    Cart pgNameCart = pgNameList.get(i);
		    cart.setPg_name(pgNameCart.getPg_name());
		}
		
		session.setAttribute("cartItems", cartItems);
		model.addAttribute("list", list);
		
		return list;
	}
	
	/**
	 * 
	 * @param prd_no
	 * 			상품고유번호
	 * @param us_no
	 * 			회원고유번호
	 * @return
	 */	
	//Cart상품 단일삭제
	@GetMapping("/deleteCart")
	@Login
	public String deleteCart(@RequestParam(name = "prd_no", required = true) int prd_no, @RequestParam(name = "us_no", required = true) int us_no) {
		//회원고유번호, 상품고유번호를 통해 해당하는 상품삭제
		Map<String, Object> map = new HashMap<>();
		map.put("prd_no", prd_no);
		map.put("us_no", us_no);
		cartService.deleteToCart(map);
		
		return "redirect:/cartNormal";
	}
	
	/**
	 * 
	 * @param prd_no
	 * 			상품고유번호
	 * @param session
	 * @return
	 */
	//Cart상품 선택삭제(다수의 상품)
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
	
	/**
	 * 
	 * @param prd_no
	 * 			상품고유번호
	 * @param selectedValue
	 * 			<select>로 선택한 상품수량
	 * @param inputValue
	 * 			<input>으로 선택한 상품수량
	 * 			11개이상 구매원하면 input태그에 직접 수량입력하는 방식
	 * @param session
	 * @return
	 */
	//Cart 상품수량 변경 update
	@RequestMapping("/updateCart")
	@Login
	public String updateCart(@RequestParam(name = "prd_no", required = true) int prd_no, @RequestParam(name = "selectedValue", required = false) Integer selectedValue, @RequestParam(name = "inputValue", required = false) Integer inputValue, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		int userNo = users.getUs_no();
		Cart cart = new Cart();
		if (inputValue != null) {
			//input값 입력되면 input값이 crt_qty
			cart.setCrt_qty(inputValue);
	    } else {
	    	//아니면(select로 값 입력) select값을 수량으로 crt_qty
	    	cart.setCrt_qty(selectedValue);
	    }
		//해당하는 유저의 카트에 상품 업데이트
	    cart.setPrd_no(prd_no);
	    cart.setUs_no(userNo);
	    log.info("cart : " + cart);
		cartService.updateCart(cart);
		
		return "redirect:/cartNormal";
	}
	
	@PostMapping("/cartNormal2")
	@Login
	//반환값을 직접 HTML본문으로 보내준다
	@ResponseBody
	//테스트
	public List<Cart> getCartProduct2(@RequestBody List<Cart> prdNos, Model model, HttpSession session) {
		Users users = (Users) session.getAttribute("userLogin");
		int us_no = users.getUs_no();
		
		//카트list의 정보 가져오기
		List<Cart> list = cartService.getProductCart(us_no);
		List<Image> image = cartService.getImageCart();
		List<Cart> cartItems = list;
		
		//카트list에 이미지 가져오기
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
	
}
