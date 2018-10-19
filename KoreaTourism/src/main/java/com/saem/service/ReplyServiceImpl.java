package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saem.domain.ReplyVO;
import com.saem.domain.TourVO;
import com.saem.persistence.ReplyDAO;
import com.saem.persistence.TourDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	@Inject
	private TourDAO tdao;

	@Override
	public List<ReplyVO> select_list(String tour_name) throws Exception {
		return dao.select_list(tour_name);
	}
	
	@Override
	public void insert_reply(ReplyVO rvo) throws Exception {
		dao.insert_reply(rvo);
	}
	
	@Transactional
	@Override
	public void select_count(String tour_name) throws Exception {
		TourVO tvo = dao.select_count(tour_name);
		tvo.setTour_name(tour_name);
		tdao.update_count(tvo);
	}
	
	@Override
	public void delete_reply(ReplyVO rvo) throws Exception {
		dao.delete_reply(rvo);
	}
}
