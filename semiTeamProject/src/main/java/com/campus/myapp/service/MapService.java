package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.StoreVO;

public interface MapService {
	public List<ReviewVO> myReviewListAll(String userid);
	public int myreviewDeleteOk(int reviewno);	
	public int addplace(StoreVO vo);
	public List<ReviewVO> reviewListAll(ReviewVO vo);
	public double staravg(StoreVO id);
	public int reviewcnt(StoreVO reviewcnt);
	public StoreVO getStore(String id);
}