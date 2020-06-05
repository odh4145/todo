package com.odh.todo.beans;

import java.security.Timestamp;

public class todoDTO {
	private int tid;
	private String title;
	private String img;
	private Timestamp tdate;
	private int act;
	
	public todoDTO() {
		System.out.println("todoDTO() 생성");
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Timestamp getTdate() {
		return tdate;
	}
	public void setTdate(Timestamp tdate) {
		this.tdate = tdate;
	}
	public int getAct() {
		return act;
	}
	public void setAct(int act) {
		this.act = act;
	}
}
