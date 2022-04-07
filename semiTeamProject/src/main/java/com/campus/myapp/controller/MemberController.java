package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/member/")
public class MemberController {
	//@Inject
	//MemberService service;

	// 로그인창으로 이동
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	//회원가입으로 이동
	@GetMapping("memberForm")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberForm");
		return mav;

	}
}
