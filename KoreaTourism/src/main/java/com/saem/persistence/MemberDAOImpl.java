package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.saem.domain.member";
	
	@Override
	public List<MemberVO> select_list(int pageNum) throws Exception {
		return session.selectList(namespace+".select_list", pageNum);
	}
	
	@Override
	public List<MemberVO> select_delete(int pageNum) throws Exception {
		return session.selectList(namespace+".select_delete", pageNum);
	}
	
	@Override
	public MemberVO select_User(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".select_User", mvo);
	}

	@Override
	public MemberVO select_UserId(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".select_UserId", mvo);
	}
	
	@Override
	public MemberVO select_UserInfo(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".select_UserInfo", mvo);
	}
	
	@Override
	public MemberVO find_UserPass(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".find_UserPass", mvo);
	}
	
	@Override
	public void naver_join(MemberVO mvo) throws Exception {
		session.insert(namespace+".naver_join", mvo);
	}
	
	@Override
	public void default_join(MemberVO mvo) throws Exception {
		session.insert(namespace+".default_join",mvo);
	}
	
	@Override
	public void update_info(MemberVO mvo) throws Exception {
		session.update(namespace+".update_info",mvo);		
	}
	
	@Override
	public void update_password(MemberVO mvo) throws Exception {
		session.update(namespace+".update_password",mvo);
	}
	
	@Override
	public void update_withdrawal(MemberVO mvo) throws Exception {
		session.update(namespace+".update_withdrawal",mvo);			
	}
	
	@Override
	public MemberVO user_login(MemberVO mvo) throws Exception {
		return session.selectOne(namespace+".user_login", mvo);
	}
	
	@Override
	public void delete(MemberVO mvo) throws Exception {
		session.update(namespace+".delete", mvo);
	}
	
	@Override
	public void save(MemberVO mvo) throws Exception {
		session.update(namespace+".save", mvo);
	}
}
