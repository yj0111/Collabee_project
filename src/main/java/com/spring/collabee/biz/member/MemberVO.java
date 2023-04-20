package com.spring.collabee.biz.member;

public class MemberVO {
	int memberNum, grade;
	String id, password, name, email, phone,
			address, birth, regdate, gender,
			memberState, leaveDate, addressDetail;
	
	private int accumulRate;
	
	
	
	public int getAccumulRate() {
		return accumulRate;
	}

	public void setAccumulRate(int accumulRate) {
		this.accumulRate = accumulRate;
	}

	public MemberVO() {
		System.out.println("● MemberVO 객체생성");
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getMemberState() {
		return memberState;
	}

	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", grade=" + grade + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", email=" + email + ", phone=" + phone + ", address=" + address + ", birth="
				+ birth + ", regdate=" + regdate + ", gender=" + gender + ", memberState=" + memberState
				+ ", leaveDate=" + leaveDate + ", addressDetail=" + addressDetail + ", accumulRate=" + accumulRate
				+ "]";
	}


	

/*

	@Override
	public String toString() {
		return "{ memberNum: " + memberNum + ", "
			+ "grade: " + grade + ", "
	 		+ "gender: " + gender + ", "
	 		+ "id: '" + id	+ "', "
	 		+ "password: '" + password + "', "
			+ "name: '" + name + "', "
			+ "email: '" + email + "', "
			+ "phone: '" + phone + ", "
			+ "address: '"+ address + "', "
			+ "birth: '" + birth + "', "
			+ "regdate: '" + regdate + "', "
			+ "memberState: '" + memberState + "', "
			+ "leaveDate: '" + leaveDate + "', "
			+ "addressDetail: '" + addressDetail + "' }";
	}
	
	
		
*/
	
	
}
