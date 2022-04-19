package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.Paging10VO;
import com.campus.myapp.vo.ReviewVO;
import com.campus.myapp.vo.StoreVO;


@Mapper
@Repository
public interface MapDAO {
	
	//나의 리뷰 정보 전부 출력
	public List<ReviewVO> myReviewListAll(String userid);
	
	//나의 리뷰 삭제
	public int myreviewDeleteOk(int reviewno);

	//가게정보 등록
	public int addplace(StoreVO vo);	
	
	//리뷰정보 전부출력
	public List<ReviewVO> reviewListAll(Paging10VO vo);

	public StoreVO getStore(String id);

	//총 레코드 수 구하기
	public int totalRecord(Paging10VO pvo);
	
	
	//리뷰평균,총 갯수 구함
	public ReviewVO reviewCntSelectAll(String id);
	
	//관리자 리뷰 삭제
	public int reviewDeleteOk(int reviewno);
	
	
	
}