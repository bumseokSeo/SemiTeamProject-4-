package com.campus.myapp.service;

import java.util.List;
import com.campus.myapp.vo.ReviewVO;

public interface ReviewService {
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