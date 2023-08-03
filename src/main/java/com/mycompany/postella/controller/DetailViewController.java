package com.mycompany.postella.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.dto.Order_detail;
import com.mycompany.postella.service.ImageService;
import com.mycompany.postella.service.Order_detailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DetailViewController {
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private Order_detailService odetailService;
	
	@RequestMapping("/detailView")
	public String content(@RequestParam(defaultValue="1") int pg_no, Model model) {
		//썸네일 리스트 불러오기
		pg_no = 3;
		String base64Img;
		
		List<Image> imgList = imageService.getImagesBypgNo(pg_no);
		
		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
			}
		}
		model.addAttribute("thmImgs", imgList);
		
		//썸네일 리스트 중 대표 썸네일 불러오기
		Image tumnail = imgList.get(0);
		model.addAttribute("thumnail", tumnail);
		
		//별점 평균 불러오기
		int starAgv = odetailService.getStarAvg(pg_no);
		model.addAttribute("stars", starAgv);
		
		
		return "detailView/detailView";
	}

}
