package com.saem.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.saem.domain.BReplyVO;
import com.saem.service.BReplyService;

@Controller
public class BReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BReplyController.class);
	
	@Inject
	private BReplyService brService;
	
	@RequestMapping(value="/send_breply", method=RequestMethod.POST,produces="application/text;charset=utf8")
	public @ResponseBody String send_breply(Model model, @RequestBody String data) throws Exception{
		
		Gson gson = new Gson();
		BReplyVO rvo = gson.fromJson(data, BReplyVO.class);
		brService.insert_reply(rvo);
		
		int auto_increment = brService.select_max(rvo.getB_num()).getBr_num();
		rvo.setBr_num(auto_increment);
		
		String result = gson.toJson(rvo);
		
		return result;
	}
	
	@RequestMapping(value="/delete_breply", method = RequestMethod.GET)
	public String index(Model model, BReplyVO rvo) throws Exception{
		brService.delete_reply(rvo);
		model.addAttribute("b_num", rvo.getB_num());
		return "redirect:ps_view";
	}
	
}
