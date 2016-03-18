package kr.co.hangeulbot.model.vo;

public class HangeulbotMemberVO {

	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String babyName;
	private String babyBirthDate;
	private String babySex;
	
	public HangeulbotMemberVO() {
		super();
	}

	public HangeulbotMemberVO(String memberEmail, String memberPassword,
			String memberName, String babyName, String babyBirthDate,
			String babySex) {
		super();
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.babyName = babyName;
		this.babyBirthDate = babyBirthDate;
		this.babySex = babySex;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBabyName() {
		return babyName;
	}

	public void setBabyName(String babyName) {
		this.babyName = babyName;
	}

	public String getBabyBirthDate() {
		return babyBirthDate;
	}

	public void setBabyBirthDate(String babyBirthDate) {
		this.babyBirthDate = babyBirthDate;
	}

	public String getBabySex() {
		return babySex;
	}

	public void setBabySex(String babySex) {
		this.babySex = babySex;
	}

	@Override
	public String toString() {
		return "MemberVO [memberEmail=" + memberEmail + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName + ", babyName="
				+ babyName + ", babyBirthDate=" + babyBirthDate + ", babySex="
				+ babySex + "]";
	}
	
	
	
}
