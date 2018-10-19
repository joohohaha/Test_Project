package com.saem.persistence;

import java.util.List;

import com.saem.domain.ReplyVO;
import com.saem.domain.TourVO;

public interface ReplyDAO {
	public List<ReplyVO> select_list(String tour_name) throws Exception;
	public TourVO select_count(String tour_name) throws Exception;
	public void insert_reply(ReplyVO rvo) throws Exception;
	public void delete_reply(ReplyVO rvo) throws Exception;
}
