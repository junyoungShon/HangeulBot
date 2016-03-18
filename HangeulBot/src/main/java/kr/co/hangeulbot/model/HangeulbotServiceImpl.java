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
