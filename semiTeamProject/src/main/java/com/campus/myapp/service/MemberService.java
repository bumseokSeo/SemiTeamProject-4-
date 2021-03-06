package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.Paging15VO;

public interface MemberService {
	public int memberInsert(MemberVO vo);
	public MemberVO loginCheck(MemberVO vo);
	public int idCheck(String userid);
	public MemberVO memberSelect(String userid);
	public int memberUpdate(MemberVO vo);
	public int memberDelete(String userid);
	public int totalRecord(Paging15VO pvo);
	public int memberDeleteOk(String userid);
	public MemberVO findId(MemberVO vo);
	public MemberVO findPwd(MemberVO vo);
	public int resetPwdOk(MemberVO vo);
	public List<MemberVO> memberListAll(Paging15VO pVO);
}
