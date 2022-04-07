package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cody/")
public class CodyController {
	
	@GetMapping("main_cody")
	public String codyPage() {
		return "cody/main_cody";
	}
}
