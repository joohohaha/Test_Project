package com.saem.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saem.domain.FreeBoardVO;


@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

   @Inject
   private SqlSession session;

   private static String namespace = "com.saem.domain.freeboard";

   @Override
   public List<FreeBoardVO> select_list(int pageNum) throws Exception {
      return session.selectList(namespace + ".select_list", pageNum);
   }
   
   @Override
   public FreeBoardVO select(int f_id) throws Exception {
      return session.selectOne(namespace + ".select", f_id);
   }
   
   @Override
   public FreeBoardVO select_count() throws Exception {
		return session.selectOne(namespace + ".select_count");
   }
   
   @Override
	public List<FreeBoardVO> select_hotpost() throws Exception {
		return session.selectList(namespace + ".select_hotpost");
   }
   
   @Override
   public void insert(FreeBoardVO fboard) throws Exception {
      session.insert(namespace + ".insert", fboard);

   }

   @Override
   public void delete(int f_id) throws Exception {
      session.delete(namespace + ".delete", f_id);
      
   }

   @Override
   public void update(FreeBoardVO fboard) throws Exception {
      session.update(namespace + ".update", fboard);
   }
   
   @Override
   public void uphit(int f_id) throws Exception {
      session.update(namespace + ".uphit", f_id);
   }

}