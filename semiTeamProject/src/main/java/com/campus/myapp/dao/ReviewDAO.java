package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ReviewVO;
@Mapper
@Repository
public interface ReviewDAO {
    //´ñ±Ûµî·Ï
    public int reviewWrite(ReviewVO vo);
    //´ñ±Û¸ñ·Ï
    public List<ReviewVO> reviewList(String placeid);
    //´ñ±Û¼öÁ¤
    public int reviewEdit(ReviewVO vo);
    //´ñ±Û»èÁ¦
    public int reviewDel(int reviewno, String uesrid);
    public ReviewVO getFileName(int reviewno); // ÆÄÀÏ¸í ¼±ÅÃ

}