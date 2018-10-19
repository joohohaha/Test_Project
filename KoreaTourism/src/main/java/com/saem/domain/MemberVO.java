package com.saem.domain;

public class MemberVO {
	private String m_userid;
	private String m_password;
	private String m_name;
	private String m_birth;
	private String m_email;
	private String m_road_addr;
	private String m_salt;
	private String m_joindate;
	private boolean m_emailcheck;
	private String m_gender;
	private String m_confirm;
	private int m_count;
	private int m_used;
	
	public int getM_used() {
		return m_used;
	}
	public void setM_used(int m_used) {
		this.m_used = m_used;
	}
	public int getM_count() {
		return m_count;
	}
	public void setM_count(int m_count) {
		this.m_count = m_count;
	}
	public String getM_confirm() {
		return m_confirm;
	}
	public void setM_confirm(String m_confirm) {
		this.m_confirm = m_confirm;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_road_addr() {
		return m_road_addr;
	}
	public void setM_road_addr(String m_road_addr) {
		this.m_road_addr = m_road_addr;
	}
	public String getM_salt() {
		return m_salt;
	}
	public void setM_salt(String m_salt) {
		this.m_salt = m_salt;
	}
	public String getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}
	public boolean isM_emailcheck() {
		return m_emailcheck;
	}
	public void setM_emailcheck(boolean m_emailcheck) {
		this.m_emailcheck = m_emailcheck;
	}
	
	
}
