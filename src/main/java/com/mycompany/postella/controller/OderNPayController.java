package com.mycompany.postella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OderNPayController {
	
	@RequestMapping("/orderNpay")
	public String orderNPayContent(@RequestParam(name="quantity", required=false) String quantity, @RequestParam(name="prdNo", required=false) String prdNo, Model model) {

		model.addAttribute("quantity", quantity);
	    model.addAttribute("prdNo", prdNo);
	    
	    log.info("quantity: " + quantity);
	    log.info("prdNo: " + prdNo);
	    return "orderNpay/orderNpay"; 
	}
	
}
