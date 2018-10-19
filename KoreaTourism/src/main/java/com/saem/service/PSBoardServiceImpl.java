package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.saem.domain.PSBoardVO;
import com.saem.persistence.PSBoardDAO;

@Service
public class PSBoardServiceImpl implements PSBoardService {

	@Inject
	private PSBoardDAO dao;

	@Override
	public List<PSBoardVO> select_list(int pageNum) throws Exception {
		return dao.select_list(pageNum);
	}
	
	@Override
	public List<PSBoardVO> select_delete(int pageNum) throws Exception {
		return dao.select_delete(pageNum);
	}
	
	@Override
	public List<PSBoardVO> select_notice() throws Exception {
		return dao.select_notice();
	}
	
	@Override
	public List<PSBoardVO> select_search(PSBoardVO pvo) throws Exception {
		return dao.select_search(pvo);
	}
	
	@Override
	public List<PSBoardVO> select_hotpost() throws Exception {
		return dao.select_hotpost();
	}

	@Override
	public PSBoardVO select(int b_num) throws Exception {
		return dao.select(b_num);
	}
	
	@Override
	public PSBoardVO select_count() throws Exception {
		return dao.select_count();
	}
	
	@Override
	public PSBoardVO view(int b_num) throws Exception {
		return dao.select(b_num);
	}
	
	@Override
	public void uphit(int b_num) throws Exception {
		dao.uphit(b_num);
	}

	@Override
	public void insert(PSBoardVO sboard) throws Exception {
		dao.insert(sboard);
	}

	@Override
	public void delete(int b_num) throws Exception {
		dao.delete(b_num);
	}
	
	@Override
	public void save(int b_num) throws Exception {
		dao.save(b_num);
	}

	@Override
	public void update(PSBoardVO sboard) throws Exception {
		dao.update(sboard);
	}

}
