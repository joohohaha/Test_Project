package com.saem.service;

import java.util.List;

import com.saem.domain.FreeBoardVO;

public interface FreeBoardService {
	public List<FreeBoardVO> select_list(int pageNum) throws Exception;
	public FreeBoardVO select(int f_id) throws Exception;
	public FreeBoardVO select_count() throws Exception;
	public List<FreeBoardVO> select_hotpost() throws Exception;
	public void insert(FreeBoardVO fboard) throws Exception;
	public void delete(int f_id) throws Exception;
	public void update(FreeBoardVO fboard) throws Exception;
	public void uphit(int f_id) throws Exception;
}
