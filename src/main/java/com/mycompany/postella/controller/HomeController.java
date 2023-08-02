package com.mycompany.postella.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.postella.dto.Image;
import com.mycompany.postella.service.ImageService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private ImageService imageService;
	
	public HomeController() {
		log.info("실행");
	}
	
	@RequestMapping("/")
	public String index() {
		log.info("실행");
		return "index";
	}
	
	@GetMapping("/insertImg")
	public String insertImgForm() {
		return "insertImgForm";
	}
	
	@PostMapping("/insertImg")
	public String insertImg(Image img, HttpSession session) throws Exception{
		log.info("!!!!!!:"+img);
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
		}
		
		imageService.write(img);
		return "redirect:/insertImg";
	}
}
