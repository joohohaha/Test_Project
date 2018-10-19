package com.saem.persistence;

import java.util.List;

import com.saem.domain.LogVO;

public interface LogDAO {
	public List<LogVO> selectList(LogVO lvo) throws Exception;
	public LogVO selectNext(LogVO lvo) throws Exception;
	public void insertLog(LogVO lvo) throws Exception;
}
