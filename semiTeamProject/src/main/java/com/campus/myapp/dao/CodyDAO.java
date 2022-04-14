package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.CodyVO;
import com.campus.myapp.vo.HeartVO;

@Mapper
@Repository
public interface CodyDAO {
	//코디 추천 이미지 리스트 가져오기
	public List<CodyVO> codyRecommend(int temp, String sex);
	
	//코디 추가
	public int codyInsert(CodyVO vo);
	//cname 중복확인
	public Integer cnameCheck(String cname);
	//코디 선택
	public List<CodyVO> codySelect(String cname);
	//코디 수정
	public int codyUpdate(CodyVO vo);
	//코디 삭제
	public int codyDelete(String cname);
	
	//코디 리스트(all)
	public List<CodyVO> codyListAll();
	//코디 리스트(성별)
	public List<CodyVO> codyGenderList(String sex);
	//코디 리스트(style)
	public List<CodyVO> codyStyleList(String style, String sex);
	//코디 리스트(heart)
	public List<HeartVO> codyHeartList(String userid);
	
	//좋아요 추가
	public int heartInsert(String userid, String cname, String heartinfo);
	//좋아요 삭제
	public int heartDelete(String userid, String cname);
	//좋아요 검색
	public List<HeartVO> heartSelect(String userid);
	
	
}
