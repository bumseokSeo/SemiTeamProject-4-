package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/food/")
public class FoodController {
	
	@GetMapping("main_food")
	public ModelAndView foodPage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("food/main_food");
		
		return mav;
		
	}

}
