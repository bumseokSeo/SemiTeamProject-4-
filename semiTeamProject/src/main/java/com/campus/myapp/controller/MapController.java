package com.campus.myapp.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MapService;
import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.ReviewVO;

@RestController
@RequestMapping("/map/")
public class MapController {
	@Inject
	MapService service;
	
	@GetMapping("main_map")
	public ModelAndView Main_map() {
		//DB에서 음식메뉴 가져오기 ==> 서비스 
		ModelAndView mav = new ModelAndView();
		//String fname = service.getfname();
		//mav.addObject("menu",fname);
		mav.addObject("placeid","p1");
		mav.setViewName("map/map");
		return mav;
	}
	
	//나의 리뷰페이지로 이동
	@GetMapping("myReview")
	public ModelAndView myReview() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("map/myReview");
		return mav;
	}
	
	//나의 리뷰 정보 전부 출력
	@RequestMapping("myReviewListAll")
	public List<ReviewVO> myReviewListAll(String userid) {
		
		System.out.println("mapcon");
		return service.myReviewListAll(userid);
	}
	
}
