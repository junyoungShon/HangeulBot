package kr.co.hangeulbot.model;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;

public interface HangeulbotService {
	
	public void registMember(HangeulbotMemberVO mvo);
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);
}
