package com.saem.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.saem.domain.MemberVO;
import com.saem.service.MemberService;
import com.saem.util.GmailCheckAction;
@Controller
public class JoinValidateController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinValidateController.class);

	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "/member/check", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String check_userId(@RequestBody String data) throws Exception{
		System.out.println(data);
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(data);
		MemberVO mvo = new MemberVO();
		
		mvo.setM_confirm("Default_user");
		
		if(json.get("type").equals("userId")) {
			if(json.get("data").equals("SAEM")) {
				return "error";
			}
			mvo.setM_userid(json.get("data").toString());
		} else if(json.get("type").equals("userEmail")) {
			mvo.setM_email(json.get("data").toString());
		} else if(json.get("type").equals("birth")) {
			return "success";
		}
		
		int confirm = mService.select_User(mvo).getM_count();
		
		if(confirm == 0) {
			return "success";
		}
		return "error";
	}
	
	@RequestMapping(value = "/member/sendEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String sendEmail(@RequestBody String data, HttpSession session) throws Exception{
		GmailCheckAction gmail = new GmailCheckAction();
		String access = gmail.emailSendAction(data);
		if(access != null) {
			session.setAttribute("access_key", access);
			return "success";
		}
		return "error";
	}
	
	@RequestMapping(value = "/member/getkey", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String getkey() throws Exception{
		return "success";
	}
	
	@RequestMapping(value = "/member/checkEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String checkEmail(@RequestBody String data, HttpSession session) throws Exception{
		String access = session.getAttribute("access_key").toString();
		boolean isTrue = access.equals(data) ? true : false;
		if(isTrue)return "success";else return "not_success";
	}
	
}
