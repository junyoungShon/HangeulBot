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
	@RequestMapping("memberRegist.do")
	public String memberRegist(HangeulbotMemberVO mvo){
		hangeulbotService.registMember(mvo);
		return "index";
	}
	@RequestMapping("goLoginPage.do")
	public String goLoginPage(){
		return "member/loginPage";
	}
	@RequestMapping("memberLogin.do")
	public String memberLogin(HangeulbotMemberVO mvo, HttpServletRequest request){
		HangeulbotMemberVO loginUserInfo = hangeulbotService.getMemberInfoByEmail(mvo.getMemberEmail());
		System.out.println("loginUserInfo: "+loginUserInfo);
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
	
	@RequestMapping("goParentsPage.do")
	public ModelAndView goParentsPage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = hangeulbotService.goParentsPage("sk159753@nate.com");
		mav.addObject("result", map);
		mav.setViewName("parentPage");
		return mav;
	}
	
	@RequestMapping("submitAnswerInWordgame.do")
	@ResponseBody
	public void submitAnswerInWordgame(HangeulbotWordLogVO hangeulbotWordLogVO){
		/*hangeulbotWordLogVO.setMemberEmailId("sk159753@nate.com");
		hangeulbotWordLogVO.setIsCorrect(0);
		hangeulbotWordLogVO.setSpendTime(120);
		hangeulbotWordLogVO.setWord("테니스");
		hangeulbotWordLogVO.setWordId("a01009");*/
		hangeulbotService.submitAnswerInWordgame(hangeulbotWordLogVO);
	}
}
