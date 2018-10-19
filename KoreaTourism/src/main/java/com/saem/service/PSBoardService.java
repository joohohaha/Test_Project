package com.saem.service;

import java.util.List;

import com.saem.domain.PSBoardVO;

public interface PSBoardService {
	public List<PSBoardVO> select_list(int pageNum) throws Exception;
	public List<PSBoardVO> select_delete(int pageNum) throws Exception;
	public List<PSBoardVO> select_notice() throws Exception;
	public List<PSBoardVO> select_search(PSBoardVO pvo) throws Exception;
	public List<PSBoardVO> select_hotpost() throws Exception;
	public PSBoardVO select(int b_num) throws Exception;
	public PSBoardVO select_count() throws Exception;
	public PSBoardVO view(int b_num) throws Exception;
	public void insert(PSBoardVO pvo) throws Exception;
	public void uphit(int b_num) throws Exception;
	public void delete(int b_num) throws Exception;
	public void save(int b_num) throws Exception;
	public void update(PSBoardVO pvo) throws Exception;
}
