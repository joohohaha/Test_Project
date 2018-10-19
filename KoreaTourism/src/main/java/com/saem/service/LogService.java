package com.saem.service;

import java.util.List;

import com.saem.domain.LogVO;

public interface LogService {
	public List<LogVO> selectList(LogVO lvo) throws Exception;
	public void insertLog(LogVO lvo) throws Exception;
	public LogVO selectNext(LogVO lvo) throws Exception;
}
