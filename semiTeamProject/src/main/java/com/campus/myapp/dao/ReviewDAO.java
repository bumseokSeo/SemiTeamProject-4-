package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ReviewVO;
@Mapper
@Repository
public interface ReviewDAO {
    //댓글등록
    public int reviewWrite(ReviewVO vo);
    //댓글목록
    public List<ReviewVO> reviewList(String id);
    //댓글수정
    public int reviewEdit(ReviewVO vo);
    //댓글삭제
    public int reviewDel(int reviewno, String uesrid);
    public ReviewVO getFileName(int reviewno); // 파일명 선택
    
    //리뷰 평점
  	public double staravg(ReviewVO id);
  	
  	//리뷰 개수
  	public int reviewcnt(ReviewVO id);


}