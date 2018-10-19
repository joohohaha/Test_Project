package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.MemberVO;
import com.saem.persistence.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public List<MemberVO> select_list(int pageNum) throws Exception {
		return dao.select_list(pageNum);
	}
	
	@Override
	public List<MemberVO> select_delete(int pageNum) throws Exception {
		return dao.select_delete(pageNum);
	}
	
	@Override
	public MemberVO select_User(MemberVO mvo) throws Exception {
		return dao.select_User(mvo);
	}
	
	@Override
	public MemberVO select_UserId(MemberVO mvo) throws Exception {
		return dao.select_UserId(mvo);
	}
	
	@Override
	public MemberVO select_UserInfo(MemberVO mvo) throws Exception {
		return dao.select_UserInfo(mvo);
	}
	
	@Override
	public MemberVO find_UserPass(MemberVO mvo) throws Exception {
		return dao.find_UserPass(mvo);
	}
	
	@Override
	public void update_info(MemberVO mvo) throws Exception {
		dao.update_info(mvo);
	}
	
	@Override
	public void update_password(MemberVO mvo) throws Exception {
		dao.update_password(mvo);
	}
	
	@Override
	public MemberVO user_login(MemberVO mvo) throws Exception {
		return dao.user_login(mvo);
	}
	
	@Override
	public MemberVO user_logout(MemberVO mvo) throws Exception {
		return mvo;
	}
	
	@Override
	public void naver_join(MemberVO mvo) throws Exception {
		dao.naver_join(mvo);
	}
	
	@Override
	public void default_join(MemberVO mvo) throws Exception {
		dao.default_join(mvo);
	}
	
	@Override
	public void update_withdrawal(MemberVO mvo) throws Exception {
		dao.update_withdrawal(mvo);
	}
	
	@Override
	public void delete(MemberVO mvo) throws Exception {
		dao.delete(mvo);
	}
	
	@Override
	public void save(MemberVO mvo) throws Exception {
		dao.save(mvo);
	}
}
