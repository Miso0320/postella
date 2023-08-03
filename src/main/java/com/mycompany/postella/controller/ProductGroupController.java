package com.mycompany.postella.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;
import com.mycompany.postella.service.ProductGroupService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductGroupController {
	
	@Autowired
	private ProductGroupService productGroupService;
	
	@RequestMapping("/productGroup")
	public String getProductGroupList(String pageNo, Model model, HttpSession session) {
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
		
		int totalProductGroupNum = productGroupService.getTotalProductGroupNum();
		
		ProductGroupPager pager = new ProductGroupPager(10, 10, totalProductGroupNum, intpageNo);
		List<ProductGroup> list = productGroupService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("productGroups", list);
		
		return "productGroup/productGroup";
	}
	
}
