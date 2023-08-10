package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.dto.Price;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.PriceService;
import com.mycompany.postella.service.ProductGroupService;
import com.mycompany.postella.service.productService;

import lombok.var;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductGroupController {
	@Autowired
	private ProductGroupService productGroupService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private productService productService;
	
	@Autowired
	private PriceService priceService;

	@RequestMapping("/productGroup")
	public String getProductGroupList(String pageNo, Model model, HttpSession session) {
		//pageNo가 넘어오지 않았을 경우
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
		
		Pager pager = new Pager(12, 10, totalProductGroupNum, intpageNo);
		List<ProductGroup> list = productGroupService.getList(pager);
		
		/*int Price = priceService.getPrice(pg_no);*/
		
		int pgNo;
		Image img = null;
		Price price;
		int prd_price;
		int prd_org_price;
		
		for(int i = 0; i < list.size(); i++) {
			pgNo = list.get(i).getPg_no();
			img = imageService.getImageByPgNo(pgNo);
			price = priceService.getPrice(pgNo);
			prd_price = price.getPrd_price();
			prd_org_price = price.getPrd_org_price();
			list.get(i).setPrd_price(prd_price); 
			list.get(i).setPrd_org_price(prd_org_price);
			log.info("prd_price : " + list.get(i).getPrd_price());
			log.info("prd_org_price : " + list.get(i).getPrd_org_price());
			if(img != null) {
				String imgFile = Base64.getEncoder().encodeToString(img.getImg_file());
				list.get(i).setEncodedFile(imgFile);
				list.get(i).setImg_type(img.getImg_type());
			}
			
		}
		
		
		
		
		
		model.addAttribute("pager", pager);
		model.addAttribute("productGroups", list);
		
		return "productGroup/productGroup";
	}
}