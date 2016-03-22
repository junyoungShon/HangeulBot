package kr.co.hangeulbot.model.vo;


public class HangeulbotWordLogVO {
	private String wordId;
	private String word;
	private String memberEmailId;
	private int spendTime;
	private int isCorrect;
	private String studyDate;
	public HangeulbotWordLogVO() {
		super();
	}
	public HangeulbotWordLogVO(String wordId, String word,
			String memberEmailId, int spendTime, int isCorrect, String studyDate) {
		super();
		this.wordId = wordId;
		this.memberEmailId = memberEmailId;
		this.spendTime = spendTime;
		this.isCorrect = isCorrect;
		this.studyDate = studyDate;
	}
	public String getWordId() {
		return wordId;
	}
	public void setWordId(String wordId) {
		this.wordId = wordId;
	}
	public String getMemberEmailId() {
		return memberEmailId;
	}
	public void setMemberEmailId(String memberEmailId) {
		this.memberEmailId = memberEmailId;
	}
	public int getSpendTime() {
		return spendTime;
	}
	public void setSpendTime(int spendTime) {
		this.spendTime = spendTime;
	}
	public int getIsCorrect() {
		return isCorrect;
	}
	public void setIsCorrect(int isCorrect) {
		this.isCorrect = isCorrect;
	}
	public String getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}
	
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "HangeulbotWordLogVO [wordId=" + wordId + ", word=" + word
				+ ", memberEmailId=" + memberEmailId + ", spendTime="
				+ spendTime + ", isCorrect=" + isCorrect + ", studyDate="
				+ studyDate + "]";
	}

	
	
	
}
