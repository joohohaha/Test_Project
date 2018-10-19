package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saem.domain.BReplyVO;
import com.saem.domain.PSBoardVO;
import com.saem.persistence.BReplyDAO;
import com.saem.persistence.PSBoardDAO;

@Service
public class BReplyServiceImpl implements BReplyService {

	@Inject
	private BReplyDAO dao;
	
	@Inject
	private PSBoardDAO pdao;

	@Override
	public List<BReplyVO> select_list(int b_num) throws Exception {
		return dao.select_list(b_num);
	}
	
	@Transactional
	@Override
	public void insert_reply(BReplyVO rvo) throws Exception {
		//덧글 추가
		dao.insert_reply(rvo);
		// 갱신된 댓글의 갯수 가져옴
		PSBoardVO pvo = dao.select_count(rvo.getB_num());
		// b_num Set한다.
		pvo.setB_num(rvo.getB_num());
		// 게시판의 덧글수 갱신
		pdao.reply_count(pvo);
	}
	
	@Override
	public BReplyVO select_max(int b_num) throws Exception {
		return dao.select_max(b_num);
	}
	
	@Transactional
	@Override
	public void delete_reply(BReplyVO rvo) throws Exception {
		//덧글 삭제
		dao.delete_reply(rvo);
		// 갱신된 댓글의 갯수 가져옴
		PSBoardVO pvo = dao.select_count(rvo.getB_num());
		// b_num Set한다.
		pvo.setB_num(rvo.getB_num());
		// 게시판의 덧글수 갱신
		pdao.reply_count(pvo);
	}
}
