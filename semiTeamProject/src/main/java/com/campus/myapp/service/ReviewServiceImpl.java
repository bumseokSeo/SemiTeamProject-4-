package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReviewDAO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	
	@Override
	public int ReviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReviewVO> reviewList(PagingVO pVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReviewVO reviewSelect(int reviewno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int reviewUpdate(ReviewVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reviewDelete(int reviewno, String userid) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
