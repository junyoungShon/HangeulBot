package kr.co.hangeulbot.model.vo;

import java.util.Date;

public class HangeulbotPhonicsLogVO {
	private String memberEmailId;
	private String lastUpdate;
	private int totalStudy;
	private int totalWrongAnswer;
	private int totalCorrectAnswer;
	public HangeulbotPhonicsLogVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMemberEmailId() {
		return memberEmailId;
	}
	public void setMemberEmailId(String memberEmailId) {
		this.memberEmailId = memberEmailId;
	}
	public String getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public int getTotalStudy() {
		return totalStudy;
	}
	public void setTotalStudy(int totalStudy) {
		this.totalStudy = totalStudy;
	}
	public int getTotalWrongAnswer() {
		return totalWrongAnswer;
	}
	public void setTotalWrongAnswer(int totalWrongAnswer) {
		this.totalWrongAnswer = totalWrongAnswer;
	}
	public int getTotalCorrectAnswer() {
		return totalCorrectAnswer;
	}
	public void setTotalCorrectAnswer(int totalCorrectAnswer) {
		this.totalCorrectAnswer = totalCorrectAnswer;
	}
	@Override
	public String toString() {
		return "HangeulbotPhonicsVO [memberEmailId=" + memberEmailId
				+ ", lastUpdate=" + lastUpdate + ", totalStudy=" + totalStudy
				+ ", totalWrongAnswer=" + totalWrongAnswer
				+ ", totalCorrectAnswer=" + totalCorrectAnswer + "]";
	}
}
