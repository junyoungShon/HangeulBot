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
		this.vowelId = "j"+(jun+"");
	}

	@Override
	public String toString() {
		return "HangeulbotPhonicsVowelLogVO [vowelId=" + vowelId + "]";
	}
	
}
