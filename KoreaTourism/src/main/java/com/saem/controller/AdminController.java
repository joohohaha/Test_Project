package com.saem.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.saem.domain.FreeBoardVO;
import com.saem.domain.MemberVO;
import com.saem.domain.PSBoardVO;
import com.saem.domain.TourVO;
import com.saem.service.FreeBoardService;
import com.saem.service.MemberService;
import com.saem.service.PSBoardService;
import com.saem.service.TourService;


@Controller
public class AdminController {
	
	@Inject
	PSBoardService psService;
	
	@Inject
	FreeBoardService fService;
	
	@Inject
	MemberService mService;
	
	@Inject
	TourService tService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	// --------------------------default root setting----------------------------------------
	// login
	@RequestMapping(value = "/admin/loginAction", method = RequestMethod.POST)
	public String loginAction(MemberVO mvo, HttpSession session) throws Exception {
		String id = mvo.getM_userid();
		String pw = mvo.getM_password();
		
		if(id.equals("SAEM") && pw.equals("bitc5600")) {
			System.out.println("admin connect");
			session.setAttribute("admin", id);
		}
		
		return "redirect:../adminPSM";
	}	
	
	// logout
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public String logout(MemberVO mvo, HttpSession session) throws Exception {
		session.invalidate();
		System.out.println("------Admin logout------");
		return "redirect:../adminPSM";
	}	
		
	// loginPage
	@RequestMapping(value = {"/admin", "/admin/adminLogin"}, method = RequestMethod.GET)
	public String adminLogin() throws Exception {
		return "/admin/adminLogin";
	}	
	
	// --------------------------Administrator PSBoard_Management Page------------------------------------
	
	// select
	@RequestMapping(value="adminPSM", method=RequestMethod.GET)
	public String adminPSM(Model model, @RequestParam(value="SpageNum", required=false, defaultValue="0") int SpageNum,
											@RequestParam(value="DpageNum", required=false, defaultValue="0") int DpageNum) throws Exception{
		
		model.addAttribute("SpageNum", SpageNum);
		model.addAttribute("DpageNum", DpageNum);
		model.addAttribute("list", psService.select_list(SpageNum));
		model.addAttribute("delete", psService.select_delete(DpageNum));
		model.addAttribute("notice", psService.select_notice());
		
		boolean next1 = true, next0 = true;
		
		if (psService.select_list(SpageNum + 7).size() == 0)next1 = false;
		if (psService.select_delete(DpageNum + 7).size() == 0)next0 = false;
		
		model.addAttribute("next1", next1);
		model.addAttribute("next0", next0);
		
		return "/admin/adminPSM";
	}

	// insert
	@RequestMapping(value = "/adminPSM/notice_insert", method = RequestMethod.GET)
	public String notice_insert(PSBoardVO pvo) throws Exception {
		System.out.println("contents : " + pvo.getB_content());
		pvo.setB_used(2);
		psService.insert(pvo);
		return "redirect:../adminPSM";
	}
	
	// save
	@RequestMapping(value = "/adminPSM/ps_save", method = RequestMethod.GET)
	public String ps_save(PSBoardVO pvo) throws Exception {
		psService.save(pvo.getB_num());
		return "redirect:../adminPSM";
	}
	
	// delete
	@RequestMapping(value = "/adminPSM/ps_delete", method = RequestMethod.GET)
	public String ps_delete(@RequestParam("b_num") int b_num) throws Exception {
		psService.delete(b_num);
		return "redirect:../adminPSM";
	}
	
	// --------------------------Administrator FreeBoard_Management Page------------------------------------
	// select
		@RequestMapping(value="adminFM", method=RequestMethod.GET)
		public String adminFM(Model model, @RequestParam(value="SpageNum", required=false, defaultValue="0") int SpageNum) throws Exception{
			
			model.addAttribute("SpageNum", SpageNum);
			model.addAttribute("list", fService.select_list(SpageNum));
			
			boolean next1 = true;
			
			if (fService.select_list(SpageNum + 7).size() == 0)next1 = false;
			
			model.addAttribute("next1", next1);
			
			return "/admin/adminFM";
		}
		
		// delete
		@RequestMapping(value = "/adminFM/f_delete", method = RequestMethod.GET)
		public String f_delete(@RequestParam("f_id") int f_id) throws Exception {
			System.out.println("자유게시판 글 삭제 번호 : " + f_id);
			fService.delete(f_id);
			return "redirect:../adminFM";
		}
		
	// --------------------------Administrator Member_Management Page------------------------------------
		// select
		@RequestMapping(value="adminMM", method=RequestMethod.GET)
		public String adminMM(Model model, @RequestParam(value="SpageNum", required=false, defaultValue="0") int SpageNum,
											@RequestParam(value="DpageNum", required=false, defaultValue="0") int DpageNum) throws Exception{
			
			model.addAttribute("SpageNum", SpageNum);
			model.addAttribute("DpageNum", DpageNum);
			model.addAttribute("list", mService.select_list(SpageNum));
			model.addAttribute("delete", mService.select_delete(DpageNum));
			
			boolean next1 = true, next0 = true;
			
			if (mService.select_list(SpageNum + 7).size() == 0)next1 = false;
			if (mService.select_delete(DpageNum + 7).size() == 0)next0 = false;
			
			model.addAttribute("next1", next1);
			model.addAttribute("next0", next0);
			
			return "/admin/adminMM";
		}
		
		// save
		@RequestMapping(value = "/adminMM/mm_save", method = RequestMethod.GET)
		public String mm_save(MemberVO mvo) throws Exception {
			mService.save(mvo);
			return "redirect:../adminMM";
		}
		
		// delete
		@RequestMapping(value = "/adminMM/mm_delete", method = RequestMethod.GET)
		public String mm_delete(MemberVO mvo) throws Exception {
			mService.delete(mvo);
			return "redirect:../adminMM";
		}
	// --------------------------Administrator TourData_Management Page------------------------------------
		// select
		@RequestMapping(value="adminTM", method=RequestMethod.GET)
		public String adminTM(Model model, @RequestParam(value="SpageNum", required=false, defaultValue="0") int SpageNum) throws Exception{
			
			model.addAttribute("SpageNum", SpageNum);
			model.addAttribute("list", tService.select_list(SpageNum));
			
			boolean next1 = true;
			
			if (tService.select_list(SpageNum + 7).size() == 0)next1 = false;
			
			model.addAttribute("next1", next1);
			
			return "/admin/adminTM";
		}
		
		@RequestMapping(value = "adminTM/tour_insert", method = RequestMethod.GET)
		public String tm_inser(TourVO tvo) throws Exception {
			tService.new_tour(tvo);
			return "redirect:../adminTM";
		}
}
