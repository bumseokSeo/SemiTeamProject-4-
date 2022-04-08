package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MemberVO;
@RestController
@RequestMapping("/member/")
public class MemberController {
	@Inject
	MemberService service;

	// 로그인창으로 이동
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	//회원가입으로 이동
	@GetMapping("memberForm")
	public ModelAndView memberForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberForm");
		return mav;

	}
	/*
	//회원정보수정 페이지로 이동
	@GetMapping("memberEdit")
	public ModelAndView memberEdit() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberEdit");
		return mav;
	}
	*/
	
	// 회원등록
	@PostMapping("memberOk")
	public ModelAndView memberFormOk(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = service.memberInsert(vo);

		mav.addObject("cnt", cnt);
		mav.setViewName("member/memberResult");
		return mav;
	}
	//로그인
	@PostMapping("loginOk")
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		
		MemberVO vo2 = service.loginCheck(vo);

		ModelAndView mav = new ModelAndView();
		// 로그인 성공시 세션에 id와 이름 저장
		if (vo2 != null) {// 로그인 성공
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logSex", vo2.getSex());
			session.setAttribute("logImg", vo2.getProfile());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");// '/' <- 홈으로 이동
		} else {// 로그인 실패
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	// 로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
	
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	// 아이디 중복검사
	@PostMapping("memberIdCheck")
	public int inCheck(String userid) {
		int cnt = service.idCheck(userid);// 중복이면1 아님0
		return cnt;
	}
}
