package kr.co.hangeulbot.model.vo;

public class HangeulbotVowelVO {
	private String vowelId;
	private int vowelIndex;
	private String vowel;
	public HangeulbotVowelVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getVowelId() {
		return vowelId;
	}
	public void setVowelId(String vowelId) {
		this.vowelId = vowelId;
	}
	public int getVowelIndex() {
		return vowelIndex;
	}
	public void setVowelIndex(int vowelIndex) {
		this.vowelIndex = vowelIndex;
	}
	public String getVowel() {
		return vowel;
	}
	public void setVowel(String vowel) {
		this.vowel = vowel;
	}
	@Override
	public String toString() {
		return "HangeulbotVowel [vowelId=" + vowelId + ", vowelIndex="
				+ vowelIndex + ", vowel=" + vowel + "]";
	}
}
