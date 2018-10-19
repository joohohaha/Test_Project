package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.PSBoardVO;
import com.saem.domain.ReplyVO;

@Repository
public class PSBoardDAOImpl implements PSBoardDAO {

	@Inject
	private SqlSession session;

   	private static final String namespace = "com.saem.domain.psboard";

   	@Override
   	public List<PSBoardVO> select_list(int pageNum) throws Exception {
   		return session.selectList(namespace + ".select_list", pageNum);
   	}
   	
   	@Override
   	public List<PSBoardVO> select_delete(int pageNum) throws Exception {
   		return session.selectList(namespace + ".select_delete", pageNum);
   	}
   	
   	@Override
   	public List<PSBoardVO> select_notice() throws Exception {
   		return session.selectList(namespace + ".select_notice");
   	}
   	
   	@Override
   	public List<PSBoardVO> select_search(PSBoardVO pvo) throws Exception {
   		return session.selectList(namespace + ".select_search", pvo);
   	}
   
   	@Override
	public List<PSBoardVO> select_hotpost() throws Exception {
		return session.selectList(namespace + ".select_hotpost");
	}
   
   	@Override
   	public PSBoardVO select(int b_num) throws Exception {
   		return session.selectOne(namespace + ".select", b_num);
   	}
   	
   	@Override
   	public PSBoardVO select_count() throws Exception {
   		return session.selectOne(namespace + ".select_count");
   	}

   	@Override
   	public void insert(PSBoardVO sboard) throws Exception {
   		session.insert(namespace + ".insert", sboard);
   	}
   	
   	@Override
   	public void delete(int b_num) throws Exception {
   		session.update(namespace + ".delete", b_num);
   	}		
   	
   	@Override
   	public void save(int b_num) throws Exception {
   		session.update(namespace + ".save", b_num);
   	}
   	
   	@Override
   	public void update(PSBoardVO pvo) throws Exception {
   		session.update(namespace + ".update", pvo);
   	}
   
   	@Override
   	public void uphit(int b_num) throws Exception {
   		session.update(namespace + ".uphit", b_num);
   	}

   	@Override
   	public void reply_count(PSBoardVO rvo) throws Exception {
   		session.update(namespace + ".reply_count", rvo);
   	}
}