package com.campus.myapp.dao;

import java.util.List;

import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.ReviewVO;

public interface ReviewDAO {
	
	// 리뷰등록
	public int ReviewInsert(ReviewVO vo);
	// 리뷰목록
	public List<ReviewVO> reviewList(PagingVO pVO);
	// 총 레코드 수 
	public int totalRecord(PagingVO pVO);
	// 글 1개 선택
	public ReviewVO reviewSelect(int reviewno);
	// 글 수정
	public int reviewUpdate(ReviewVO vo);
	// 글 삭제
	public int reviewDelete(int reviewno, String userid);
}
