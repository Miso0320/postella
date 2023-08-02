package com.mycompany.postella.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductPager;
import com.mycompany.postella.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/product")
	public String index() {
		log.info("실행");
		return "product/product";
	}
	
	@GetMapping("/getProductList")
	public String getProductList(String pageNo, Model model, HttpSession session) {
		//브라우저에서 pageNo가 넘어오지 않았을 경우
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			//저장되어 있지 않다면 "1"로 초기화
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		int intpageNo = Integer.parseInt(pageNo);
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
		int totalProductNum = productService.getTotalProductNum();
		
		ProductPager pager = new ProductPager(10, 10, totalProductNum, intpageNo);
		List<Product> list = productService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("products", list);
		
		/*for(int i=1; i < list.siz i++) {
			
			
		}*/
		
		
		return "product/product";
	}
	
}
