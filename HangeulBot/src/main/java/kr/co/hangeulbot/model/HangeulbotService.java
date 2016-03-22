package kr.co.hangeulbot.model;

import java.util.List;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

public interface HangeulbotService {
	
	public void registMember(HangeulbotMemberVO mvo);
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);
	public void submitAnswerInWordgame(HangeulbotWordLogVO hangeulbotWordLogVO);
	public List<String> getFirstTestQuestionList();
}
