package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.Paging15VO;
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
	
	//총 레코드 수 구하기
	public int totalRecord(Paging15VO pvo);
	
	//모든 맴버 구하기
	public List<MemberVO> memberListAll(Paging15VO pVO);
	
	//회원관리-탈퇴
	public int memberDeleteOk(String userid);
	
	//아이디 찾기
	public MemberVO findId(MemberVO vo);

	//비밀번호 찾기
	public MemberVO findPwd(MemberVO vo);
	
	//비밀번호 재설정
	public int resetPwdOk(MemberVO vo);
	
	
}

