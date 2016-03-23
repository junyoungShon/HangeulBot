package kr.co.hangeulbot.model.vo;

public class HangeulbotWordVO {

	private String midCategoryId;
	private String wordId;
	private String word;
	private String wordGrade;
	
	public HangeulbotWordVO() {
		super();
	}

	public HangeulbotWordVO(String midCategoryId, String wordId, String word,
			String wordGrade) {
		super();
		this.midCategoryId = midCategoryId;
		this.wordId = wordId;
		this.word = word;
		this.wordGrade = wordGrade;
	}

	public String getMidCategoryId() {
		return midCategoryId;
	}

	public void setMidCategoryId(String midCategoryId) {
		this.midCategoryId = midCategoryId;
	}

	public String getWordId() {
		return wordId;
	}

	public void setWordId(String wordId) {
		this.wordId = wordId;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getWordGrade() {
		return wordGrade;
	}

	public void setWordGrade(String wordGrade) {
		this.wordGrade = wordGrade;
	}

	@Override
	public String toString() {
		return "HangeulbotWordVO [midCategoryId=" + midCategoryId + ", wordId="
				+ wordId + ", word=" + word + ", wordGrade=" + wordGrade + "]";
	}
	
}
