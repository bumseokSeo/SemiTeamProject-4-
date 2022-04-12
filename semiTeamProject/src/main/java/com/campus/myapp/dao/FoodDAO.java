package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.FoodVO;

@Mapper
@Repository
public interface FoodDAO {
	
	//파일 이름 있는지 체크
	public int checkFilename(String filename);
	
	//이미 해당 이름의 음식이 저장되어 있는지 확인
	public int checkFoodName(String fname);
	
	//폼의 음식 데이터 추가
	public int foodInsert(FoodVO vo);

	public String getfname();
	
	//해당 음식 데이터 가져오기
	public FoodVO getFoodData(String searchFood);
	
	
	

}
