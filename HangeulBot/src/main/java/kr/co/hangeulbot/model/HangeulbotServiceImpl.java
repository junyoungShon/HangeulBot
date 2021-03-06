package kr.co.hangeulbot.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import kr.co.hangeulbot.model.vo.HangeulbotFinalConsonantVO;
import kr.co.hangeulbot.model.vo.HangeulbotInitialSoundVO;
import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotPagingBean;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotVowelVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordVO;
import kr.co.hangeulbot.utility.HangeulSeperator;

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
		memberEmailId = "imvestt@hanmail.net";
		HashMap<String,Object> result = new HashMap<String, Object>();
		//총 학습 단어 수 
		/*int totalStudyWordCount = hangeulbotDAO.selectTotalStudyWordCount(memberEmailId);*/
		int totalStudyWordCount = 512;
		result.put("totalStudyWordCount", totalStudyWordCount);
		//총 정답 단어수 
		/*int totalCorrectWordCount = hangeulbotDAO.selectTotalCorrectWordCount(memberEmailId);*/
		int totalCorrectWordCount = 457;
		result.put("totalCorrectWordCount", totalCorrectWordCount);
		
		//학습로그 출력 (5개씩)
		
    /*    <th>단어</th>
        <th>일시</th>
        <th>정답여부</th>
        <th>정답도출시간</th>
        <th>또래 아이 평균 정답도출시간</th>
    </tr>
</thead>
<tbody class="usersWordLog">
		<c:forEach items="${result.wordStudyLogList}" var="wordStudyLogList">
      	<tr>
            <td>${wordStudyLogList.word}</td>
            <td>${wordStudyLogList.studyDate}</td>
            
            <c:if test="${wordStudyLogList.isCorrect==1}">
                <td>O</td>
            </c:if>
            <c:if test="${wordStudyLogList.isCorrect==0}">
                <td>X</td>
            </c:if>
            <td>${wordStudyLogList.spendTime}초</td>
            <td>${wordStudyLogList.otherChildAvgSpendTime}</td>*/
		//ArrayList<HashMap<String,String>> wordStudyLogList = ArrayList<HashMap<String,String>>();
		//result.put("wordStudyLogList",wordStudyLogList);
		
		
		//학습로그 페이징빈 적용
		/*HangeulbotPagingBean hangeulbotPagingBean = new HangeulbotPagingBean(totalStudyWordCount, 1);
		result.put("wordStudyLogPagingBean", hangeulbotPagingBean);*/
		//최근일주일간 오답 단어 수와 최근 학습단어를 가져와 정답율과 오답 단어수를 전달해준다.
	/*	int currentStudyWordCount = hangeulbotDAO.selectCurrentStudyWordCount(memberEmailId);
		int currentWrongWordCount = hangeulbotDAO.selectCurrentWrongWordCount(memberEmailId);*/
		int currentStudyWordCount = 252;
		int currentWrongWordCount = 82;
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
		//List<String> studyWordCategoryList = hangeulbotDAO.selectListStudyWordCategoryList(memberEmailId);
		
		//학습한 중분류 카테고리 별로 횟수를 기록한다. 구분자 (카테고리/횟수)
		/*for(int i=0;i<studyWordCategoryList.size();i++){
			String studyWordCategory = studyWordCategoryList.get(i);
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("memberEmailId", memberEmailId);
			paraMap.put("studyWordCategory", studyWordCategory);
			studyWordCategoryList.set(i, studyWordCategory+"/"+hangeulbotDAO.selectWordCountByCategory(paraMap));
		}
		result.put("studyWordCategoryList", studyWordCategoryList);
		*/
		//단어 난이도 별 정답률 (현재 아이)
		
