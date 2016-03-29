package kr.co.hangeulbot.model.vo;

public class HangeulbotInitialSoundVO {
	private String initialSoundId;
	private int initialSoundIndex;
	private String initialSound;
	public HangeulbotInitialSoundVO() {
		super();
	}
	public String getInitialSoundId() {
		return initialSoundId;
	}
	public void setInitialSoundId(String initialSoundId) {
		this.initialSoundId = initialSoundId;
	}
	public int getInitialSoundIndex() {
		return initialSoundIndex;
	}
	public void setInitialSoundIndex(int initialSoundIndex) {
		this.initialSoundIndex = initialSoundIndex;
	}
	public String getInitialSound() {
		return initialSound;
	}
	public void setInitialSound(String initialSound) {
		this.initialSound = initialSound;
	}
	@Override
	public String toString() {
		return "HangeulbotInitialSoundVO [initialSoundId=" + initialSoundId
				+ ", initialSoundIndex=" + initialSoundIndex
				+ ", initialSound=" + initialSound + "]";
	}
	
}
