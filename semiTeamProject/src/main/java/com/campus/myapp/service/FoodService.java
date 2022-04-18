package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.FoodVO;

public interface FoodService {
	
	//파일 이름 있는지 체크
	public int checkFilename(String filename);
	
	//이미 해당 이름의 음식이 저장되어 있는지 확인
	public int checkFoodName(String fname);
	
	//폼의 음식 데이터 추가
	public int foodInsert(FoodVO vo);
	
	//해당 음식 데이터 가져오기
	public FoodVO getFoodData(String searchFood);
	
	//저장되어 있던 음식 이미지 파일 이름 가져오기
	public String getFileName(String fname);
	
	//음식 정보 수정
	public int foodUpdate(FoodVO vo);
	
	//현재 날짜와 이벤트가 일치하는 음식 가져오기
	public List<FoodVO> getEqualEvent(String event);
	
	//현재 날씨와 일치하는 음식 정보 가져오기
	public List<FoodVO> getEqualWeather(String todayWeather);
	
	//현재 계절과 일치하는 음식 정보 가져오기
	public List<FoodVO> getEqualSeason(String season);
	
	//기본 값이 아닌 현재 기온의 범위에 속하는 기온을 가지고 있는 음식 정보 가져오기
	public List<FoodVO> getEqualTemp(int temp);
	
	//우선순위 N인 음식 가져오기
	public List<FoodVO> getPriorityN(String priorityN);
	
	//음식 카테고리에 해당 하는 음식 정보 가져오기
	public List<FoodVO> getCategoryFood(String foodType);
	
	//전체 음식 가져오기
	public List<FoodVO> getAllFood();
	
	//기타 음식 가져오기
	public List<FoodVO> getEtcFood();

}