/*		HashMap<String,String> answerRateMap = new HashMap<String, String>();
		for(int i=1;i<6;i++){
			HashMap<String,String> paraMap = new HashMap<String, String>();
			paraMap.put("grade", i+"");
			paraMap.put("memberEmailId",memberEmailId);
			//인덱스를 난이도로하여 각각의 정답율을 삽입한다.
			int totalWordByGrade = hangeulbotDAO.selectCountTotalWordByGrade(paraMap);
			int totalCorrectWordByGrade = hangeulbotDAO.selectCountTotalCorrectWordByGrade(paraMap);
			System.out.println(paraMap);
			int avgAnswerRateByAge = hangeulbotDAO.selectAvgAnswerRateByAge(paraMap);
			System.out.println(avgAnswerRateByAge);
			if(totalWordByGrade!=0)
				answerRateMap.put(""+i, ((int) ((double)totalCorrectWordByGrade /(double)totalWordByGrade *100.0))+"/"+avgAnswerRateByAge);
			else
				answerRateMap.put(""+i, 0+"");
		}
		result.put("answerRateMap", answerRateMap);
*/		//파닉스 숙련도
		//조건
		/*1. 50회 이하일 때는 순수하게 %를 적용한다.
		2. 50회 이상일 때는 최근 50회를 기준으로 %를 적용한다.
		3. 100회 이상일 때는 90%이상일 경우 100%로 간주한다.*/
		//1. 초성 , 종성, 종성 각각 리스트를 불러온다.
		/*List<HangeulbotInitialSoundVO> hangeulbotInitialSoundVO = hangeulbotDAO.selectListInitialSound();
		List<HangeulbotVowelVO> hangeulbotVowelVO  = hangeulbotDAO.selectListVowel();
		List<HangeulbotFinalConsonantVO> hangeulbotFinalConsonantVO = hangeulbotDAO.selectListFinalConsonant();
	*/
		
	/*	for(int i=0;i<hangeulbotInitialSoundVO.size();i++){
			HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO = new HangeulbotPhonicsInitialLogVO();
			hangeulbotPhonicsInitialLogVO.setMemberEmailId(memberEmailId);
			hangeulbotPhonicsInitialLogVO.setInitialSoundId(hangeulbotInitialSoundVO.get(i).getInitialSoundId());
			System.out.println(hangeulbotInitialSoundVO.get(i));
			
			hangeulbotPhonicsInitialLogVO = hangeulbotDAO.selectInitialSoundLog(hangeulbotPhonicsInitialLogVO);
			String color = "white";
			if(hangeulbotPhonicsInitialLogVO!=null){
				if(hangeulbotPhonicsInitialLogVO.getTotalStudy()>10){
					int answerRate = 100 -(int) ((double)hangeulbotPhonicsInitialLogVO.getTotalCorrectAnswer() /(double)hangeulbotPhonicsInitialLogVO.getTotalStudy() *100.0);
					if(answerRate>80){
						color = "Green";
					}else if(answerRate>50 && 81>answerRate){
						color = "yellow";
					}else{
						color= "red";
					}
				}
			}
			//아이디에 색을 저장
			hangeulbotInitialSoundVO.get(i).setInitialSoundId(color);
		}
		for(int i=0;i<hangeulbotVowelVO.size();i++){
			HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO = new HangeulbotPhonicsVowelLogVO();
			hangeulbotPhonicsVowelLogVO.setMemberEmailId(memberEmailId);
			hangeulbotPhonicsVowelLogVO.setVowelId(hangeulbotVowelVO.get(i).getVowelId());
			
			hangeulbotPhonicsVowelLogVO = hangeulbotDAO.selectVowelLog(hangeulbotPhonicsVowelLogVO);
			String color = "white";
			if(hangeulbotPhonicsVowelLogVO!=null){
				if(hangeulbotPhonicsVowelLogVO.getTotalStudy()>10){
					int answerRate = 100 -(int) ((double)hangeulbotPhonicsVowelLogVO.getTotalCorrectAnswer() /(double)hangeulbotPhonicsVowelLogVO.getTotalStudy() *100.0);
					if(answerRate>80){
						color = "Green";
					}else if(answerRate>50 && 81>answerRate){
						color = "yellow";
					}else{
						color= "red";
					}
				}
			}
			hangeulbotVowelVO.get(i).setVowelId(color);
		}
		for(int i=0;i<hangeulbotFinalConsonantVO.size();i++){
			HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO = new HangeulbotPhonicsFinalLogVO();
			hangeulbotPhonicsFinalLogVO.setMemberEmailId(memberEmailId);
			hangeulbotPhonicsFinalLogVO.setFinalConsonantId(hangeulbotFinalConsonantVO.get(i).getFinalConsonantId());
			
			hangeulbotPhonicsFinalLogVO = hangeulbotDAO.selectFinalLog(hangeulbotPhonicsFinalLogVO);
			String color = "white";
			if(hangeulbotPhonicsFinalLogVO!=null){
				if(hangeulbotPhonicsFinalLogVO.getTotalStudy()>10){
					int answerRate = 100 -(int) ((double)hangeulbotPhonicsFinalLogVO.getTotalCorrectAnswer() /(double)hangeulbotPhonicsFinalLogVO.getTotalStudy() *100.0);
					if(answerRate>80){
						color = "Green";
					}else if(answerRate>50 && 81>answerRate){
						color = "yellow";
					}else{
						color= "red";
					}
				}
			}
			hangeulbotFinalConsonantVO.get(i).setFinalConsonantId(color);
		}
	
		result.put("initialSoundResult", hangeulbotInitialSoundVO);
		result.put("vowelResult", hangeulbotVowelVO);
		result.put("finalConsonantResult", hangeulbotFinalConsonantVO);
		System.out.println(hangeulbotInitialSoundVO);
		System.out.println(hangeulbotVowelVO);
		System.out.println(hangeulbotFinalConsonantVO);
		*/
		//2. 반복문을 통해 해당 아이디의 학습기록을 불러온다.
		//한글봇 누적 학습시간 (분 단위) - 추후 회원컬럼에서 조회
		//하루평균 학습 시간 - 추후 회원컬럼 및 총 학습단어수를 통해 구함
		//학루평균 학습 단어 수 - 추후 회원컬럼 및 총 학습시간에서 구함
		//한글봇 누적 학습시간 (분 단위)
		//int memberBabyTotalStudyTime = hangeulbotDAO.getMemberBabyTotalStudyTime(memberEmailId);
		int memberBabyTotalStudyTime = 546842121;
		
		String memberBabyTotalStudyTimeToString = null;
		int totalTime = Math.round(memberBabyTotalStudyTime / 3600);
		int totalMinute = Math.round((memberBabyTotalStudyTime - totalTime*3600) / 60);
		memberBabyTotalStudyTimeToString = totalTime + " 시간 " + totalMinute + " 분";
		result.put("memberBabyTotalStudyTime", memberBabyTotalStudyTimeToString);
		
		
		//학루평균 학습 단어 수
		int dailyAverageStudyWord =121;
		result.put("dailyAverageStudyWord", dailyAverageStudyWord + " 개");
		
		//하루평균 학습 시간
		int dailyAverageStudyTime = 7200;
		String dailyAverageStudyTimeToString = null;
		int avgTime = Math.round(dailyAverageStudyTime / 3600);
		int avgMinute = Math.round((dailyAverageStudyTime - avgTime*3600) / 60);
		dailyAverageStudyTimeToString = avgTime + " 시간 " + avgMinute + " 분";
		result.put("dailyAverageStudyTime", dailyAverageStudyTimeToString);
		
		/*//정답율 추이
		List<HashMap<String, String>> answerRateTendency = new ArrayList<HashMap<String, String>>();
		//최근 5주간의 정답율을 가져온다.
		for(int i=4;i>=0;i--){
			HashMap<String,Object> paraMap = new HashMap<String,Object>();
			paraMap.put("memberEmailId", memberEmailId);
			paraMap.put("week", i);
			System.out.println("파라미터"+paraMap);
			HashMap<String,String> map = hangeulbotDAO.selectAnswerRateTendencyByWeek(paraMap);
			System.out.println(map);
			answerRateTendency.add(map);
		}
		result.put("answerRateTendency", answerRateTendency);
		System.out.println("최근 5주간 정답율"+answerRateTendency);*/
		return result;
	}

	@Override
	public ArrayList<HashMap<String, String>> getQuestionList(double memberBabyGrade,int firstTestQuestionNumber) {
		//List<HangeulbotWordVO> allWordListForBabyGrade = hangeulbotDAO.getWordListForBabyGrade((int) memberBabyGrade);
		ArrayList<HangeulbotWordVO> allWordListForBabyGrade = new ArrayList<HangeulbotWordVO>();
		String[] wordList = {"가구","가수","나비","늑대","말","미국","벌","사과","하마","허들"};
		for(int i=0;i<wordList.length;i++){
			
			allWordListForBabyGrade.add(new HangeulbotWordVO());
			allWordListForBabyGrade.get(i).setWord(wordList[i]);
			allWordListForBabyGrade.get(i).setMidCategoryId("동물");
			allWordListForBabyGrade.get(i).setWordId("a"+i);
		}
		Random random = new Random();
		ArrayList<HashMap<String, String>> questionList = new ArrayList<HashMap<String, String>>();
		
		//문제 갯수 설정
		 
		
		int randomlyPickedWordIndex = 0;
		String randomlyPickedWord = null;
		String randomlyPickedWordId = null;
		String randomlyPickedWordGrade = null;
		while(questionList.size()<firstTestQuestionNumber) {
			
			//0~size()-1 까지의 숫자중 하나 임의 선택
			randomlyPickedWordIndex = random.nextInt(allWordListForBabyGrade.size());
			randomlyPickedWord = allWordListForBabyGrade.get(randomlyPickedWordIndex).getWord();
			randomlyPickedWordId = allWordListForBabyGrade.get(randomlyPickedWordIndex).getWordId();
			randomlyPickedWordGrade = allWordListForBabyGrade.get(randomlyPickedWordIndex).getWordGrade();
			
			HashMap<String, String> wordMap = new HashMap<String, String>();
			wordMap.put("word", randomlyPickedWord);
			wordMap.put("wordId", randomlyPickedWordId);
			wordMap.put("wordGrade", randomlyPickedWordGrade);
			
			boolean flag = true;
			for(int i=0;i<questionList.size();i++) {
				if(randomlyPickedWordId.equals(questionList.get(i).get("wordId"))) {
					flag = false;
					break;
				}
			}
			if(flag) {
				questionList.add(wordMap);
			}
		}
		return questionList;
	}

	
	@Override
	public void updateTotalStudyTimeAndMemberBabyGrade(String memberEmailId) {
		hangeulbotDAO.updateTotalStudyTime(memberEmailId);
		hangeulbotDAO.updateMemberBabyGrade(memberEmailId);
	}

	@Override
	public List<HangeulbotWordLogVO> selectListStudyWordLogByPaging(HashMap<String, String> paraMap) {
		return hangeulbotDAO.selectListStudyWordLogByPaging(paraMap);
	}

}


