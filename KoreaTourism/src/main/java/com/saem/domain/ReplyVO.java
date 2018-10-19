package com.saem.domain;

public class ReplyVO {
	private int r_num;
	private String m_userid;
	private String tour_name;
	private String r_content;
	private int r_used;
	private String r_writedate;
	
	public String getTour_name() {
		return tour_name;
	}
	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getR_used() {
		return r_used;
	}
	public void setR_used(int r_used) {
		this.r_used = r_used;
	}
	public String getR_writedate() {
		return r_writedate;
	}
	public void setR_writedate(String r_writedate) {
		this.r_writedate = r_writedate;
	}
}
