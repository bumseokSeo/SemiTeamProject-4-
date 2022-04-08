package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.CodyVO;

public interface CodyService {
	public List<CodyVO> codyRecommend(int temp, String sex);
	public int codyInsert(CodyVO vo);
}
