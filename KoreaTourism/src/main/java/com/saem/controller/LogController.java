package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.saem.domain.BReplyVO;
import com.saem.domain.LogVO;
import com.saem.service.BReplyService;
import com.saem.service.LogService;

@Controller
public class LogController {
	
	private static final Logger logger = LoggerFactory.getLogger(LogController.class);
	
	@Inject
	private LogService lService;
	
	@RequestMapping(value = "/login_info", method = RequestMethod.GET)
	public String login_info(Model model, LogVO lvo) throws Exception{

		model.addAttribute("userLog", lService.selectList(lvo));
		
		int pageNum = lvo.getPageNum();
		boolean prev = true, next = true;
		if (pageNum == 0)prev = false;
		lvo.setPageNum(pageNum + 10);
		if (lService.selectList(lvo).size() == 0) {
			next = false;
		}
		
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("login_info", "on");
		
		return "profile/login_info";
	}
	
}
