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
	public int foodInsert(FoodVO vo) {
		// TODO Auto-generated method stub
		return dao.foodInsert(vo);
	}


}
