package com.etech.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/** 企业用户 */
public class EnterpriseUser implements Serializable {
	
	private static final long serialVersionUID = 6293704345783832975L;
	public static final String LoginName="loginName";
	private int id;
	/** 用户名 */
	private String loginName;
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

	
	@Id
	// MySQL/SQLServer: @GeneratedValue(strategy = GenerationType.AUTO)
	// Oracle: @GeneratedValue(strategy = GenerationType.AUTO, generator = "sequenceGenerator")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public static String getLoginname() {
		return LoginName;
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
