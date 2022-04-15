package com.campus.myapp.vo;

public class ReviewVO {
    private String id;
    private String userid;
    private int reviewno;
    private double star;
    private String content;
    private String reviewimg;
    private String writedate;
    private String modifydate;
    private String place_name;
    private String searchword;

<<<<<<< HEAD
    public String getid() {
        return id;
    }
    public void setid(String id) {
        this.id = id;
    }
    public String getUserid() {
=======
    
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
>>>>>>> c224dea221d82e53a9ad298162a5d8ee6d0dc57c
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public int getReviewno() {
        return reviewno;
    }
    public void setReviewno(int reviewno) {
        this.reviewno = reviewno;
    }
    public double getStar() {
        return star;
    }
    public void setStar(double star) {
        this.star = star;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getReviewimg() {
        return reviewimg;
    }
    public void setReviewimg(String reviewimg) {
        this.reviewimg = reviewimg;
    }
    public String getWritedate() {
        return writedate;
    }
    public void setWritedate(String writedate) {
        this.writedate = writedate;
    }
    public String getModifydate() {
        return modifydate;
    }
    public void setModifydate(String modifydate) {
        this.modifydate = modifydate;
    }
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	
}