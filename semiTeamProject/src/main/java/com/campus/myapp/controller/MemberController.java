package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	
	//회원정보수정 페이지로 이동
	@GetMapping("memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String userid = (String) session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = service.memberSelect(userid);
		
		mav.addObject("vo", vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
	//회원정보찾기 이동
	@GetMapping("findId")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findId");
		return mav;
	}
	
	@GetMapping("findPwd")
	public ModelAndView findPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findPwd");
		return mav;
	}
	@GetMapping("resetPwd")
	public ModelAndView resetPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/resetPwd");
		return mav;
	}
	//비밀번호 찾기
	@PostMapping("findPwdOk")
	public ResponseEntity<String> findPwdOk(MemberVO vo, HttpServletRequest request, HttpSession session ) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", "text/html; charset=UTF-8");
		try {
			MemberVO vo2 = service.findPwd(vo);
			String msg = "<script>";
			msg+="alert('"+vo2.getUsername()+"님 비밀번호 초기화페이지로 이동합니다.');";
			msg += "location.href='/member/resetPwd'";
			msg+="</script>";
			session.setAttribute("tempUserId", vo2.getUserid());
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//200
			
			
		}catch(Exception e) {//찾기실패
			e.printStackTrace();
			String msg = "<script>";
			msg+="alert('해당하는 비밀번호가 존재하지 않습니다.');";
			msg += "history.back()";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);//200
		}
		return entity;
	}
	//비밀번호 초기화resetPwdOk
	@PostMapping("resetPwdOk")
	public ResponseEntity<String> resetPwdOk(MemberVO vo,HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		vo.setUserid((String) session.getAttribute("tempUserId"));
		try {
			int result = service.resetPwdOk(vo);
			if(result>0) {
				String msg = "<script>";
				msg+="alert('비밀번호 재설정이 완료되었습니다.\\n 로그인 화면으로 이동합니다.');";
				msg += "location.href='/member/login'";
				msg+="</script>";
				entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);
			}else {
				String msg = "<script>";
				msg+="alert('비밀번호 재설정에 실패하였습니다.');";
				msg += "history.back()";
				msg+="</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}
				
			
		} catch (Exception e) {
			String msg = "<script>";
			msg+="alert('비밀번호 재설정에 실패하였습니다.');";
			msg += "history.back()";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	//아이디 찾기
	@PostMapping("findIdOk")
	public ResponseEntity<String> findIdOk(MemberVO vo, HttpServletRequest request, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", "text/html; charset=UTF-8");
		try {
			MemberVO vo2 = service.findId(vo);
			String msg = "<script>";
			msg+="alert('"+vo2.getUsername()+"님의 아이디는\\n"+vo2.getUserid()+"입니다.');";
			msg += "location.href='/member/login'";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//200
			
			
		}catch(Exception e) {//찾기 실패
			
			String msg = "<script>";
			msg+="alert('해당하는 아이디가 존재하지 않습니다.');";
			msg += "history.back()";
			msg+="</script>";
			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);//200
		}
		return entity;
	}
	
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
		
		if (vo2 != null) {// 로그인 성공
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logSex", vo2.getSex());
			session.setAttribute("logImg", vo2.getProfile());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
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
	
	//회원정보 수정
	@PostMapping("memberEditOk")
	public ResponseEntity<String> memberEditOk(MemberVO vo, HttpServletRequest request, HttpSession session) {
		// session의 로그인 아이디 확인
		
		vo.setUserid((String) request.getSession().getAttribute("logId"));
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		
		//파일 업로드를 위한 업로드 위치의 절대주소
		String path = request.getSession().getServletContext().getRealPath("/img/memberimg");
		System.out.println("path-->"+path);
		try {
			//파일업로드를 위한 request객체에서 multipart객체를 구해야 한다
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			//mr에 파일의 수만큼 multipartfile객체가 존재해야 함
			List<MultipartFile> files = mr.getFiles("imgName");
			
			
			if(files != null) {//if - 1
				
				
					//1.multipartfile객체 얻어오기
					MultipartFile mf = files.get(0);
					//2.업로드한 실제 파일명 구하기
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName = " + orgFileName);
					
					//3.rename하기
					if(orgFileName != null && !orgFileName.equals("")) {//if - 3
						File f = new File(path, orgFileName);
						
						if(f.exists()) {//if - 4 파일 존재 여부
							for(int renameNum=1;;renameNum++) {// for - 5
								
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);//파일명
								String ext = orgFileName.substring(point+1);//확장자
								
								f = new File(path,fileName+" ("+renameNum+")."+ext);//새로운 파일명
								if(!f.exists()) {//if - 6   새로생성된 파일 객체가 없으면
									orgFileName = f.getName();
									break;
								}
							}
						}
						
						try {
							mf.transferTo(f);//실제 업로드가 진행
						} catch (Exception ee) {
							ee.printStackTrace();
						}
						
						vo.setProfile(orgFileName);
					}
			}
			
			//db등록
			service.memberUpdate(vo);
			session.setAttribute("logImg", vo.getProfile());
			//레코드 추가 성공
			String msg = "<script>alert('프로필이 수정되었습니다.'); location.href='/';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			//레코드 추가 실패
			fileDelete(path, vo.getProfile());
			String msg = "<script>alert('프로필 수정에 실패하였습니다'); history.back();</script>";

			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
	//파일 지우기
	public void fileDelete(String p, String f) {
		if(f != null) {//파일명이 존재하면 
			File file = new File(p,f);
			file.delete();
		}
	}
	
	//회원탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(String userid) {
		
		
		int result = service.memberDelete(userid);//result값에따라 삭제여부 판단 0 or 1
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mav.setViewName("redirect:logout");  //list로 이동한 컨트롤러 호출
		}else {
			
			mav.setViewName("redirect:memberEdit");
		}
		return mav;
	}
	@GetMapping("masterPage")
	public ModelAndView masterPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master/master_member");
		return mav;
	}
	
	//회원 정보 전부 출력
	@RequestMapping("memberListAll")
	public List<MemberVO> memberListAll(MemberVO vo) {
		return service.memberListAll(vo);
	}
	
	//회원탈퇴시키기
	@GetMapping("memberDeleteOk")
	public int memberDeleteOk(String userid) {
		return service.memberDeleteOk(userid);
	}
	
}
