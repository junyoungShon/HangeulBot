package kr.co.hangeulbot.model;

import javax.annotation.Resource;

import kr.co.hangeulbot.model.vo.HangeulbotMemberVO;
import kr.co.hangeulbot.model.vo.HangeulbotWordLogVO;

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
	public HangeulbotMemberVO getMemberInfoByEmail(String memberEmail) {
		return sqlSessionTemplate.selectOne("member.getMemberInfoByEmail", memberEmail);
	}

	@Override
	public void insertWordLogInfo(HangeulbotWordLogVO hangeulbotWordLogVO) {
		sqlSessionTemplate.insert("statistics.insertWordLogInfo", hangeulbotWordLogVO);
	}
}
