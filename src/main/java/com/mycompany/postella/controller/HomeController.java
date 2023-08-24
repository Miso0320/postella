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
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.postella.dto.CodeTb;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.ProductGroupService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 박재홍
 *
 */
@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private ProductGroupService productGroupService;
	
	@Autowired
	private ImageService imageService;

	/**
	 * 
	 * 메인페이지
	 * 
	 * @param pageNo
	 * 			현재 페이지 번호
	 * @param model
	 * 			Model
	 * @param session
	 * 			HttpSession
	 * @return	productGroup/productGroup
	 */
	@RequestMapping("/")
	public String index(
			@RequestParam(name="pageNo", required=false)
			String pageNo,
			Model model,
			HttpSession session) {
		
		// 파라미터로 받은 값 전달
		Map<String, Object> map = new HashMap<>();
		
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
		int totalProductGroupNum = productGroupService.getTotalProductGroupNum(map);
		
		Pager pager = new Pager(12, 10, totalProductGroupNum, intpageNo);
		map.put("pager", pager);
		
		// 전체 상품 리스트
		List<Product> list = productGroupService.getList(map);
		
		// 검색 결과 여부 확인
		boolean searchResult = true;
		if(totalProductGroupNum == 0) {
			searchResult = false;
		}
		
		// 상품 이미지 가져오기
		int pgNo;
		Image img = null;
		
		for(int i = 0; i < list.size(); i++) {
			pgNo = list.get(i).getPg_no();
			img = imageService.getImageByPgNo(pgNo);

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
		model.addAttribute("searchResult", searchResult);
		
		return "index";
	}
	
	// 이미지 삽입 임시 페이지
	@GetMapping("/insertImg")
	public String insertImgForm() {
		return "insertImgForm";
	}
	
	// 이미지 삽입 임시 페이지
	@PostMapping("/insertImg")
	public String insertImg(Image img, HttpSession session) throws Exception{
		MultipartFile mf = img.getImg_attach();
		
		if(!mf.isEmpty()) {
			//원본파일명 저장
			img.setImg_oname(mf.getOriginalFilename());
			//파일의 형식 (MIME 타입)을 설정(image/jpeg, image/png, ...)
			img.setImg_type(mf.getContentType());
			//이미지 용도 
			img.setImg_use("THM");
			//첨부 파일을 DB에 직접 저장
			img.setImg_file(mf.getBytes());
			//그룹넘버 주기
			img.setPg_no(1);
		}
		
		imageService.write(img);
		return "redirect:/insertImg";
	}
}
