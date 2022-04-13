package com.campus.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReviewDAO;
import com.campus.myapp.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
    @Autowired
    ReviewDAO dao;

    @Override
    public int reviewWrite(ReviewVO vo) {
        return dao.reviewWrite(vo);
    }

    @Override
    public List<ReviewVO> reviewList(int reviewno) {
        return dao.reviewList(reviewno);
    }

    @Override
    public int reviewEdit(ReviewVO vo) {
        return dao.reviewEdit(vo);
    }

    @Override
    public int reviewDel(int reviewno, String uesrid) {
        return dao.reviewDel(reviewno, uesrid);
    }

}