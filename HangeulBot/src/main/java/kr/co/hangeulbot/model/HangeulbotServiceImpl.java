package kr.co.hangeulbot.model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;

import org.springframework.stereotype.Service;

@Service
public class HangeulbotServiceImpl implements HangeulbotService{
	
	@Resource
	private HangeulbotDAO hangeulbotDAO;
	
	@Override
	public void registMember(HangeulbotMemberVO mvo) {
		hangeulbotDAO.registMember(mvo);
	}

	@Override
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmail) {
		return hangeulbotDAO.getMemberInfoByEmail(memberEmail);
	}


}


/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//세션이 존재하면 세션을 무효화시키도록 처리해보자(로그아웃)
	
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();

	String servletName = getServletName();
	
	out.println("<h2>"+servletName+"</h2>");
	
	HttpSession session = request.getSession(false);
	//세션 존재 유무 판단 - 세션 없으면 null 반환
	
	if(session==null) {
		out.println("세션 없음~");
	} else {
		out.println("세션 존재~ invalidate() 메서드로 세션 무효처리(없애기)");
		session.invalidate(); //세션을 없앤다. - session이 없는데 하려고 하면 nullPointerException
		out.println(request.getSession(false));
	}*/