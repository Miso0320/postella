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

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Orders;
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
	
	/**
	 * 
	 * @param 파라미터명
	 * 		  파라미터 설명
	 * @param model
	 * 
	 **/
	@GetMapping("/myOrderList")
	public String myOrderList(
			Model model ) {
		// us_no 나중엔 받아오기
		int us_no = 1;
		
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
		List<Orders> orders = myPageService.getOrderList(map);
		
		// 상품 이미지 가져오기
		Image images = null;
		
		for(int i = 0; i < orders.size(); i++) {
			images = imageService.getImageByPrdNo(orders.get(i).getPrd_no());
			orders.get(i).setImg_type(images.getImg_type());
			orders.get(i).setEncodedFile(Base64.getEncoder().encodeToString(images.getImg_file()));
		}

		model.addAttribute("orders", orders);
		
		
		
		
		

		// HttpServletResponse rep 매개값 필요
		/*
		 * HashMap< String , Object > map = new HashMap< String , Object >(); map.put(
		 * "return_type" , return_type ); map.put( "user_grp_key" , user_grp_key );
		 * map.put( "dir_id" , dir_id ); map.put( "dir_name" , URLDecoder.decode(
		 * StringUtil.nullChk( dir_name , "" ) , "UTF-8" ) );
		 * 
		 * System.out.println( "#### Parameter (" + this.getClass().getName() +
		 * " - chDir) = [" + map + "]" );
		 * 
		 * myLibraryService.chDir( map , rep );
		 */

		return "myPage/myOrderList/myOrderList";
	}
	
	@GetMapping("/deleteOrder")
	public String deleteOrder(@RequestParam(name = "od_detail_no", required = true) int od_detail_no) {
		log.info("od_detail_no : " + od_detail_no);
		
		//정말 삭제하시겠습니까?!?!? 알림창 필요!!!!
		
		
		//myPageService.removeOrder(od_detail_no);
		return "redirect:/myOrderList";
	}

}
