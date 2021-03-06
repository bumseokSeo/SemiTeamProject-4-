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
    public List<ReviewVO> reviewList(String id) {
        return dao.reviewList(id);
    }

    @Override
    public int reviewEdit(ReviewVO vo) {
        return dao.reviewEdit(vo);
    }

    @Override
    public int reviewDel(int reviewno, String uesrid) {
        return dao.reviewDel(reviewno, uesrid);
    }

	@Override
	public ReviewVO getFileName(int reviewno) {
		return dao.getFileName(reviewno);
	}

	@Override
	public double staravg(ReviewVO id) {
		// TODO Auto-generated method stub
		return dao.staravg(id);
	}

	@Override
	public int reviewcnt(ReviewVO id) {
		// TODO Auto-generated method stub
		return dao.reviewcnt(id);
	}

	@Override
	public ReviewVO reviewSelect(int reviewno) {
		// TODO Auto-generated method stub
		return dao.reviewSelect(reviewno);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewUpdate(vo);
	}


	

}