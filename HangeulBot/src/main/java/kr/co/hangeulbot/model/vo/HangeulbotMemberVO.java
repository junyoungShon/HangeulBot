package kr.co.hangeulbot.model.vo;

public class HangeulbotMemberVO {

	private String memberEmailId;
	private String memberPassword;
	private String memberName;
	private String memberRegistDate;
	private String memberBabyName;
	private String memberBabyBirthDate;
	private String memberBabySex;
	private int memberBabyGrade;
	private int memberBabyTotalStudyTime;
	public HangeulbotMemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMemberEmailId() {
		return memberEmailId;
	}
	public void setMemberEmailId(String memberEmailId) {
		this.memberEmailId = memberEmailId;
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
	public String getMemberRegistDate() {
		return memberRegistDate;
	}
	public void setMemberRegistDate(String memberRegistDate) {
		this.memberRegistDate = memberRegistDate;
	}
	public String getMemberBabyName() {
		return memberBabyName;
	}
	public void setMemberBabyName(String memberBabyName) {
		this.memberBabyName = memberBabyName;
	}
	public String getMemberBabyBirthDate() {
		return memberBabyBirthDate;
	}
	public void setMemberBabyBirthDate(String memberBabyBirthDate) {
		this.memberBabyBirthDate = memberBabyBirthDate;
	}
	public String getMemberBabySex() {
		return memberBabySex;
	}
	public void setMemberBabySex(String memberBabySex) {
		this.memberBabySex = memberBabySex;
	}
	public int getMemberBabyGrade() {
		return memberBabyGrade;
	}
	public void setMemberBabyGrade(int memberBabyGrade) {
		this.memberBabyGrade = memberBabyGrade;
	}
	public int getMemberBabyTotalStudyTime() {
		return memberBabyTotalStudyTime;
	}
	public void setMemberBabyTotalStudyTime(int memberBabyTotalStudyTime) {
		this.memberBabyTotalStudyTime = memberBabyTotalStudyTime;
	}
	@Override
	public String toString() {
		return "HangeulbotMemberVO [memberEmailId=" + memberEmailId
				+ ", memberPassword=" + memberPassword + ", memberName="
				+ memberName + ", memberRegistDate=" + memberRegistDate
				+ ", memberBabyName=" + memberBabyName
				+ ", memberBabyBirthDate=" + memberBabyBirthDate
				+ ", memberBabySex=" + memberBabySex + ", memberBabyGrade="
				+ memberBabyGrade + ", memberBabyTotalStudyTime="
				+ memberBabyTotalStudyTime + "]";
	}
	
	

	
}
