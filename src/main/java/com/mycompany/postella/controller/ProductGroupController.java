package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.dto.Price;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.LoginService;
import com.mycompany.postella.service.PriceService;
import com.mycompany.postella.service.ProductGroupService;
import com.mycompany.postella.service.productService;

import lombok.extern.slf4j.Slf4j;

//테스트
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
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/productGroup")
	public String getProductGroupList(
			@RequestParam(name="prd_category", required=false) String prd_category,
			@RequestParam(name="kind", required=false) String kind,
			@RequestParam(name="pageNo", required=false) String pageNo,
			Model model, HttpSession session) {
		//pageNo가 넘어오지 않았을 경우
		if(pageNo == null) {
			//세션에 저장되어 있는지 확인
			pageNo = (String) session.getAttribute("pageNo");
			
			//저장되어 있지 않다면 "1"로 초기화
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 페이징 객체 생성
		int intpageNo = Integer.parseInt(pageNo);
		session.setAttribute("pageNo", String.valueOf(pageNo));
		
		int totalProductGroupNum = productGroupService.getTotalProductGroupNum();
		
		Pager pager = new Pager(12, 10, totalProductGroupNum, intpageNo);
		log.info("페이저 확인중!!!!!!!!!!!!!!!!!!!!!!!! : " + pager.getEndPageNo());
		
		// 상품목록 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("pager", pager);
		map.put("prd_category", prd_category);
		map.put("kind", kind);
		
		List<Product> list = productGroupService.getList(map);
		
		int pgNo;
		Image img = null;
		Price price;
		int prd_price;
		int prd_org_price;
		
		//상품목록: 사진,이름,원가,판매가
		for(int i = 0; i < list.size(); i++) {
			pgNo = list.get(i).getPg_no();
			img = imageService.getImageByPgNo(pgNo);
			price = priceService.getPrice(pgNo);
			prd_price = price.getPrd_price();
			prd_org_price = price.getPrd_org_price();
			list.get(i).setPrd_price(prd_price); 
			list.get(i).setPrd_org_price(prd_org_price);

			if(img != null) {
				String imgFile = Base64.getEncoder().encodeToString(img.getImg_file());
				list.get(i).setEncodedFile(imgFile);
				list.get(i).setImg_type(img.getImg_type());
			}		
		}
		
		// 카테고리 리스트 가져오기
		List<CodeTb> categoryList = productGroupService.getCategoryList();
		// 브랜드 리스트 가져오기
		List<CodeTb> brandList = productGroupService.getBrandList();
		// 상품상태 리스트 가져오기
		List<CodeTb> statusList = productGroupService.getStatusList();
		// 메시지 리스트 가져오기
		List<CodeTb> messageList = productGroupService.getMessageList();
		
		model.addAttribute("pager", pager);
		model.addAttribute("productGroups", list);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("brandList", brandList);
		model.addAttribute("statusList", statusList);
		model.addAttribute("messageList", messageList);
		
		return "productGroup/productGroup";
	}
}