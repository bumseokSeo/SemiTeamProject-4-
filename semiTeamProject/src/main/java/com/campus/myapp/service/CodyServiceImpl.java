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

	@Override
	public List<CodyVO> codyRecommend(int temp, String sex) {
		return dao.codyRecommend(temp, sex);
	}

	@Override
	public int codyInsert(CodyVO vo) {
		return dao.codyInsert(vo);
	}

	@Override
	public Integer cnameCheck(String cname) {
		return dao.cnameCheck(cname);
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
	//스타일
	@Override
	public List<CodyVO> codyStyleList(String style, String sex) {
		return dao.codyStyleList(style, sex);
	}

	@Override
	public int heartInsert(String userid, String cname, String heartinfo) {
		return dao.heartInsert(userid, cname, heartinfo);
	}

	@Override
	public int heartDelete(String userid, String cname) {
		return dao.heartDelete(userid, cname);
	}

	@Override
	public List<HeartVO> heartSelect(String userid) {
		return dao.heartSelect(userid);
	}
}
