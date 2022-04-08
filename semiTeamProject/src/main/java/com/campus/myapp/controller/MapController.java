package com.campus.myapp.controller;



import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/map/")
public class MapController {


	
	@GetMapping("main_map")
	public ModelAndView Main_map() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("map/map");
		return mav;
	}
	
}
