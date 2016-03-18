package kr.co.hangeulbot.model;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;

public interface HangeulbotDAO {

	void registMember(HangeulbotMemberVO mvo);

	HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);

}
 
