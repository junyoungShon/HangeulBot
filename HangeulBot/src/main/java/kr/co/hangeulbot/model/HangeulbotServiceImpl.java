package kr.co.hangeulbot.model;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

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
	/**
	 * 단어게임에서 아이가 제출한 답안을 채점하고 각종 통계를 위해 답안을 분석하고 기록한다.
	 */
	@Override
	public void submitAnswerInWordgame(HangeulbotWordLogVO hangeulbotWordLogVO) {
		//아이가 입력한 정보를 로그에 기록한다.
		hangeulbotDAO.insertWordLogInfo(hangeulbotWordLogVO);
		String memberEmailId = hangeulbotWordLogVO.getMemberEmailId();
	}


}
