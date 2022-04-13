package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ReviewVO;

public interface MapService {
	public List<ReviewVO> myReviewListAll(String userid);
}
