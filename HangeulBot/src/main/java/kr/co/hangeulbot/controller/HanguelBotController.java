package kr.co.hangeulbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HanguelBotController {
	@RequestMapping("index.do")
	public ModelAndView goIndex(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("vowelPanixDIVver.do")
	public ModelAndView goVowelPanixDIVver(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vowelPanixDIVver");
		return mav;
	}
	@RequestMapping("goWordGame.do")
	public ModelAndView goWordGame(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("word/wordGameWithPicture");
		return mav;
	}
	@RequestMapping("goRegisterPage.do")
	public ModelAndView goRegisterPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/registerPage");
		return mav;
	}
}
