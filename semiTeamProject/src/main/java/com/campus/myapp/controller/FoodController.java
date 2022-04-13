package com.campus.myapp.controller;




import java.io.File;
import java.nio.charset.Charset;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
	
	@PostMapping("/getFoodRecommend")
	@ResponseBody
	public List<FoodVO> foodRecommend(String weather){
		
		//음식 추천
		//우선 위 있는 음식에서 2개
		
		//음식 추천 화면으로 보낼 음식 리스트
		List<FoodVO> vo = new ArrayList<FoodVO>();
		
		//이벤트 일치 저장할 리스트
		//List<FoodVO> event = new ArrayList<FoodVO>();
		
		//날씨 일치, 계절 일치, 온도 해당 하는 음식 저장할 리스트
		List<FoodVO> foods = new ArrayList<FoodVO>();
		
		
		
		int cnt=0;
		//cnt<=2까지 일때
		//1. 오늘 날짜와 일치하는 이벤트 날짜 있는지 확인 -- 0개, 1개, 2개 이상...(여러개 있다면 이중 1개 선택해서 출력 리스트에 추가)
		//오늘 날짜
		LocalDate now = LocalDate.now();
		
		List<FoodVO> event = service.getEqualEvent(now.toString());
		
		if(event.size()>=2) {
			//1개 선택하기
			Collections.shuffle(event);
			vo.add(event.get(0));
			cnt=1;
		}else if(event.size()==1) {
			//1개
			vo.add(event.get(0));
			cnt=1;
		}
		//0개인 경우 - cnt = 0
		
		
		
		//2. 오늘 날씨와 일치하는 음식 있는지 확인
		/////////////////////////오늘 날씨를 받아와야 한다.....
		
		
		
		//3. 오늘 계절과 일치하는 음식 있는지 확인
		int month = now.getMonthValue();
		
		
		//4. 오늘 온도에 해당하는 음식 있는지 확인
		
		
		
		//2,3,4, 담는 리스트에 추가 <- (1번이 0개이면 2개 추출, 1개 이상이면 1개 추출)
		
		
		
		
		//우선 순위 없는 음식에서 3개
		//priorty==N인 음식 리스트 가져오기 그중 무작위 3개
				
		 return vo;
		
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
	
	
	 @PostMapping("/master/foodModify") 
	 public ResponseEntity<String> foodModifyOk(FoodVO vo, HttpServletRequest request){
		 
		 ResponseEntity<String> entity = null;
		 
		 HttpHeaders headers = new HttpHeaders();
		 
		 headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		 
		 System.out.println(vo.getFoodimg());
		 
		
		 if((vo.getEvent()).equals("no")) {
			 vo.setEvent(null);
		 }
		 if((vo.getWeather()).equals("allweather")) {
			 vo.setWeather(null);
		 }
		 
		 //DB에서 파일 이름 가져오기
		 String priorFile = service.getFileName(vo.getFname());
		 System.out.println(priorFile+"<<<");
		 
		 //파일 업로드를 위한 업로드 위치의 절대 주소
		 String path = request.getSession().getServletContext().getRealPath("/img/foodimg/upload");
		 
			 
			 try {
				 //새로 받은 이미지 파일 올리기
				 MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
				 
				 MultipartFile file = mr.getFile("filename");
				 
				 String fileName = file.getOriginalFilename();
				 
				 System.out.println(fileName);
				 
				 File f = new File(path, fileName);
				 
				///파일넣기	 
				 try {
					 file.transferTo(f);
					 System.out.println("파일 업로드");
					 
					 if(file!=null &&!file.isEmpty()) {
						 //첨부했다면
						 deleteFile(path, priorFile);
					 }
				 
					 vo.setFoodimg(fileName);
				 }catch(Exception ex) {
					 
				 }
				 //DB 업데이트
				 
				 service.foodUpdate(vo);
				 
				 String msg = "<script>alert('음식 수정이 완료되었습니다.');location.href='/master/master_food';</script>";
				 
				 entity = new ResponseEntity(msg, headers, HttpStatus.OK);
				 
				 
				 
			 }catch(Exception e) {
				 
				 e.printStackTrace();
				 
				 deleteFile(path, vo.getFoodimg());
				 
				 String msg = "<script>alert('음식 수정을 실패하였습니다.');history.back();</script>";
				 entity = new ResponseEntity(msg, headers, HttpStatus.BAD_REQUEST);
				 
			 }
		
		 return entity;

	 }



	
	//파일 삭제
	public void deleteFile(String p, String f) {
		
		if(f!=null) {
			
			File file = new File(p,f);
			file.delete();
		}
		
	}
	
	
}
