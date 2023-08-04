package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.ProductGroupService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductGroupController {
	
	@Autowired
	private ProductGroupService productGroupService;
	
	@Autowired
	private ImageService imageService;

	
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
		
		for(int i = 0; i < list.size(); i++) {
	         log.info("리스트 : " + list.get(i).getPg_no());
			
	      }
		
		
		
		//List<Image> imgList = productGroupService.getImagesBypgNo();
		
		
		
		return "productGroup/productGroup";
	}
	

}
