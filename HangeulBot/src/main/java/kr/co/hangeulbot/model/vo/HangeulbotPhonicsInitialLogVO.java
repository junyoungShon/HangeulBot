package kr.co.hangeulbot.model.vo;

public class HangeulbotPhonicsInitialLogVO extends HangeulbotPhonicsLogVO{
	private String initialSoundId;

	public HangeulbotPhonicsInitialLogVO() {
		super();
	}

	public String getInitialSoundId() {
		return initialSoundId;
	}

	public void setInitialSoundId(int cho) {
		this.initialSoundId = "i"+(cho+"");
	}
	public void setInitialSoundId(String initialSoundId) {
		this.initialSoundId = initialSoundId;
	}

	@Override
	public String toString() {
		return "HangeulbotPhonicsInitialLogVO [initialSoundId="
				+ initialSoundId + "]";
	}
	
}
