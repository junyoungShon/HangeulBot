package kr.co.hangeulbot.model.vo;

public class HangeulbotPhonicsVowelLogVO extends HangeulbotPhonicsLogVO{
	private String vowelId;

	public HangeulbotPhonicsVowelLogVO() {
		super();
	}

	public String getVowelId() {
		return vowelId;
	}

	public void setVowelId(int jun) {
		this.vowelId = "v"+(jun+"");
	}
	public void setVowelId(String vowelId) {
		this.vowelId = vowelId;
	}

	@Override
	public String toString() {
		return "HangeulbotPhonicsVowelLogVO [vowelId=" + vowelId + "]";
	}
	
}
