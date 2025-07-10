package com.smhrd.web.controller;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CrawlingController {

	@SuppressWarnings("unused")
	private final Logger logger = org.slf4j.LoggerFactory .getLogger(getClass());
	
	
	@GetMapping("crawling")
	public String crawling() {
		
		return "crawling";
	}
	
	@PostMapping("crawling")
	public String crawling_data() {
		
		return "redirect:/";
	}
	
}
