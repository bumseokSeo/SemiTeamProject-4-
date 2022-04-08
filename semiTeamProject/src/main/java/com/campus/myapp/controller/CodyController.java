package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.CodyService;
import com.campus.myapp.vo.CodyVO;

@Controller
public class CodyController {
	
	@Inject
	CodyService service;
	
	//코디 메인페이지
	@GetMapping("/cody/main_cody")
	public ModelAndView codyPage(int temp, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//String sex = (String)session.getAttribute("logSex");
		mav.addObject("temp",temp);
		//List<CodyVO> vo = service.codyRecommend(temp, "m");//임시로 설정
		//mav.addObject("vo", vo);
		mav.setViewName("cody/main_cody");
		return mav;
	}
	
	//코디 관리자 페이지
	@GetMapping("/master/master_cody")
	public String masterPage() {
		return "master/master_cody";
	}
	//codyInsert
	@PostMapping("/codyInsert")
	@ResponseBody
	public int codyInsert(CodyVO vo, HttpServletRequest request) {
		//파일 업로드 구현 필요
		String path = request.getSession().getServletContext().getRealPath("");
		
		return service.codyInsert(vo);
	}
	//서브페이지로 이동
	@GetMapping("/cody/sub_cody")
	public String subPage() {
		return "cody/sub_cody";
	}
	
	//코디 목록
	
	
}
