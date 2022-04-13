package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginCheck(vo);
	}

	@Override
	public int idCheck(String userid) {
		// TODO Auto-generated method stub
		return dao.idCheck(userid);
	}

	@Override
	public MemberVO memberSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.memberSelect(userid);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}

	@Override
	public int memberDelete(String userid) {
		// TODO Auto-generated method stub
		return dao.memberDelete(userid);
	}

	

	@Override
	public int memberDeleteOk(String userid) {
		// TODO Auto-generated method stub
		return dao.memberDeleteOk(userid);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findId(vo);
	}

	@Override
	public MemberVO findPwd(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findPwd(vo);
	}

	@Override
	public int resetPwdOk(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.resetPwdOk(vo);
	}

	@Override
	public List<MemberVO> memberListAll(String searchword) {
		// TODO Auto-generated method stub
		System.out.println(searchword);
		return dao.memberListAll(searchword);
		
	}

	

	

	

}
