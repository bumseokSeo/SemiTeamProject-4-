package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FoodController {
	
	@GetMapping("/food/main_food")
	public ModelAndView foodPage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("food/main_food");
		
		return mav;
		
	}
	
	@GetMapping("/master/master_food")
	public ModelAndView foodAdminPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master/master_food");
		
		return mav;
	}
	

}
