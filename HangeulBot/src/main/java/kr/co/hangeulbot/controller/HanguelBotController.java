package kr.co.hangeulbot.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.hangeulbot.model.HangeulbotService;
import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HanguelBotController {
	
	@Resource
	private HangeulbotService hangeulbotService;
	
	
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
	@RequestMapping("member_goWordGame.do")
	public ModelAndView member_goWordGame(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HangeulbotMemberVO hbmvo = (HangeulbotMemberVO) session.getAttribute("loginUserInfo");
		if(hbmvo!=null) {
			if(hbmvo.getMemberBabyGrade()==0) {
				mav.addObject("questionList", hangeulbotService.getFirstTestQuestionList());
			} else {
				mav.addObject("questionList", hangeulbotService.getFirstTestQuestionList()); //나중에 getQuestionList로 바꿀것
			}
		} else {
			mav.addObject("questionList", hangeulbotService.getFirstTestQuestionList());
		}
		mav.setViewName("word/wordGameTest");
		System.out.println(mav.getModel().get("questionList"));
		return mav;
	}
	@RequestMapping("goRegisterPage.do")
	public ModelAndView goRegisterPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/registerPage");
		return mav;
	}
	@RequestMapping("memberRegist.do")
	public String memberRegist(HangeulbotMemberVO mvo){
		System.out.println("와라");
		System.out.println(mvo);
		hangeulbotService.registMember(mvo);
		return "index";
	}
	@RequestMapping("goLoginPage.do")
	public String goLoginPage(){
		return "member/loginPage";
	}
	@RequestMapping("memberLogin.do")
	public String memberLogin(HangeulbotMemberVO mvo, HttpServletRequest request){
		HangeulbotMemberVO loginUserInfo = hangeulbotService.getMemberInfoByEmail(mvo.getMemberEmailId());
		if(loginUserInfo!=null) {
			if(loginUserInfo.getMemberPassword().equals(mvo.getMemberPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUserInfo", loginUserInfo); 
			} else {
				request.setAttribute("loginResult", "wrongPassword");
				return "member/loginPage";
			}
		} else {
			request.setAttribute("loginResult", "wrongEmail");
			return "member/loginPage";
		}
		return "index";
	}
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		return "index";
	}
	
	@RequestMapping("member_goParentsPage.do")
	public ModelAndView goParentsPage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HangeulbotMemberVO mvo = (HangeulbotMemberVO) request.getSession().getAttribute("loginUserInfo");
		HashMap<String, Object> map = hangeulbotService.goParentsPage(mvo.getMemberEmailId());
		mav.addObject("result", map);
		mav.setViewName("parentPage");
		return mav;
	}
	
	@RequestMapping("submitAnswerInWordgame.do")
	@ResponseBody
	public void submitAnswerInWordgame(HangeulbotWordLogVO hangeulbotWordLogVO){
		hangeulbotService.submitAnswerInWordgame(hangeulbotWordLogVO);
	}
}
