package kr.co.hangeulbot.model;

import java.util.HashMap;
import java.util.List;

import kr.co.hangeulbot.model.vo.HangeulbotFinalConsonantVO;
import kr.co.hangeulbot.model.vo.HangeulbotInitialSoundVO;
import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotVowelVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordVO;

public interface HangeulbotDAO {

	void registMember(HangeulbotMemberVO mvo);

	HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);

	void insertWordLogInfo(HangeulbotWordLogVO hangeulbotWordLogVO);

	List<HangeulbotWordVO> getWordListForBabyGrade(int memberBabyGrade);
	
	int updatePhonicsInitialLog(
			HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO);

	void insertPhonicsInitialLog(
			HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO);


	int updatePhonicsVowelLog(
			HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO);

	void insertPhonicsVowelLog(
			HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO);

	int updatePhonicsFinalLog(
			HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO);

	void insertPhonicsFinalLog(
			HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO);

	int selectTotalStudyWordCount(String memberEmailId);

	List<HangeulbotWordLogVO> selectListStudyWordLog(String memberEmailId);

	int selectCurrentStudyWordCount(String memberEmailId);

	int selectCurrentWrongWordCount(String memberEmailId);

	int selectTotalCorrectWordCount(String memberEmailId);

	List<String> selectListStudyWordCategoryList(String memberEmailId);

	int selectWordCountByCategory(HashMap<String, String> paraMap);

	int selectCountTotalWordByGrade(HashMap<String, String> paraMap);

	int selectCountTotalCorrectWordByGrade(HashMap<String, String> paraMap);

	List<HangeulbotInitialSoundVO> selectListInitialSound();

	List<HangeulbotVowelVO> selectListVowel();

	List<HangeulbotFinalConsonantVO> selectListFinalConsonant();
	int getMemberBabyTotalStudyTime(String memberEmailId);

	int getDailyAverageStudyWord(String memberEmailId);

	int getDailyAverageStudyTime(String memberEmailId);

	HangeulbotPhonicsInitialLogVO selectInitialSoundLog(
			HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO);

	HangeulbotPhonicsVowelLogVO selectVowelLog(
			HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO);

	HangeulbotPhonicsFinalLogVO selectFinalLog(
			HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO);

	int selectAvgAnswerRateByAge(HashMap<String, String> paraMap);

	HashMap<String, String> selectAnswerRateTendencyByWeek(
			HashMap<String, Object> paraMap);
	void updateTotalStudyTime(String memberEmailId);

	void updateMemberBabyGrade(String memberEmailId);

	List<HangeulbotWordLogVO> selectListStudyWordLogByPaging(HashMap<String, String> paraMap);

	int selectAvgSpendTimeByAge(HangeulbotWordLogVO hangeulbotWordLogVO);

}
 
