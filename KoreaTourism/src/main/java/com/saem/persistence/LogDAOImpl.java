package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.LogVO;
import com.saem.domain.TourVO;

@Repository
public class LogDAOImpl implements LogDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.saem.domain.log";
	
	@Override
	public void insertLog(LogVO lvo) throws Exception {
		session.insert(namespace+".insertLog", lvo);
	}
	
	@Override
	public List<LogVO> selectList(LogVO lvo) throws Exception {
		return session.selectList(namespace+".selectList", lvo);
	}
	
	@Override
	public LogVO selectNext(LogVO lvo) throws Exception {
		return session.selectOne(namespace+".selectNext", lvo);
	}
}
