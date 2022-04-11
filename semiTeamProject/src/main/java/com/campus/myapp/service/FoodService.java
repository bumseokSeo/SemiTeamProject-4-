package com.campus.myapp.service;

import com.campus.myapp.vo.FoodVO;

public interface FoodService {
	
	//파일 이름 있는지 체크
	public int checkFilename(String filename);
	
	public int foodInsert(FoodVO vo);

}
