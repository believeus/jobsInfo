package com.etech.entity;

/** 一般用户 */
public class CommonUser extends BaseEntity {
	private static final long serialVersionUID = 6293704345783832975L;
	/** 用户名 */
	private String name;
	/** 用户登录密码 */
	private String password;
	/** 身份证号码 */
	private String idcard;
	/** 手机号码 */
	private String phoneNum;
	/** 用户邮箱 */
	private String email;
	/** 用户民族 */
	private String ethnic;
	/** 教育程度 */
	private String eduLevel;
	/** 政治面貌 */
	private String politicalFace;
	/** 户口性质 */
	private String kindOfAccounts;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	/** 身份证号码 */
	public String getIdcard() {
		return idcard;
	}
	/** 身份证号码 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	/** 用户民族 */
	public String getEthnic() {
		return ethnic;
	}
	/** 用户民族 */
	public void setEthnic(String ethnic) {
		this.ethnic = ethnic;
	}
	/** 教育程度 */
	public String getEduLevel() {
		return eduLevel;
	}
	/** 教育程度 */
	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}
	/** 政治面貌 */
	public String getPoliticalFace() {
		return politicalFace;
	}
	/** 政治面貌 */
	public void setPoliticalFace(String politicalFace) {
		this.politicalFace = politicalFace;
	}

	/** 户口性质 */
	public String getKindOfAccounts() {
		return kindOfAccounts;
	}
	/** 户口性质 */
	public void setKindOfAccounts(String kindOfAccounts) {
		this.kindOfAccounts = kindOfAccounts;
	}

}
