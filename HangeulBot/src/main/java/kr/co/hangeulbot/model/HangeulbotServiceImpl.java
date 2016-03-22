package kr.co.hangeulbot.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotPagingBean;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;
import kr.co.hangeulbot.utility.HangeulSeperator;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class HangeulbotServiceImpl implements HangeulbotService{
	
	@Resource
	private HangeulbotDAO hangeulbotDAO;
	
	@Resource
	private HangeulSeperator hangeulSeperator;
	
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
		
		//아이가 입력한 정보를 파닉스 통계를 위해 초,중,종으로 나눠 로그로 기록한다.(우선 사용자가 작성한 정답을 분리기에 전송한다.)
		String answer = hangeulbotWordLogVO.getWord();
		String memberEmailId = hangeulbotWordLogVO.getMemberEmailId();
		for(int i=0;i<answer.length();i++){
			Integer[] seperatingResult = hangeulSeperator.hangeulSeperating(answer.charAt(i));
			HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO = new HangeulbotPhonicsInitialLogVO();
			HangeulbotPhonicsVowelLogVO hanPhonicsVowelLogVO = new HangeulbotPhonicsVowelLogVO();
			HangeulbotPhonicsFinalLogVO hanPhonicsFinalLogVO = new HangeulbotPhonicsFinalLogVO();
			hangeulbotPhonicsInitialLogVO.setInitialSoundId(seperatingResult[0]);
			hanPhonicsVowelLogVO.setVowelId(seperatingResult[1]);
			hanPhonicsFinalLogVO.setFinalConsonantId(seperatingResult[2]);
			hangeulbotPhonicsInitialLogVO.setMemberEmailId(memberEmailId);
			hanPhonicsVowelLogVO.setMemberEmailId(memberEmailId);
			hanPhonicsFinalLogVO.setMemberEmailId(memberEmailId);
			if(hangeulbotWordLogVO.getIsCorrect()==1){
				hangeulbotPhonicsInitialLogVO.setTotalCorrectAnswer(1);
				hangeulbotPhonicsInitialLogVO.setTotalWrongAnswer(0);
				hanPhonicsVowelLogVO.setTotalCorrectAnswer(1);
				hanPhonicsVowelLogVO.setTotalWrongAnswer(0);
				hanPhonicsFinalLogVO.setTotalCorrectAnswer(1);
				hanPhonicsFinalLogVO.setTotalWrongAnswer(0);
			}else{
				hangeulbotPhonicsInitialLogVO.setTotalCorrectAnswer(0);
				hangeulbotPhonicsInitialLogVO.setTotalWrongAnswer(1);
				hanPhonicsVowelLogVO.setTotalCorrectAnswer(0);
				hanPhonicsVowelLogVO.setTotalWrongAnswer(1);
				hanPhonicsFinalLogVO.setTotalCorrectAnswer(0);
				hanPhonicsFinalLogVO.setTotalWrongAnswer(1);
			}
			if(hangeulbotDAO.updatePhonicsInitialLog(hangeulbotPhonicsInitialLogVO)!=1){
				hangeulbotDAO.insertPhonicsInitialLog(hangeulbotPhonicsInitialLogVO);
			}
			if(hangeulbotDAO.updatePhonicsVowelLog(hanPhonicsVowelLogVO)!=1){
				System.out.println(hanPhonicsVowelLogVO);
				hangeulbotDAO.insertPhonicsVowelLog(hanPhonicsVowelLogVO);
			}
			//종성이 없는상황을 대비
			if(seperatingResult[2]!=-1){
				if(hangeulbotDAO.updatePhonicsFinalLog(hanPhonicsFinalLogVO)!=1){
					hangeulbotDAO.insertPhonicsFinalLog(hanPhonicsFinalLogVO);
				}
			}
		}
		
	}
	/**
	 * 학부모 통계 페이지에서 필요로하는 각종 정보를 담아 map의 형태로 뿌려줌
	 */
	@Override
	public HashMap<String, Object> goParentsPage(String memberEmailId) {
		HashMap<String,Object> result = new HashMap<String, Object>();
		//총 학습 단어 수 
		int totalStudyWordCount = hangeulbotDAO.selectTotalStudyWordCount(memberEmailId);
		result.put("totalStudyWordCount", totalStudyWordCount);
		//총 정답 단어수 
		int totalCorrectWordCount = hangeulbotDAO.selectTotalCorrectWordCount(memberEmailId);
		result.put("totalCorrectWordCount", totalCorrectWordCount);
		
		//학습로그 출력 (5개씩)
		List<HangeulbotWordLogVO> wordStudyLogList = hangeulbotDAO.selectListStudyWordLog(memberEmailId);
		result.put("wordStudyLogList",wordStudyLogList);
		//학습로그 페이징빈 적용
		HangeulbotPagingBean hangeulbotPagingBean = new HangeulbotPagingBean(totalStudyWordCount, 1);
		result.put("wordStudyLogPagingBean", hangeulbotPagingBean);
		//최근일주일간 오단 단어 수와 최근 학습단어를 가져와 정답율과 오답 단어수를 전달해준다.
		int currentStudyWordCount = hangeulbotDAO.selectCurrentStudyWordCount(memberEmailId);
		int currentWrongWordCount = hangeulbotDAO.selectCurrentWrongWordCount(memberEmailId);
		//최근 일주일간 오답 갯수
		result.put("currentWrongWordCount", currentWrongWordCount);
		//최근 일주일간 정답율
		if(currentStudyWordCount!=0){
			result.put("currentAnswerRate", 100 -(int) ((double)currentWrongWordCount /(double)currentStudyWordCount *100.0));
		}else{
			result.put("currentAnswerRate", 0);
		}
		//학습단어 카테고리 구분 
		//중복을 제거하여 학습한 카테고리리스트를 출력한다.
		List<String> studyWordCategoryList = hangeulbotDAO.selectListStudyWordCategoryList(memberEmailId);
		
		//학습한 중분류 카테고리 별로 횟수를 기록한다. 구분자 (카테고리/횟수)
		for(int i=0;i<studyWordCategoryList.size();i++){
			String studyWordCategory = studyWordCategoryList.get(i);
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("memberEmailId", memberEmailId);
			paraMap.put("studyWordCategory", studyWordCategory);
			studyWordCategoryList.set(i, studyWordCategory+"/"+hangeulbotDAO.selectWordCountByCategory(paraMap));
		}
		result.put("studyWordCategoryList", studyWordCategoryList);
		
		//단어 난이도 별 정답률 (현재 아이)
		HashMap<String,Integer> answerRateMap = new HashMap<String, Integer>();
		for(int i=0;i<5;i++){
			HashMap<String,String> paraMap = new HashMap<String, String>();
			paraMap.put("grade", i+"");
			paraMap.put("memberEmailId",memberEmailId);
			//인덱스를 난이도로하여 각각의 정답율을 삽입한다.
			int totalWordByGrade = hangeulbotDAO.selectCountTotalWordByGrade(paraMap);
			int totalCorrectWordByGrade = hangeulbotDAO.selectCountTotalCorrectWordByGrade(paraMap);
			if(totalWordByGrade!=0)
				answerRateMap.put(""+(i+1), (int) ((double)totalCorrectWordByGrade /(double)totalWordByGrade *100.0));
			else
				answerRateMap.put(""+(i+1), 0);
		}
		result.put("answerRateMap", answerRateMap);
		
		//한글봇 누적 학습시간 (분 단위) - 추후 회원컬럼에서 조회
		//하루평균 학습 시간 - 추후 회원컬럼 및 총 학습단어수를 통해 구함
		//학루평균 학습 단어 수 - 추후 회원컬럼 및 총 학습시간에서 구함
		
		return result;
	}


}
