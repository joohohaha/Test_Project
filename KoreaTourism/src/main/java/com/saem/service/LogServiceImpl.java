package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.LogVO;
import com.saem.domain.TourVO;
import com.saem.persistence.LogDAO;
import com.saem.persistence.TourDAO;

@Service
public class LogServiceImpl implements LogService{
	
	@Inject
	private LogDAO dao;
	
	@Override
	public void insertLog(LogVO lvo) throws Exception {
		dao.insertLog(lvo);
	}
	
	@Override
	public List<LogVO> selectList(LogVO lvo) throws Exception {
		return dao.selectList(lvo);
	}
	
	@Override
	public LogVO selectNext(LogVO lvo) throws Exception {
		return dao.selectNext(lvo);
	}
}
