package com.mycompany.postella.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Board;
import com.mycompany.postella.dto.Pager;
import com.mycompany.postella.dto.Product;
import com.mycompany.postella.service.AdminService;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author 김미소
 *
 */
@Slf4j
@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	/**
	 * 
	 * 판매자 페이지 메인
	 * 
	 * @return sellerPage/adminIndex
	 */
	@GetMapping("/adminIndex")
	public String adminIndex() {
		return "sellerPage/adminIndex";
	}

	/**
	 * 
	 * 판매자 페이지 로그인
	 * 
	 * @return sellerPage/login
	 */
	@GetMapping("/adminLoginForm")
	public String loginForm() {
		return "sellerPage/login";
	}

	/**
	 * 
	 * 판매자 페이지 상품 목록
	 * 
	 * @param kind
	 * 			정렬방법
	 * @param pageNo
	 * 			현재 페이지 번호
	 * @param keyword
	 * 			검색어
	 * @param model
	 * 			Model
	 * @param session
	 * 			HttpSession
	 * @return sellerPage/productList
	 */
	@GetMapping("/adminProductList")
	public String productList(
			@RequestParam(name="kind", required=false)
			String kind,
			@RequestParam(name="pageNo", required=false)
			String pageNo,
			@RequestParam(name="keyword", required=false)
			String keyword,
			Model model,
			HttpSession session) {
		
		// 파라미터로 받은 값 전달
		Map<String, Object> map = new HashMap<>();
		map.put("kind", kind);
		map.put("keyword", keyword);
		
		// 페이지번호 null일 경우 첫 번째 페이지 보여주기
		if (pageNo == null) {
			pageNo = "1";
		}
		
		int intpageNo = Integer.parseInt(pageNo);
		int totalProductGroupNum = adminService.getTotalProductCnt(map);
		
		Pager pager = new Pager(10, 10, totalProductGroupNum, intpageNo);
		map.put("pager", pager);
		
		// 전체 상품 리스트
		List<Product> list = adminService.getList(map);
		
		model.addAttribute("pager", pager);
		model.addAttribute("productGroups", list);
		
		return "sellerPage/productList";
	}

	/**
	 * 
	 * 판매자 페이지 공지사항 목록
	 * 
	 * @param bo_kind
	 * 			게시판 종류
	 * @param pageNo
	 * 			현재 페이지 번호
	 * @param model
	 * 			Model
	 * @param session
	 * 			HttpSession
	 * @return sellerPage/noticeList
	 */
	@GetMapping("/noticeList")
	public String noticeList(
			@RequestParam(name="bo_kind", required=false)
			String bo_kind,
			@RequestParam(name="pageNo", required=false)
			String pageNo,
			Model model,
			HttpSession session ) {
		
		// 파라미터로 받은 값 전달
		Map<String, Object> map = new HashMap<>();
		map.put("bo_kind", bo_kind);
		
		// 페이지번호 null일 경우 첫 번째 페이지 보여주기
		if (pageNo == null) {
			pageNo = "1";
		}
		
		int intpageNo = Integer.parseInt(pageNo);
		int totalBoardGroupNum = adminService.getTotalBoardCnt(map);
		
		Pager pager = new Pager(10, 10, totalBoardGroupNum, intpageNo);
		map.put("pager", pager);
		
		// 전체 상품 리스트
		List<Board> list = adminService.getBoardList(map);
		
		model.addAttribute("pager", pager);
		model.addAttribute("BoardGroups", list);
		
		return "sellerPage/noticeList";
	}
}
