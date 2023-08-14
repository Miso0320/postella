package com.mycompany.postella.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Users;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OderNPayController {
	
	@RequestMapping("/orderNpay")
	public String orderNPayContent(@RequestParam(name="quantity", required=false) String quantity, @RequestParam(name="prdNo", required=false) String prdNo, Model model, HttpSession session) {
		//상품번호와 수량
		model.addAttribute("quantity", quantity);
	    model.addAttribute("prdNo", prdNo);
	    
	    //구매자 정보
	    Users user = (Users) session.getAttribute("userLogin"); // 로그인한 유저 정보 가져오기
	    
	    model.addAttribute("user",user);
	    
	    return "orderNpay/orderNpay"; 
	}
	
	@GetMapping("/editAddress")
    public String editAddress(Model model) {
        
        return "orderNpay/editAddress"; 
    }
	
	@GetMapping("/addAddress")
    public String addAddress(Model model) {
        
        return "orderNpay/addAddress"; 
    }
	
}
