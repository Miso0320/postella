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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.dto.ProductGroup;
import com.mycompany.postella.dto.ProductGroupPager;
import com.mycompany.postella.service.ImageService;
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

	
	@RequestMapping("/productGroup")
	
	public String getProductGroupList(
			String pageNo,
			Product prd,
			@RequestParam(value="category_list", required=false) String categoryList,
			Model model, 
			HttpSession session
			) 
		{
		
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
		session.setAttribute("categoryList", String.valueOf(categoryList));
		//categoryList = (String) session.getAttribute("categoryList");
		/*String sessionCheck = (String) session.getAttribute("categoryList");
		log.info("session: "+ sessionCheck);*/
		
		int totalProductGroupNum = productGroupService.getTotalProductGroupNum(categoryList);
		log.info("카테고리 :" + totalProductGroupNum);
		
		ProductGroupPager pager = new ProductGroupPager(12, 10, totalProductGroupNum, intpageNo);
		
		//log.info("categoryList : " + categoryList);
		
		pager.setPrd_category(categoryList);
		log.info("카테고리 : "+categoryList);
		List<ProductGroup> list = productGroupService.getList(pager);
		//List<ProductGroup> list = productGroupService.getPhotoList(pager);
		
		Image img;
		int pgNo;
		for(int i = 0; i < list.size(); i++) {
			pgNo = list.get(i).getPg_no();
			img = imageService.getImageByPgNo(pgNo);
			if(img != null) {
				
				//log.info("리스트 : " + list.get(i).getPg_no());
				
				String type = img.getImg_type();
				String imgFile = Base64.getEncoder().encodeToString(img.getImg_file());
				//log.info("가져온거 :" + img.getImg_type());		
				
				list.get(i).setEncodedFile(imgFile);
				list.get(i).setImg_type(type);
			}
			

	      }

		
		model.addAttribute("pager", pager);
		model.addAttribute("productGroups", list);
		

		
		//List<Image> imgList = productGroupService.getImagesBypgNo();
		
		
		
		return "productGroup/productGroup";
	}
	

}
