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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.saem.domain.ReplyVO;
import com.saem.domain.TourVO;
import com.saem.service.ReplyService;

@Controller
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService rService;
	
	@RequestMapping(value = "/tour_reply", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String tour_reply(Model model, @RequestBody String data) throws Exception{
		rService.select_count(data);// 등록, 삭제시 마다 카운트 갱신됨
		return new Gson().toJson(rService.select_list(data)).toString();
	}
	
	@RequestMapping(value = "/send_reply", method = RequestMethod.POST)
	public @ResponseBody String send_reply(Model model, @RequestBody String data){
		
		Gson gson = new Gson();
		ReplyVO reply = gson.fromJson(data, ReplyVO.class);
		try {
			rService.insert_reply(reply);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping(value = "/delete_reply", method = RequestMethod.POST)
	public @ResponseBody String delete_reply(Model model, @RequestBody String data) throws Exception{
		Gson gson = new Gson();
		ReplyVO reply = gson.fromJson(data, ReplyVO.class);
		try {
			rService.delete_reply(reply);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
}
