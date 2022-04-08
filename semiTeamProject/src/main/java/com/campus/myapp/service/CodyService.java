package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.CodyVO;

public interface CodyService {
	//코디 추천 이미지 리스트 가져오기
	public List<CodyVO> codyRecommend(int temp, String sex);
	//코디 추가
	public int codyInsert(CodyVO vo);
	//cname 중복확인
	public int cnameCheck(String cname);
}
