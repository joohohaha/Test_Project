package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.BReplyVO;
import com.saem.domain.PSBoardVO;

@Repository
public class BReplyDAOImpl implements BReplyDAO {

	@Inject
   	private SqlSession session;

   	private static final String namespace = "com.saem.domain.breply";

   	@Override
	public List<BReplyVO> select_list(int b_num) throws Exception {
		return session.selectList(namespace+".select_list", b_num);
	}

   	@Override
   	public BReplyVO select_max(int b_num) throws Exception {
   		return session.selectOne(namespace+".select_max", b_num);
   	}
   	
   	@Override
	public void insert_reply(BReplyVO rvo) throws Exception {
		session.insert(namespace+".insert_reply", rvo);
	}
   	
   	@Override
   	public void delete_reply(BReplyVO rvo) throws Exception {
   		session.update(namespace+".delete_reply", rvo);
   	}
   	
   	@Override
   	public PSBoardVO select_count(int b_num) throws Exception {
   		return session.selectOne(namespace+".select_count", b_num);
   	}
   	
}