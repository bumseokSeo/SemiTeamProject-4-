package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.CodyVO;

@Mapper
@Repository
public interface CodyDAO {
	//코디 추천 이미지 리스트 가져오기
	public List<CodyVO> codyRecommend(int temp, String sex);
	//코디 추가
	public int codyInsert(CodyVO vo);
	//cname 중복확인
	public Integer cnameCheck(String cname);
	
	//코디 리스트(all)
	public List<CodyVO> codyListAll();
	//코디 리스트(성별)
	public List<CodyVO> codyGenderList(String sex);
	//코디 리스트(style)
	public List<CodyVO> codyStyleList(String style, String sex);
}
