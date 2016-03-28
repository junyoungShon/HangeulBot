package kr.co.hangeulbot.model;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import kr.co.hangeulbot.model.vo.HangeulbotFinalConsonantVO;
import kr.co.hangeulbot.model.vo.HangeulbotInitialSoundVO;
import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsFinalLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsInitialLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotPhonicsVowelLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotVowelVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordVO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HangeulbotDAOImpl implements HangeulbotDAO{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void registMember(HangeulbotMemberVO mvo) {
		sqlSessionTemplate.insert("member.registMember", mvo);
	}

	@Override
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmailId) {
		return sqlSessionTemplate.selectOne("member.getMemberInfoByEmailId", memberEmailId);
	}

	@Override
	public void insertWordLogInfo(HangeulbotWordLogVO hangeulbotWordLogVO) {
		sqlSessionTemplate.insert("statistics.insertWordLogInfo", hangeulbotWordLogVO);
	}

	@Override
	public List<HangeulbotWordVO> getAllWordList() {
		return sqlSessionTemplate.selectList("member.getAllWordList");
	}
	
	public int updatePhonicsInitialLog(HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO) {
		return sqlSessionTemplate.update("statistics.updatePhonicsInitialLog", hangeulbotPhonicsInitialLogVO);
	}

	@Override
	public void insertPhonicsInitialLog(HangeulbotPhonicsInitialLogVO hangeulbotPhonicsInitialLogVO) {
		sqlSessionTemplate.insert("statistics.insertPhonicsInitialLog", hangeulbotPhonicsInitialLogVO);
	}

	@Override
	public int updatePhonicsVowelLog(HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO) {
		return sqlSessionTemplate.update("statistics.updatePhonicsVowelLog", hangeulbotPhonicsVowelLogVO);
	}

	@Override
	public void insertPhonicsVowelLog(HangeulbotPhonicsVowelLogVO hangeulbotPhonicsVowelLogVO) {
		sqlSessionTemplate.insert("statistics.insertPhonicsVowelLog", hangeulbotPhonicsVowelLogVO);
	}

	@Override
	public int updatePhonicsFinalLog(HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO) {
		return sqlSessionTemplate.update("statistics.updatePhonicsFinalLog", hangeulbotPhonicsFinalLogVO);
	}

	@Override
	public void insertPhonicsFinalLog(HangeulbotPhonicsFinalLogVO hangeulbotPhonicsFinalLogVO) {
		sqlSessionTemplate.insert("statistics.insertPhonicsFinalLog", hangeulbotPhonicsFinalLogVO);
	}

	@Override
	public int selectTotalStudyWordCount(String memberEmailId) {
		return sqlSessionTemplate.selectOne("statistics.selectTotalStudyWordCount", memberEmailId);
	}

	@Override
	public List<HangeulbotWordLogVO> selectListStudyWordLog(String memberEmailId) {
		return sqlSessionTemplate.selectList("statistics.selectListStudyWordLog", memberEmailId);
	}

	@Override
	public int selectCurrentStudyWordCount(String memberEmailId) {
		return sqlSessionTemplate.selectOne("statistics.selectCurrentStudyWordCount", memberEmailId);
	}

	@Override
	public int selectCurrentWrongWordCount(String memberEmailId) {
		return sqlSessionTemplate.selectOne("statistics.selectCurrentWrongWordCount", memberEmailId);
	}

	@Override
	public int selectTotalCorrectWordCount(String memberEmailId) {
		return sqlSessionTemplate.selectOne("statistics.selectTotalCorrectWordCount", memberEmailId);
	}

	@Override
	public List<String> selectListStudyWordCategoryList(String memberEmailId) {
		return sqlSessionTemplate.selectList("statistics.selectListStudyWordCategoryList", memberEmailId);
	}

	@Override
	public int selectWordCountByCategory(HashMap<String, String> paraMap) {
		return sqlSessionTemplate.selectOne("statistics.selectWordCountByCategory", paraMap);
	}

	@Override
	public int selectCountTotalWordByGrade(HashMap<String, String> paraMap) {
		return sqlSessionTemplate.selectOne("statistics.selectCountTotalWordByGrade", paraMap);
	}

	@Override
	public int selectCountTotalCorrectWordByGrade(HashMap<String, String> paraMap) {
		return sqlSessionTemplate.selectOne("statistics.selectCountTotalCorrectWordByGrade", paraMap);
	}

	@Override
	public List<HangeulbotInitialSoundVO> selectListInitialSound() {
		return sqlSessionTemplate.selectList("statistics.selectListInitialSound");
	}

	@Override
	public List<HangeulbotVowelVO> selectListVowel() {
		return sqlSessionTemplate.selectList("statistics.selectListVowel");
	}

	@Override
	public List<HangeulbotFinalConsonantVO> selectListFinalConsonant() {
		return sqlSessionTemplate.selectList("statistics.selectListFinalConsonant");
	}
}
