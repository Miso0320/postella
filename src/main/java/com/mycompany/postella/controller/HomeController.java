package com.mycompany.postella.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	public HomeController() {
		log.info("실행");
	}
	
	@RequestMapping("/")
	public String index() {
		log.info("실행");
		return "index";
	}
}
