package com.human.springboot;

import lombok.Data;

@Data
public class mj_hotelDTO {

	int business_id;
	String business_name;
	String business_owner;
	String business_type;
	String address;
	
	public int getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(int business_id) {
		this.business_id = business_id;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public String getBusiness_owner() {
		return business_owner;
	}
	public void setBusiness_owner(String business_owner) {
		this.business_owner = business_owner;
	}
	public String getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	
}
