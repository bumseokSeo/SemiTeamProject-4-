package com.campus.myapp.controller;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

@Controller
public class ReviewController {
	@Inject
	ReviewService service;
	
	// 글목록
	@GetMapping("/")
	public ModelAndView reviewList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		// 총 레코드 수
		pVO.setTotalRecord(service.totalRecord(pVO));
		
		// DB처리
		mav.addObject("list", service.reviewList(pVO));
		mav.addObject("pVO", pVO);
		
		mav.setViewName("/"); // 
		return mav;
	}
	
	// 글등록 폼
	@GetMapping("/")
	public ModelAndView reviewWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/");
		return mav;
	}
	
	// 글등록
	@PostMapping("/")
	public ResponseEntity<String> boardWriteOk(ReviewVO vo, HttpServletRequest request) {
		
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		vo.setUserid((String)request.getSession().getAttribute("logId")); // 글쓴이-session로그인 아이디를 구한다.
		
		ResponseEntity<String> entity = null; // 데이터와 처리 상태를 가진다.
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type","text/html; charset=utf-8");
		//headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		try {
			service.ReviewInsert(vo);
			// 정상구현
			String msg = "<script>";
			msg += "alert('리뷰가 등록되었습니다.');";
			msg += "location.href='/myapp/board/boardList';";
			msg += "</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK); // 정상구현: 200
		}catch(Exception e) {
			e.printStackTrace();
			// 등록안됨..
			String msg = "<script>";
			msg += "alert('리뷰등록을 실패하였습니다.');";
			msg += "history.back();";
			msg += "</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 글 내용 보기
	@GetMapping("/")
	public ModelAndView reviewView(int reviewno) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.reviewSelect(reviewno)); // db에서 select한 데이터 들어가있음
		mav.setViewName("/");
		
		return mav;		
	}
	
	// 글 수정 폼
	@GetMapping("/")
	public ModelAndView boardEdit(int no) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", service.reviewSelect(no));
		mav.setViewName("board/boardEdit");
		
		return mav;		
	}
	
	// 글 수정 (DB)
	@PostMapping("/")
	public ResponseEntity<String> reviewEditOk(ReviewVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		try {
			
			int result = service.reviewUpdate(vo);
			if(result>0) {// 수정성공
				entity = new ResponseEntity<String>(getEditSuccessMessage(vo.getNo()), headers, HttpStatus.OK);
			}else { // 수정못함
				entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
			}
		}catch(Exception e) {
			e.printStackTrace();
			// 수정실패
			entity = new ResponseEntity<String>(getEditFailMessage(), headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 글 삭제
	@GetMapping("/")
	public ModelAndView reviewDel(int no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		int reviewno = 0;
		int result = service.reviewDelete(reviewno, userid);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) { // 삭제
			mav.setViewName("redirect:reviewList"); // list로 이동한 컨트롤러를 호출
		}else { // 삭제안됨
			mav.addObject("no", no);
			mav.setViewName("redirect:reviewView");
		}
		return mav;
	}
	
	// 리뷰 수정 메세지
	public String getEditFailMessage() {
		String msg = "<script>";
		msg += "alert('리뷰 수정 실패하였습니다.');";
		msg += "history.back();";
		msg += "</script>";
		return msg;
	}
	
	public String getEditSuccessMessage(int reviewno) {
		String msg = "<script>";
		msg += "alert('리뷰 수정하였습니다.\\n리뷰 목록으로 이동합니다.');";
		msg += "location.href='/myapp/map/reviewView?reviewno="+reviewno+"'";
		msg += "</script>";
		return msg;
	}
	
}
