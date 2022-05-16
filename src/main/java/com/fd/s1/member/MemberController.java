package com.fd.s1.member;


import java.time.LocalDate;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberCheck memberCheck;
	
	@GetMapping("join")
	public ModelAndView join(@ModelAttribute MemberVO memberVO)throws  Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/join");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView join(@Valid MemberVO memberVO,BindingResult bindingResult)throws  Exception{
		ModelAndView mv = new ModelAndView();
		String path = "/";
		String message = "회원가입이 완료되었습니다.";
		if(memberCheck.memberError(memberVO, bindingResult)) {
			mv.setViewName("member/join");
			return mv;
		}
		LocalDate birth = memberCheck.makeBirth(memberVO.getYear(), memberVO.getMonth(), memberVO.getDay());
		memberVO.setBirth(birth);
		int result = memberService.join(memberVO);
		if(result<1) {
			path="member/join";
			message="회원가입 실패";
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@PostMapping("login")
	public ModelAndView login(HttpSession session, MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		memberVO = memberService.login(memberVO);
		String message = "로그인 실패";
		String path = "./login";
		if(memberVO!=null) {
			message="로그인 성공";
			path = "/";
			session.setAttribute("member",memberVO);
		}
		mv.addObject("path",path);
		mv.addObject("message",message);
		mv.setViewName("common/joinResult");
		return mv;
	}
	
	@GetMapping("login")
	public ModelAndView login()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
	}
	
}
