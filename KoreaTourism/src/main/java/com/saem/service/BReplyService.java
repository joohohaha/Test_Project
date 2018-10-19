package com.saem.service;

import java.util.List;

import com.saem.domain.BReplyVO;

public interface BReplyService {
	public List<BReplyVO> select_list(int b_num) throws Exception;
	public BReplyVO select_max(int b_num) throws Exception;
	public void insert_reply(BReplyVO rvo) throws Exception;
	public void delete_reply(BReplyVO rvo) throws Exception;
}
