package com.campus.myapp.controller;

import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.ReviewService;
import com.campus.myapp.vo.ReviewVO;

@RestController
public class ReviewController {
    @Inject
    ReviewService service;
    //
    @RequestMapping(value="/review/writeOk", method=RequestMethod.POST)
    public int writeOk(ReviewVO vo, HttpSession session) {
        vo.setUserid((String)session.getAttribute("logId"));
        System.out.println(vo);
        return service.reviewWrite(vo);
    }
    //´ñ±Û¸ñ·Ï
    @GetMapping("/review/list")
    public List<ReviewVO> list(int no) {
        return service.reviewList(no);
    }
    //´ñ±Û¼öÁ¤
    @PostMapping("/review/editOk")
    public int editOk(ReviewVO vo, HttpSession session) {
        vo.setUserid((String)session.getAttribute("logId"));
        return service.reviewEdit(vo);
    }
    //´ñ±Û»èÁ¦
    @GetMapping("/review/del")
    public int delOk(int replyno, HttpSession session) {
        return service.reviewDel(replyno, (String)session.getAttribute("logId"));
    }
}