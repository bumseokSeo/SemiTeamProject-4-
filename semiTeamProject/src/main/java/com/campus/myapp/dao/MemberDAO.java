package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MemberVO;
@Mapper
@Repository
public interface MemberDAO {
	//회원등록
	public int memberInsert(MemberVO vo);
	
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//아이디 중복 검사
	public int idCheck(String userid);
}

