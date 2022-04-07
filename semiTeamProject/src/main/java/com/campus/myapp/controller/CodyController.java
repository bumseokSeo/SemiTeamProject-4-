package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CodyController {
	
	@GetMapping("/cody/main_cody")
	public String codyPage() {
		return "cody/main_cody";
	}
	
	@GetMapping("/master/master_cody")
	public String masterPage() {
		return "master/master_cody";
	}
	
	//codyRecommend
	
	//style
	
	//codyInsert
	
}
