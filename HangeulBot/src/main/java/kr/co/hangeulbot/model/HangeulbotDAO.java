package kr.co.hangeulbot.model;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

public interface HangeulbotDAO {

	void registMember(HangeulbotMemberVO mvo);

	HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);

	void insertWordLogInfo(HangeulbotWordLogVO hangeulbotWordLogVO);

}
 
