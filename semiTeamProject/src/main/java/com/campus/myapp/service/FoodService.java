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

}
