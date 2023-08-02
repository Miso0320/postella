package com.mycompany.postella.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/detailView")
public class DetailViewController {
	
	@RequestMapping("/detailView")
	public String content(HttpServletRequest request) {
		return "detailView/detailView";
	}
}
