package kr.co.hangeulbot.model.vo;

public class HangeulbotFinalConsonantVO {
	private String finalConsonantId;
	private int finalConsonantIndex;
	private String finalConsonant;
	public HangeulbotFinalConsonantVO() {
		super();
	}
	public String getFinalConsonantId() {
		return finalConsonantId;
	}
	public void setFinalConsonantId(String finalConsonantId) {
		this.finalConsonantId = finalConsonantId;
	}
	public int getFinalConsonantIndex() {
		return finalConsonantIndex;
	}
	public void setFinalConsonantIndex(int finalConsonantIndex) {
		this.finalConsonantIndex = finalConsonantIndex;
	}
	public String getFinalConsonant() {
		return finalConsonant;
	}
	public void setFinalConsonant(String finalConsonant) {
		this.finalConsonant = finalConsonant;
	}
	@Override
	public String toString() {
		return "HangeulbotFinalConsonant [finalConsonantId=" + finalConsonantId
				+ ", finalConsonantIndex=" + finalConsonantIndex
				+ ", finalConsonant=" + finalConsonant + "]";
	}
}
