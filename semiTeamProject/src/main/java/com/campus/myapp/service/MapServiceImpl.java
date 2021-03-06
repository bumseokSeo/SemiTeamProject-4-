package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MapDAO;
import com.campus.myapp.vo.Paging10VO;
import com.campus.myapp.vo.Paging15VO;
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
	public StoreVO getStore(String id) {
		// TODO Auto-generated method stub
		return dao.getStore(id);
	}

	@Override
	public ReviewVO reviewCntSelectAll(String id) {
		// TODO Auto-generated method stub
		return dao.reviewCntSelectAll(id);
	}

	@Override
	public int totalRecord(Paging10VO pvo) {
		// TODO Auto-generated method stub
		return dao.totalRecord(pvo);
	}

	@Override
	public List<ReviewVO> reviewListAll(Paging10VO vo) {
		// TODO Auto-generated method stub
		return dao.reviewListAll(vo);
	}

	@Override
	public int reviewDeleteOk(int reviewno) {
		// TODO Auto-generated method stub
		return dao.reviewDeleteOk(reviewno);
	}
	
	

	
}