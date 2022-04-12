package com.campus.myapp.controller;




import java.io.File;
import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.FoodService;
import com.campus.myapp.vo.FoodVO;

@Controller
public class FoodController {
	
	@Inject
	FoodService service;
	
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
	
	//파일 이름 중복 확인
	@PostMapping("/fileNameCheck")
	@ResponseBody
	public int fileNameCheck(@RequestParam("fileName") String fileName) {
		
		return service.checkFilename(fileName);
	}
	
	//음식 추가
	@PostMapping("/master/foodAdd")
	public ResponseEntity<String> foodAddOk(FoodVO vo, HttpServletRequest request){
		
		ResponseEntity<String> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8"))); 
		
		//이미 데이터베이스에 해당 이름의 음식이 있는지 확인
		int result = service.checkFoodName(vo.getFname());
		
		if(result>0) {
			
			String msg = "<script>alert('해당 음식은 이미 저장되어 있습니다.'); history.back(); </script>";
			
			entity = new ResponseEntity(msg, headers,HttpStatus.BAD_REQUEST );
			
		}else {		
			//파일 업로드를 위한 업로드 위치의 절대 주소
			String path = request.getSession().getServletContext().getRealPath("/img/foodimg/upload");
			
			System.out.println(path);
			
			//event가 no면 변경해주기
			if((vo.getEvent()).equals("no")) {
				vo.setEvent(null);
			}
			
			if((vo.getWeather()).equals("allweather")) {
				vo.setWeather(null);
			}
			
			System.out.println(vo.getEvent()); 
			System.out.println(vo.getPriority());
			
			try {
				
				//파일 업로드를 위해 request 객체에서 multipart 객체로 형변환
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
				
				MultipartFile file = mr.getFile("filename");
				
				String fileName = file.getOriginalFilename();
				System.out.println(fileName);
				
				File f = new File(path, fileName);
				
				//파일 업로드
				try {
					file.transferTo(f);
					System.out.println("파일 업로드");
					vo.setFoodimg(fileName);
					
				}catch(Exception ee) {
					
				}
				//DB에 추가
				service.foodInsert(vo);
				
				String msg = "<script>alert('음식이 추가가 완료되었습니다.');location.href='/master/master_food'; </script>";
			
				entity = new ResponseEntity(msg, headers,HttpStatus.OK );
				
			}catch(Exception e) {
				e.printStackTrace();
				//파일 삭제
				deleteFile(path, vo.getFoodimg());
				
				String msg = "<script>alert('음식이 추가를 실패하였습니다.'); history.back(); </script>";
				entity = new ResponseEntity(msg, headers,HttpStatus.BAD_REQUEST );
			}
		}
		return entity;
	}
	
	@PostMapping("/getFoodData")
	@ResponseBody
	public FoodVO sendFoodData(@RequestParam("searchFood") String searchFood) {
		
		return service.getFoodData(searchFood);
		
	}
	
	/*
	 * @PostMapping("/foodModify") public ResponseEntity<String> foodModifyOk(FoodVO
	 * vo, HttpServletRequest request){
	 * 
	 * 
	 * }
	 */


	
	//파일 삭제
	public void deleteFile(String p, String f) {
		
		if(f!=null) {
			
			File file = new File(p,f);
			file.delete();
		}
		
	}
	
	
}
