package com.saem.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.saem.domain.TourVO;
import com.saem.persistence.TourDAO;

@Service
public class TourServiceImpl implements TourService{
	
	@Inject
	private TourDAO dao;
	
	@Override
	public List<TourVO> selectAll() throws Exception {
		return dao.selectAll();
	}
	
	@Override
	public List<TourVO> select_list(int pageNum) throws Exception {
		return dao.select_list(pageNum);
	}
	
	@Override
	public List<TourVO> selectMain() throws Exception {
		return dao.selectMain();
	}
	@Override
	public List<TourVO> selectSeg(String seg_name) throws Exception {
		return dao.selectSeg(seg_name);
	}
	
	@Override
	public TourVO selectOneSeg(String tour_name) throws Exception {
		return dao.selectOneSeg(tour_name);
	}
	
	@Override
	public void new_tour(TourVO tvo) throws Exception {
		dao.new_tour(tvo);
	}
}
