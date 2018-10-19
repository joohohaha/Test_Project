package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.PSBoardVO;
import com.saem.domain.ReplyVO;
import com.saem.domain.TourVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
   	private SqlSession session;

   	private static final String namespace = "com.saem.domain.reply";

   	@Override
	public List<ReplyVO> select_list(String tour_name) throws Exception {
		return session.selectList(namespace+".select_list", tour_name);
	}

   	@Override
   	public TourVO select_count(String tour_name) throws Exception {
   		return session.selectOne(namespace+".select_count", tour_name);
   	}
   	
   	@Override
	public void insert_reply(ReplyVO rvo) throws Exception {
		session.insert(namespace+".insert_reply", rvo);
	}
   	
   	@Override
   	public void delete_reply(ReplyVO rvo) throws Exception {
   		session.update(namespace+".delete_reply", rvo);
   	}
   	
}