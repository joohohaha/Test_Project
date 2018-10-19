package com.saem.persistence;

import java.util.List;

import com.saem.domain.PSBoardVO;
import com.saem.domain.ReplyVO;

public interface PSBoardDAO {
	public List<PSBoardVO> select_list(int pageNum) throws Exception;
	public List<PSBoardVO> select_delete(int pageNum) throws Exception;
	public List<PSBoardVO> select_notice() throws Exception;
	public List<PSBoardVO> select_search(PSBoardVO pvo) throws Exception;
	public PSBoardVO select(int b_num) throws Exception;
	public PSBoardVO select_count() throws Exception;
	public List<PSBoardVO> select_hotpost() throws Exception;
	public void insert(PSBoardVO sboard) throws Exception;
	public void delete(int b_num) throws Exception;
	public void save(int b_num) throws Exception;
	public void update(PSBoardVO sboard) throws Exception;
	public void uphit(int b_num) throws Exception;
	public void reply_count(PSBoardVO pvo) throws Exception;
}
