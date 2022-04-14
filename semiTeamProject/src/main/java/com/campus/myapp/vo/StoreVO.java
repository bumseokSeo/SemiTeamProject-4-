package com.campus.myapp.vo;

public class StoreVO {
    private String place_name;
    private String phone;
    private String road_address_name;
    private String address_name;    
    private String id;
    
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRoad_address_name() {
		return road_address_name;
	}

	public void setRoad_address_name(String road_address_name) {
		this.road_address_name = road_address_name;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	
	@Override
	public String toString() {
		return "StoreVO [place_name=" + place_name + ", phone=" + phone + ", road_address_name=" + road_address_name
				+ ", address_name=" + address_name + ", id=" + id + "]";
	}   
}