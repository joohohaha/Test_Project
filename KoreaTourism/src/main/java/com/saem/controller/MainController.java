package com.saem.controller;

import java.util.List;

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
import com.saem.domain.TourVO;
import com.saem.service.TourService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	private TourService tService;
	
	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String index(Model model) throws Exception{
		return "index";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Model model) throws Exception{
		model.addAttribute("selectAll", tService.selectAll());
		return "main";
	}
	
	@RequestMapping(value="/seg_Data", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String seg_Data(@RequestBody String data) throws Exception{
		List<TourVO> seg_data = null;
		System.out.println("---------------------------");
		System.out.println("search SegData : " + data);
		if(data.equals("hotlocal")){
			seg_data = tService.selectMain();
		}else if(data.equals("gyeongsang")) {
			seg_data = tService.selectSeg("%경상%");
		}else if(data.equals("gyeonggi")) {
			seg_data = tService.selectSeg("%경기%");
		}else if(data.equals("seoul")) {
			seg_data = tService.selectSeg("%서울%");
		}else if(data.equals("gangwon")) {
			seg_data = tService.selectSeg("%강원%");
		}else if(data.equals("chungcheong")) {
			seg_data = tService.selectSeg("%충청%");
		}else if(data.equals("jeonla")) {
			seg_data = tService.selectSeg("%전라%");
		}else if(data.equals("jeju")) {
			seg_data = tService.selectSeg("%제주%");
		}
		// Gson instance를 만들어서 쓰면 new를 안해도 될거같은데..
		return new Gson().toJson(seg_data).toString();
	}
	
	@RequestMapping(value="/tour_data", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String tour_data(Model model, @RequestBody String data) throws Exception{
		return new Gson().toJson(tService.selectOneSeg(data)).toString();
	}
	
	
}
