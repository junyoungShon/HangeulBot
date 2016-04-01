package kr.co.hangeulbot.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

public interface HangeulbotService {
	
	public void registMember(HangeulbotMemberVO mvo);
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);
	public void submitAnswerInWordgame(HangeulbotWordLogVO hangeulbotWordLogVO);
	public ArrayList<HashMap<String, String>> getQuestionList(double memberBabyGrade);
	public HashMap<String, Object> goParentsPage(String memberEmailId);
	public void updateTotalStudyTimeAndMemberBabyGrade(String memberEmailId);
}
