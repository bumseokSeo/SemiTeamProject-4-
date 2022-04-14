package com.campus.myapp.dao;

import java.util.List;

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
	
	//회원정보수정 진입
	public MemberVO memberSelect(String userid);
	
	//회원정보수정
	public int memberUpdate(MemberVO vo);
	
	//회원탈퇴
	public int memberDelete(String userid);
	
	//맴버정보 전부 출력
	public List<MemberVO> memberListAll(MemberVO vo);
	
	//회원관리-탈퇴
	public int memberDeleteOk(String userid);
	
	//아이디 찾기
	public MemberVO findId(MemberVO vo);

	//비밀번호 찾기
	public MemberVO findPwd(MemberVO vo);
	
	//비밀번호 재설정
	public int resetPwdOk(MemberVO vo);
	
	
}

