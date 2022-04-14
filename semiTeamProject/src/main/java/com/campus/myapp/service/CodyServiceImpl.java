package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.CodyDAO;
import com.campus.myapp.vo.CodyVO;
import com.campus.myapp.vo.HeartVO;

@Service
public class CodyServiceImpl implements CodyService {
	@Inject
	CodyDAO dao;

	//코디 추천이미지
	@Override
	public List<CodyVO> codyRecommend(int temp, String sex) {
		return dao.codyRecommend(temp, sex);
	}
	//코디 추가
	@Override
	public int codyInsert(CodyVO vo) {
		return dao.codyInsert(vo);
	}
	//cname 중복확인
	@Override
	public Integer cnameCheck(String cname) {
		return dao.cnameCheck(cname);
	}
	//코디 가져오기
	@Override
	public List<CodyVO> codySelect(String cname) {
		return dao.codySelect(cname);
	}
	//코디 수정
	@Override
	public int codyUpdate(CodyVO vo) {
		return dao.codyUpdate(vo);
	}
	//코디 삭제
	@Override
	public int codyDelete(String cname) {
		return dao.codyDelete(cname);
	}
	
	//전체
	@Override
	public List<CodyVO> codyListAll() {
		return dao.codyListAll();
	}
	//성별
	@Override
	public List<CodyVO> codyGenderList(String sex) {
		return dao.codyGenderList(sex);
	}
	//좋아요 목록
	@Override
	public List<HeartVO> codyHeartList(String userid) {
		return dao.codyHeartList(userid);
	}
	//스타일
	@Override
	public List<CodyVO> codyStyleList(String style, String sex) {
		return dao.codyStyleList(style, sex);
	}
	//좋아요 추가
	@Override
	public int heartInsert(String userid, String cname, String heartinfo) {
		return dao.heartInsert(userid, cname, heartinfo);
	}
	//좋아요 삭제
	@Override
	public int heartDelete(String userid, String cname) {
		return dao.heartDelete(userid, cname);
	}
	//좋아요 선택
	@Override
	public List<HeartVO> heartSelect(String userid) {
		return dao.heartSelect(userid);
	}

}
