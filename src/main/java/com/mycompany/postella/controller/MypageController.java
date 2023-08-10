package com.mycompany.postella.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Orders;
import com.mycompany.postella.service.CartService;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	@Resource
	private MyPageService myPageService;
	
	@Resource
	private ImageService imageService;
	
	@Resource
	private CartService cartService;
	
	
	/**
	 * 
	 * @param us_no
	 * @param model
	 * @return
	 */
	@GetMapping("/myOrderList")
	public String myOrderList(
			@RequestParam(name = "od_detail_no", defaultValue="1", required = true) int us_no,
			@RequestParam(name = "keyword", required = false) String keyword,
			Model model ) throws Exception {
		// 해당 유저의 날짜별 그룹 가져오기
		//List<Date> dates = myPageService.getOdDate(us_no);
		
		//map.put("od_date", dates);
		
		/*for(Date odDate : dates) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
			String dateTest = sdf.format(odDate);
			
			log.info("날짜 확인용!!!!!!!!!!! : " + dateTest);
		}*/
		
		// 주문목록 전체 리스트 가져오기
		Map<String, Object> map = new HashMap<>();
		map.put("us_no", us_no);
		map.put("keyword", keyword);
		List<Orders> orders = myPageService.getOrderList(map);
		
		// 상품 이미지 가져오기
		Image images = null;
		
		for(int i = 0; i < orders.size(); i++) {
			images = imageService.getImageByPrdNo(orders.get(i).getPrd_no());
			orders.get(i).setImg_type(images.getImg_type());
			orders.get(i).setEncodedFile(Base64.getEncoder().encodeToString(images.getImg_file()));
		}
		
		model.addAttribute("orders", orders);
		
		// cart 만드는 중
		// orders를 JSON 형식의 문자열로 변환하여 모델에 추가
	    ObjectMapper objectMapper = new ObjectMapper();
	    String jsonCartList = objectMapper.writeValueAsString(orders);
	    model.addAttribute("jsonCartList", jsonCartList);
		
		return "myPage/myOrderList/myOrderList";
	}
	
	@GetMapping("/deleteOrder")
	public String deleteOrder(@RequestParam(name = "od_detail_no", required = true) int od_detail_no) {
		myPageService.removeOrder(od_detail_no);
		return "redirect:/myOrderList";
	}

}
