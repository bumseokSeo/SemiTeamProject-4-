package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.Paging10VO;
import com.campus.myapp.vo.Paging15VO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.StoreVO;

public interface MapService {
	public List<ReviewVO> myReviewListAll(String userid);
	public int myreviewDeleteOk(int reviewno);	
	public int addplace(StoreVO vo);
	public List<ReviewVO> reviewListAll(Paging10VO vo);

	public StoreVO getStore(String id);
	public ReviewVO reviewCntSelectAll(String id);
	
	public int totalRecord(Paging10VO pvo);
	public int reviewDeleteOk(int reviewno);
}