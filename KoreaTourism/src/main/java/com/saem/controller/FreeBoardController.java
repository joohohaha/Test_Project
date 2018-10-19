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
import com.saem.domain.FreeBoardVO;
import com.saem.domain.PSBoardVO;
import com.saem.service.FreeBoardService;


@Controller
public class FreeBoardController {

	@Inject
	private FreeBoardService service;

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);

	// select_list
	@RequestMapping(value = "/fboard", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(value="pageNum", required=false, defaultValue="0") int pageNum) throws Exception {
		
		boolean prev = true, next = true;
		
		if(pageNum == 0) {
			prev = false;
		}
		if (service.select_list(pageNum+7).size() == 0) {
			next = false;
		}
		final int maxNum = service.select_count().getF_count();
		
		model.addAttribute("maxNum", maxNum);
		model.addAttribute("list", service.select_list(pageNum));
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		return "free_board/f_board";
	}
	
	// hotPosts
	@RequestMapping(value = "/fboard_hotPost", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String fboard_hotPost() throws Exception{
		final List<FreeBoardVO> list = service.select_hotpost();
		final String result = new Gson().toJson(list).toString();
		return result;
	}

	// view form
	@RequestMapping(value = "/f_view", method = RequestMethod.GET)
	public String view(Model model, FreeBoardVO user) throws Exception {
		int f_id = user.getF_id();
		String userID = user.getM_userid();
		FreeBoardVO data = service.select(f_id);
		if(!data.getM_userid().equals(userID)) {
			System.out.println("자유게시판 조회수 증가-- 들어온 사람 ID : " + userID);
			service.uphit(f_id);
		}
		model.addAttribute("fboard", data);
		return "free_board/f_view";
	}
	
	// update form
	@RequestMapping(value = "/f_updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, @RequestParam("f_id") int f_id) throws Exception {
		model.addAttribute("fboard", service.select(f_id));
		return "free_board/f_updateForm";
	}
	
	// delete Action
	@RequestMapping(value = "/f_delete", method = RequestMethod.GET)
	public String delete(@RequestParam("f_id") int f_id) throws Exception {
		service.delete(f_id);
		return "redirect:fboard";
	}

	// update Action
	@RequestMapping(value = "/f_update", method = RequestMethod.GET)
	public String update(FreeBoardVO fboard) throws Exception {
		service.update(fboard);
		return "redirect:fboard";
	}

	// insert Action
	@RequestMapping(value = "/f_insert", method = RequestMethod.GET)
	public String insert(FreeBoardVO fboard) throws Exception {
		service.insert(fboard);
		return "redirect:fboard";
	}

}
