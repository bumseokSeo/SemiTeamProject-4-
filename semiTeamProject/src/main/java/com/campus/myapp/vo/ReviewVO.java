package com.campus.myapp.vo;

public class ReviewVO {
    private String placeid;
    private String userid;
    private int reviewno;
    private double star;
    private String content;
    private String reviewimg;
    private String writedate;
    private String modifydate;
    private String placename;

    public String getPlaceid() {
        return placeid;
    }
    public void setPlaceid(String placeid) {
        this.placeid = placeid;
    }
    public String getUserid() {
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
	public String getPlacename() {
		return placename;
	}
	public void setPlacename(String placename) {
		this.placename = placename;
	}
}