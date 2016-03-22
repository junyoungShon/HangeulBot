package kr.co.hangeulbot.model.vo;

public class HangeulbotPhonicsFinalLogVO extends HangeulbotPhonicsLogVO{
	private String finalConsonantId;

	public HangeulbotPhonicsFinalLogVO() {
		super();
	}

	public String getFinalConsonantId() {
		return finalConsonantId;
	}

	public void setFinalConsonantId(String finalConsonantId) {
		this.finalConsonantId = finalConsonantId;
	}

	@Override
	public String toString() {
		return "HangeulbotPhonicsFinalLogVO [finalConsonantId="
				+ finalConsonantId + "]";
	}
	
}
