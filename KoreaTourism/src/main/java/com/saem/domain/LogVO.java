package com.saem.domain;

public class LogVO {
	private int log_num;
	private String m_userid;
	private String log_date;
	private String log_ip;
	private String log_state;
	
	public int getLog_num() {
		return log_num;
	}
	public void setLog_num(int log_num) {
		this.log_num = log_num;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	public String getLog_date() {
		return log_date;
	}
	public void setLog_date(String log_date) {
		this.log_date = log_date;
	}
	public String getLog_ip() {
		return log_ip;
	}
	public void setLog_ip(String log_ip) {
		this.log_ip = log_ip;
	}
	public String getLog_state() {
		return log_state;
	}
	public void setLog_state(String log_state) {
		this.log_state = log_state;
	}
	
	private int pageNum;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
}
