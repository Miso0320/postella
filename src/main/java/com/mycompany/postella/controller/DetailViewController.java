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
import com.mycompany.postella.service.ImageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DetailViewController {
	@Autowired
	private ImageService imageService;
	
	@RequestMapping("/detailView")
	public String content(@RequestParam(defaultValue="1") int pg_no, Model model) {
		pg_no = 3;
		String base64Img;
		
		List<Image> imgList = imageService.getImagesBypgNo(pg_no);
		
		for(int i=0; i < imgList.size(); i++) {
			if(imgList.get(i).getImg_file() != null) {
				imgList.get(i).setEncodedFile(Base64.getEncoder().encodeToString(imgList.get(i).getImg_file()));
			}
		}
		model.addAttribute("thmImgs", imgList);
		
		Image tumnail = imgList.get(0);
		
		model.addAttribute("thumnail", tumnail);
		return "detailView/detailView";
	}

}
