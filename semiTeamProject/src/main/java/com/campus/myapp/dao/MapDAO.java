package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

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
}