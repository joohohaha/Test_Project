package com.saem.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.saem.domain.PSBoardVO;
import com.saem.service.BReplyService;
import com.saem.service.PSBoardService;

@Controller
public class PSBoardController {

	@Inject
	private PSBoardService service;
	
	@Inject
	private BReplyService brService;

	private static final Logger logger = LoggerFactory.getLogger(PSBoardController.class);
	
	// select_list
	@RequestMapping(value = "/ps_board", method = RequestMethod.GET)
	public String list(Model model, PSBoardVO pvo) throws Exception {
		
		int pageNum = pvo.getPageNum();
		if(pvo.getSearch_cont() != null) {
			pvo.setSearch_cont("%"+pvo.getSearch_cont()+"%");//검색으로 들어왓는가 확인
			model.addAttribute("list", service.select_search(pvo));
		} else {
			model.addAttribute("list", service.select_list(pageNum));
		}
		
		
		boolean prev = true, next = true;
		
		if (pageNum == 0)prev = false;
		if (service.select_list(pageNum + 7).size() == 0)next = false;
		
		final int maxNum = service.select_count().getB_count();
		
		model.addAttribute("notice", service.select_notice());
		model.addAttribute("maxNum", maxNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		
		return "ps_board/ps_board";
	}
	
	@RequestMapping(value = "/psboard_hotPost", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String psboard_hotPost() throws Exception{
		final List<PSBoardVO> list = service.select_hotpost();
		final String result = new Gson().toJson(list).toString();
		return result;
	}
	
	// view
	@RequestMapping(value = "/ps_view", method = RequestMethod.GET)
	public String view(Model model, PSBoardVO pvo) throws Exception {
		final PSBoardVO posts = service.view(pvo.getB_num());
		final int b_num = pvo.getB_num();
		if(pvo.getM_userid() != null && !pvo.getM_userid().equals(posts.getM_userid())) {
			service.uphit(b_num);
		}
		model.addAttribute("posts", posts);
		model.addAttribute("breply_Data", brService.select_list(b_num));
		return "ps_board/ps_view";
	}

	// delete
	@RequestMapping(value = "/ps_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("b_num") int b_num) throws Exception {
		service.delete(b_num);
		return "redirect:ps_board";
	}

	// select
	@RequestMapping(value = "/ps_updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam("b_num") int b_num) throws Exception {
		model.addAttribute("posts", service.select(b_num));
		return "ps_board/ps_updateForm";
	}

	// update
	@RequestMapping(value = "/ps_update", method = RequestMethod.GET)
	public String update(PSBoardVO pvo) throws Exception {
		service.update(pvo);
		return "redirect:ps_board";
	}

	// insertForm
	@RequestMapping(value = "/ps_writeForm", method = RequestMethod.GET)
	public String insertForm(PSBoardVO sboard) throws Exception {
		return "ps_board/ps_writeForm";
	}

	// insert
	@RequestMapping(value = "/ps_insert", method = RequestMethod.GET)
	public String insert(PSBoardVO pvo) throws Exception {
		pvo.setB_used(1);
		service.insert(pvo);
		return "redirect:ps_board";
	}

}
