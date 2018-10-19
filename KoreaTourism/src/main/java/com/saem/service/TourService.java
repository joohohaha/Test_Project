package com.saem.service;

import java.util.List;

import com.saem.domain.TourVO;

public interface TourService {
	public List<TourVO> selectAll() throws Exception;
	public List<TourVO> select_list(int pageNum) throws Exception;
	public List<TourVO> selectMain() throws Exception;
	public List<TourVO> selectSeg(String seg_name) throws Exception;
	public TourVO selectOneSeg(String tour_name) throws Exception;
	public void new_tour(TourVO tvo) throws Exception;
}
