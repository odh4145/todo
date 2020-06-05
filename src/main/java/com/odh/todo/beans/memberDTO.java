package com.odh.todo.beans;

public class memberDTO {
	private int mid;
	private String id;
	private String pw;
		
	public memberDTO() {
		System.out.println("memberDTO 생성");
	}
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}
