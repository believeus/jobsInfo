package com.etech.entity;

/** 企业用户 */
public class EnterpriseUser extends BaseEntity {
	private static final long serialVersionUID = 6293704345783832975L;
	/** 用户名 */
	private String name;
	/** 用户登录密码 */
	private String password;
	/** 公司联系电话 */
	private String cpPhoneNum;
	/** 公司邮箱 */
	private String cpEmail;
	private String cpName;
	/** 公司地址 */
	private String cpAddres;
	/** 公司联系人 */
	private String cpContacts;
	/** 公司性质 */
	private String kindOfcp;

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

	public String getCpPhoneNum() {
		return cpPhoneNum;
	}

	public void setCpPhoneNum(String cpPhoneNum) {
		this.cpPhoneNum = cpPhoneNum;
	}

	public String getCpEmail() {
		return cpEmail;
	}

	public void setCpEmail(String cpEmail) {
		this.cpEmail = cpEmail;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public String getCpAddres() {
		return cpAddres;
	}

	public void setCpAddres(String cpAddres) {
		this.cpAddres = cpAddres;
	}

	public String getCpContacts() {
		return cpContacts;
	}

	public void setCpContacts(String cpContacts) {
		this.cpContacts = cpContacts;
	}

	public String getKindOfcp() {
		return kindOfcp;
	}
	/** 公司性质 */
	public void setKindOfcp(String kindOfcp) {
		this.kindOfcp = kindOfcp;
	}

}
