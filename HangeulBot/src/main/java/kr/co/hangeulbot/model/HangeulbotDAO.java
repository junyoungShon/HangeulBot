package kr.co.hangeulbot.model;

<<<<<<< HEAD
=======
import java.util.HashMap;
>>>>>>> branch 'master' of https://github.com/junyoungShon/HangeulBot.git
import java.util.List;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordVO;

public interface HangeulbotDAO {

	void registMember(HangeulbotMemberVO mvo);

	HangeulbotMemberVO getMemberInfoByEmail(String memberEmail);

	void insertWordLogInfo(HangeulbotWordLogVO hangeulbotWordLogVO);

<<<<<<< HEAD
	List<HangeulbotWordVO> getAllWordList();
=======
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
>>>>>>> branch 'master' of https://github.com/junyoungShon/HangeulBot.git

}
 
