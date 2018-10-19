package com.saem.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;
import com.saem.domain.MemberVO;
import com.saem.service.MemberService;
import com.saem.util.NaverCallback;
import com.saem.util.NaverProfileJoin;
import com.saem.util.SHA256;

@Controller
@SessionAttributes({"SessionNaver"})
public class ProfileController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);

	@Inject
	private MemberService mService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession id, SessionStatus session) throws Exception{
		MemberVO mvo = new MemberVO();
		
		if(id.getAttribute("SessionUser") != null) {
			mvo.setM_userid(id.getAttribute("SessionUser").toString());
			mService.user_logout(mvo);
			id.invalidate();
		} else {
			session.setComplete();
		}
		
		return "index";
	}
	
	@RequestMapping(value = "/naver_login", method = RequestMethod.GET)
	public String naver_login(Model model, @RequestParam("code") String code, @RequestParam("state") String state) throws Exception{
		System.out.println("---------------------------");
		System.out.println("Naver Login Start");
		
		MemberVO member; 
		final String access_token = new NaverCallback().CallBack(code, state);
		
		if(access_token != null) {
	    	member = new NaverProfileJoin().NaverSign_in(access_token);
			if(mService.select_User(member).getM_count() == 0) {
				System.out.println("join_naver ID : " + member.getM_userid()); //네아로 자동 가입 수정
				mService.naver_join(member);
			}
			model.addAttribute("SessionNaver", member.getM_userid());
		}
		return "redirect:index";
	}
	
	@RequestMapping(value = "/new_pass", method = RequestMethod.GET)
	public String new_pass(Model model) throws Exception{
		model.addAttribute("new_pass", "on");
		return "profile/new_pass";
	}

	@RequestMapping(value = "/update_InfoPass", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public String update_InfoPass(Model model, @RequestParam(value="userNewPass") String newPass, MemberVO mvo) throws Exception {
		System.out.println("---------------------------");
		System.out.println("userPassword Update");
		
		String mSalt = "salt";
		String encryptPw = SHA256.getEncrypt(mvo.getM_password(), mSalt);
		
		mvo.setM_password(encryptPw);
		
		if(mService.user_login(mvo) != null) {
			String newEncryptPw = SHA256.getEncrypt(newPass, mSalt);
			mvo.setM_password(newEncryptPw);
			mService.update_password(mvo);
			model.addAttribute("update","success");
		} else {
			model.addAttribute("update","error");
		}
		return "profile/new_pass";
	}
	
	@RequestMapping(value = "/user_info", method = RequestMethod.GET)
	public String user_info(Model model, MemberVO mvo) throws Exception{
		mvo.setM_confirm("Default_user");
		
		model.addAttribute("info", mService.select_UserInfo(mvo));
		model.addAttribute("user_info", "on");
		
		return "profile/user_info";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.POST)
	public String info_update(Model model, MemberVO mvo) throws Exception{
		String m_userid = mvo.getM_userid();
		
		System.out.println("---------------------------");
		System.out.println("userInfo update : " + m_userid);
		
		mService.update_info(mvo);
		return "redirect:user_info?m_userid=" + m_userid;
	}
	
	@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
	public String withdrawal(Model model) throws Exception{
		model.addAttribute("withdrawal", "on");
		return "profile/withdrawal";
	}
	
	
	
	@RequestMapping(value = "/update_withdrawal", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public @ResponseBody String update_withdrawal(Model model, @RequestBody String data) throws Exception{
		System.out.println("---------------------------");
		System.out.println("user withdrawal : " + data);
		MemberVO mvo = new MemberVO();
		if(data != null)mvo = new Gson().fromJson(data,MemberVO.class);
		
		if(mvo.getM_userid()!=null && mvo.getM_password()!=null) {
			String mSalt = "salt";
			String encryptPw = SHA256.getEncrypt(mvo.getM_password(), mSalt);
			mvo.setM_password(encryptPw);
			if(mService.user_login(mvo) != null) {
				mService.update_withdrawal(mvo);
				return "success";
			} else {
				return "Not_Found";
			}
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/update_newPass", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public @ResponseBody String update_newPass(Model model, @RequestBody String data) throws Exception{
		System.out.println("/update_newPass : " + data);
		MemberVO mvo = new Gson().fromJson(data, MemberVO.class);
		String mSalt = "salt";
		String encryptPw = SHA256.getEncrypt(mvo.getM_password(), mSalt);
		mvo.setM_password(encryptPw);
		if(mService.select_User(mvo) != null) {
			mService.update_password(mvo);
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public @ResponseBody String find_id(@RequestBody String data) throws Exception{
		Gson gson = new Gson();
		System.out.println("userID Find __ Data : " + data);
		MemberVO vo = new MemberVO();
		if(data != null)vo = gson.fromJson(data,MemberVO.class);
		vo = mService.select_UserId(vo); // 데이터를 새로 넣으면 원래값은 안남고 덮어진다.
		if(vo == null) {
			return "Not_Found";
		} else {
			return vo.getM_userid();
		}
	}
	
	// vo = mService.find_UserPass(vo); 데이터를 새로 넣으면 원래값은 안남고 덮어진다.
	@RequestMapping(value = "/find_pass", method = RequestMethod.POST, produces="application/text; charset=utf8")
	public @ResponseBody String find_pass(@RequestBody String data) throws Exception{
		System.out.println("find_UserInfo in /find_pass -- data : " + data);
		Gson gson = new Gson();
		MemberVO vo = gson.fromJson(data, MemberVO.class);
		vo =  mService.find_UserPass(vo);
		if(vo != null) {
			return vo.getM_userid();
		} else {
			return "Not_Found";
		}
	}
	
	@RequestMapping(value = "/user_login", method = RequestMethod.POST)
	public @ResponseBody String user_login(HttpSession session,@RequestBody String data) throws Exception{
		System.out.println("login_page_start");
		System.out.println("data :" + data);
		
		String result ="fail";
		
		Gson gson = new Gson();
		MemberVO vo = new MemberVO();
		
		if(data != null)vo = gson.fromJson(data,MemberVO.class);
		vo.setM_confirm("Default_user");
		if(vo.getM_userid()!=null && vo.getM_password()!=null) {
			String mSalt = "salt";
			String encryptPw = SHA256.getEncrypt(vo.getM_password(), mSalt);
			vo.setM_password(encryptPw);
			vo = mService.user_login(vo);
			if(vo != null) {
				System.out.println("used : " + vo.getM_used());
				if(vo.getM_used() == 1) {
					System.out.println("login 성공!" + vo.getM_userid());
					session.setAttribute("SessionUser", vo.getM_userid());
					result = "success";	
				} else if(vo.getM_used() == 0) {
					System.out.println("회원탈퇴 아이디 : " + vo.getM_userid());
					result = "withdrawal";
				}
			} else {
				System.out.println("데이터없음");
			}
		}
		return result;
	}
	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public String joinpage(Model model) throws Exception{	
		return "profile/joinPage";
	}
	
	@RequestMapping(value = "/member/user_join", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String user_join(@RequestBody String data) throws Exception {
		Gson gson = new Gson();

		MemberVO mvo = new MemberVO();
		if(data != null)mvo = gson.fromJson(data,MemberVO.class);
		
		String mSalt = "salt";
		String encryptPw = SHA256.getEncrypt(mvo.getM_password(), mSalt);
		
		mvo.setM_password(encryptPw);
		mvo.setM_salt(mSalt);
		
		mService.default_join(mvo);
		
		return "success";
	}
	
}
