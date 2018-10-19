package com.saem.persistence;

import java.util.List;

import com.saem.domain.MemberVO;

public interface MemberDAO {
	public List<MemberVO> select_list(int pageNum) throws Exception;
	public List<MemberVO> select_delete(int pageNum) throws Exception;
	public void naver_join(MemberVO mvo) throws Exception;
	public void default_join(MemberVO mvo) throws Exception;
	public MemberVO select_User(MemberVO mvo) throws Exception;
	public MemberVO select_UserId(MemberVO mvo) throws Exception;
	public MemberVO select_UserInfo(MemberVO mvo) throws Exception;
	public MemberVO find_UserPass(MemberVO mvo) throws Exception;
	public MemberVO user_login(MemberVO mvo) throws Exception;
	public void update_info(MemberVO mvo) throws Exception;
	public void update_withdrawal(MemberVO mvo) throws Exception;
	public void update_password(MemberVO mvo) throws Exception;
	public void save(MemberVO mvo) throws Exception;
	public void delete(MemberVO mvo) throws Exception;
}
