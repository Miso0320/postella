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
public class JoinController {
	@Autowired
	private ImageService imageService;
	
	public JoinController() {
		log.info("실행");
	}
	
	@RequestMapping("/")
	public String index() {
		log.info("실행");
		return "index";
	}
}
