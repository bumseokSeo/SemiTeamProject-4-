package com.campus.myapp.controller;




import java.io.File;
import java.nio.charset.Charset;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.bytecode.Descriptor.Iterator;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value="/getFoodRecommend", method=RequestMethod.GET)
	@ResponseBody
	public List<FoodVO> foodRecommend(String weather, String temp){

		System.out.println(weather);
		System.out.println(temp);
		//음식 추천
		//우선 순위 있는 음식에서 2개
		
		//음식 추천 화면으로 보낼 음식 리스트
		List<FoodVO> list = new ArrayList<FoodVO>();
		
		//날씨 일치, 계절 일치, 온도 해당 하는 음식 저장할 리스트
		HashSet<FoodVO> foods = new HashSet<FoodVO>();
		
		
		int cnt=0;
		//cnt<=2까지 일때
		//1. 오늘 날짜와 일치하는 이벤트 날짜 있는지 확인 -- 0개, 1개, 2개 이상...(여러개 있다면 이중 1개 선택해서 출력 리스트에 추가)
		//오늘 날짜
		LocalDate now = LocalDate.now();
		System.out.println(now.toString());
		//오늘 날짜와 일치하는 이벤트 있는 음식 저장
		List<FoodVO> event = service.getEqualEvent(now.toString());
		
		
		if(event.size()>=2) {
			//1개 선택하기
			Collections.shuffle(event);
			list.add(event.get(0));
			cnt=1;
		}else if(event.size()==1) {
			//1개
			list.add(event.get(0));
			cnt=1;
		}
		//0개인 경우 - cnt = 0 넘어간다
		
		
		//2. 오늘 날씨와 일치하는 음식 있는지 확인
		//오늘 날씨
		//System.out.println(weather);
		
		String todayWeather = "";
		
		if(weather.contains("맑음")) {
			todayWeather = "clear";
			
		}else if(weather.contains("비") || weather.contains("소나기")) {
			
			todayWeather = "rain";
			
		}else if(weather.contains("눈")) {
			todayWeather = "snow";
			
		}
		if(!todayWeather.equals("")) {
			foods.addAll(service.getEqualWeather(todayWeather));
		}
		
		
		//3. 오늘 계절과 일치하는 음식 있는지 확인
		int month = now.getMonthValue();
		
		String season = "";
		
		if(month>=3 && month <=5) {
			season = "spring";
		}else if(month>=6 && month <=8) {
			season = "summer";
		}else if(month>=9 && month <=11) {
			season = "fall";
		}else if(month <= 2 || month ==12) {
			season = "winter";
		}
		
		if(!season.equals("")) {
			foods.addAll(service.getEqualSeason(season));		
		}
		
		
		//4. 오늘 온도에 해당하는 음식 있는지 확인
		Double tem = Double.parseDouble(temp);
		int temperature = 0;
		
		if(tem <=15) {
			temperature = 2;
		}else if(tem>=25) {
			temperature= 1;
		}
		
		if(temperature >0) {
			foods.addAll(service.getEqualTemp(temperature));
		}
		
		
		
		//event에서 선택된 것과 중복되는 데이터 삭제
		if(list.size()>0) {
			foods.removeIf(FoodVO->FoodVO.getFname().equals(list.get(0).getFname()));
		}
		
		// 2,3,4추가후 객체 중복 제거
		//fname으로 객체 제거 
		
		for(FoodVO fvo: foods) {
			System.out.println(fvo.getFname());
		}
		
		List<FoodVO> f = new ArrayList<FoodVO>(foods);
		
		//2,3,4, 담는 리스트에 추가 <- (1번이 0개이면 2개 추출, 1개 이상이면 1개 추출)
		
		
		if(f.size()>0) {
			
			Collections.shuffle(f);
			list.add(f.get(0));
			cnt++;
			
			if(cnt==1 && f.size()>1) {
				list.add(f.get(1));
				cnt++;
			}
		}
		
		for(FoodVO fvo: list) {
			System.out.println(fvo.getFname()+ "+");
		}
			
		
		//우선 순위 없는 음식 가져오기
		//priorty==N인 음식 리스트 가져오기 그중 무작위 3개 또는 4개 또는 5개
		List<FoodVO> priorityN = service.getPriorityN("N");
		Collections.shuffle(priorityN);
			
		int i=0;
		while(cnt<5) {
			list.add(priorityN.get(i));
			i++;
			cnt++;
		}
		/*
			
		for(FoodVO fvo: list) {
			System.out.println(fvo.getFname());
		}
		*/
			
		return list;
		
	}
	
	@GetMapping("/master/master_food")
	public ModelAndView foodAdminPage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master/master_food");
		return mav;
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
			String path = "/img/foodimg/upload";
			//String path = request.getSession().getServletContext().getRealPath("/img/foodimg/upload");
			
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
				
				String orgFileName = file.getOriginalFilename();
				System.out.println(orgFileName);
				
				/////////////////////////////////////////////////////
				//rename
				if(orgFileName != null && !orgFileName.equals("")) {
					
					File f = new File(path, orgFileName);
					
					//파일이 존재하는지 확인
					if(f.exists()) {
						
						for(int num=1; ; num++) {
							
							int point = orgFileName.lastIndexOf(".");
							
							String fileName = orgFileName.substring(0,point);
							
							String ext = orgFileName.substring(point+1);
							
							f = new File(path, fileName + "(" + num + ")."+ ext);
							
							if(!f.exists()) {
								orgFileName = f.getName();
								break;
									
							}
						}
						
					}//파일 존재 확인 완료
					
					//파일 업로드
					try {
						file.transferTo(f);
						System.out.println("파일 업로드");
						vo.setFoodimg(orgFileName);
						
					}catch(Exception ee) {
						
					}
					
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

	@PostMapping("/showfoods")
	@ResponseBody
	public List<FoodVO> showFoods(@RequestParam("foodType") String type) {
		
		List<FoodVO> foods = new ArrayList<FoodVO>();
		
		if(type.equals("전체")) {
			foods = service.getAllFood();
		}else if(type.equals("기타")){
			foods = service.getEtcFood();
		}else {
			foods = service.getCategoryFood(type);
		}
		return foods;
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
		 String path = "/img/foodimg/upload";
		 //String path = request.getSession().getServletContext().getRealPath("/img/foodimg/upload");
		 
			 
			 try {
				 //새로 받은 이미지 파일 올리기
				 MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
				 
				 MultipartFile newfile = mr.getFile("filename");
				 
				 
				 ////////////////////////////////////////////////////////////////////////
				 if(newfile != null) { //새로 업로드 된 파일 있을 경우
					 
					 String fileName = newfile.getOriginalFilename();
					 
					 if(fileName != null && !fileName.equals("")) {
						 
						 File f = new File(path, fileName);
						 
						 if(f.exists()) { //같은 이름의 파일이 있을 경우
							 
							 for(int num=1;;num++) {
								 
								 int point = fileName.lastIndexOf(".");
								 
								 String fileNameExt = fileName.substring(0,point);
								 String ext = fileName.substring(point+1);
								 
								 f = new File(path, fileNameExt +"(" + num +")." + ext);
								 
								 if(!f.exists()) {
									 fileName = f.getName();
									 break;
									 
								 }
								 
							 }//for
						 }///if 같은 이름의 파일
						 
						///파일넣기	 
						 try {
							 newfile.transferTo(f);
							 System.out.println("파일 업로드");
							 
							 if(!newfile.isEmpty()) {
								 //첨부했다면
								 deleteFile(path, priorFile);
							 }
						 
							 vo.setFoodimg(fileName);
						 }catch(Exception ex) {}
						 
						 
					 }//if
					  
				 }//if
				 
				 
				
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


