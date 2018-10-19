package com.saem.persistence;

import java.util.List;

import com.saem.domain.BReplyVO;
import com.saem.domain.PSBoardVO;

public interface BReplyDAO {
	public List<BReplyVO> select_list(int b_num) throws Exception;
	public BReplyVO select_max(int b_num) throws Exception;
	public void insert_reply(BReplyVO rvo) throws Exception;
	public void delete_reply(BReplyVO rvo) throws Exception;
	public PSBoardVO select_count(int b_num) throws Exception; 
}
