package com.campus.myapp.controller;


import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FoodService;

@RestController
@RequestMapping("/map/")
public class MapController {
	@Inject
	FoodService service;
	@GetMapping("main_map")
	public ModelAndView Main_map() {
		//DB에서 음식메뉴 가져오기 ==> 서비스 
		ModelAndView mav = new ModelAndView();
		String fname = service.getfname();
		mav.addObject("menu",fname);
		mav.setViewName("map/map");
		return mav;
	}
	
}
