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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.ReviewVO;

@RestController
public class ReviewController {
	@Inject
	ReviewService service;
	//

	//댓글목록
	@GetMapping("/review/list")
	public List<ReviewVO> list(String placeid) {
		System.out.println(placeid);
		return service.reviewList(placeid);
	}
	//댓글수정
	@PostMapping("/review/editOk")
	public int editOk(ReviewVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		return service.reviewEdit(vo);
	}
	//댓글삭제
	@GetMapping("/review/del")
	public int delOk(int reviewno, HttpSession session) {
		return service.reviewDel(reviewno, (String)session.getAttribute("logId"));
	}

	// 리뷰등록
	@PostMapping("review/writeOk")
	public ResponseEntity<String> reviewWriteOk(ReviewVO vo, HttpServletRequest request) {

		vo.setUserid((String)request.getSession().getAttribute("logId"));// 글쓴이 

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));

		String path = request.getSession().getServletContext().getRealPath("/upload"); // 파일 업로드를 위한 업로드 위치의 절대 주소
		System.out.println("path-->"+path);

		try {
			// 파일업로드를 처리하기 위해서는 request객체에서 multipart객체로 형변환하여야 한다.
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;

			// mr 파일의 수만큼 MultipartFile객체가 존재한다.
			List<MultipartFile> files = mr.getFiles("file");
			System.out.println("업로드 파일 수 = "+files.size());

			if(files!=null) { // if 111111

				int cnt = 1;// 업로드 순서에 따라 filename1 ,filename2에 파일명을 대입하기 위한 변수

				// 첨부파일수 만큼 반복하여 업로드한다.
				for(int i=0; i<files.size(); i++) { // for 222222
					// 1. MultiaprtFile객체 얻어오기
					MultipartFile mf = files.get(i);

					// 2. 업로드한 실제 파일명을 구하기
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName ==> "+orgFileName);

					// 3. rename하기
					if(orgFileName!=null && !orgFileName.equals("")) { // if 333333 파일명이 존재하면
						File f = new File(path, orgFileName);

						// 파일이 존재하는지 확인 -> true: 파일이 존재한다, false: 파일이 없다.
						if(f.exists()) { // if 444444
							for(int renameNum=1;;renameNum++) { // for 555555
								// 확장자와 파일을 분리한다.
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0,point); // 확장자를 제외한 파일이름만 추출
								String ext = orgFileName.substring(point+1); // 확장자만 추출

								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) { // 새로 생성된 파일 객체가 없으면
									orgFileName = f.getName();
									break;
								}
							} // for 555555
						} // if 444444

						// 4. 파일 업로드
						try {
							mf.transferTo(f); // 실제 업로드가 발생함 
						}catch(Exception ee){

						}
						// 5. 업로드 (새로운 파일명) vo에 세팅
						if(cnt==1) vo.setReviewimg(orgFileName);

						cnt++;
					} //if 333333 
				} //

			} // if 111111
			System.out.println(vo.toString());

			// DB등록
			service.reviewWrite(vo);
			// 레코드 추가 성공
			String msg = "<script>alert('리뷰가 등록되었습니다.');location.href='/map/main_map';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			// 레코드 추가 실패

			// 실패 안내 메세지 생성
			String msg = "<script>alert('리뷰 등록을 실패하였습니다.');history.back();</script>";

			// 이전페이지로 보내기(javascript)
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST); // 400
		}
		return entity;
	}
}