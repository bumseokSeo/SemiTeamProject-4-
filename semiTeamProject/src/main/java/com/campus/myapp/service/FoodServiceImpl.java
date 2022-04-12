package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.FoodDAO;
import com.campus.myapp.vo.FoodVO;

@Service
public class FoodServiceImpl implements FoodService {
	
	@Inject
	FoodDAO dao;

	@Override
	public int checkFilename(String filename) {
		
		return dao.checkFilename(filename);
	}
	
	@Override
	public int checkFoodName(String fname) {
		
		return dao.checkFoodName(fname);
	}

	@Override
	public int foodInsert(FoodVO vo) {
		
		return dao.foodInsert(vo);
	}

	@Override
<<<<<<< HEAD
	public String getfname() {
		// TODO Auto-generated method stub
		return dao.getfname();
=======
	public FoodVO getFoodData(String searchFood) {
		
		return dao.getFoodData(searchFood);
>>>>>>> 0605d22f4076ad5c585a690f66443ff201cd4fb1
	}

	


}
