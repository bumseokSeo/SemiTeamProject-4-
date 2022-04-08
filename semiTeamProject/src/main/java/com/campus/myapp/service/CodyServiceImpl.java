package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.CodyDAO;
import com.campus.myapp.vo.CodyVO;

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
}
