package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MapDAO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.StoreVO;

@Service
public class MapServiceImpl implements MapService {
	@Inject
	MapDAO dao;

	@Override
	public List<ReviewVO> myReviewListAll(String userid) {
		// TODO Auto-generated method stub
		return dao.myReviewListAll(userid);
	}

	@Override
	public int myreviewDeleteOk(int reviewno) {
		// TODO Auto-generated method stub
		return dao.myreviewDeleteOk(reviewno);
	}
	
	@Override
	public int addplace(StoreVO vo) {
		return dao.addplace(vo);
	}

	@Override
	public List<ReviewVO> reviewListAll(ReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewListAll(vo);
	}
	
	@Override
	public StoreVO getStore(String id) {
		// TODO Auto-generated method stub
		return dao.getStore(id);
	}
	
	@Override
	public double staravg(StoreVO id) {
		// TODO Auto-generated method stub
		return dao.avgstar(id);
	}

	@Override
	public int reviewcnt(StoreVO id) {
		return dao.reviewcnt(id);
	}
}