package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/** 企业用户 */
/**
 * @author wuqiwei
 *
 */
@Entity
@Table(name="TEnterpriseUser")
public class EnterpriseUser implements Serializable {
	
	private static final long serialVersionUID = 6293704345783832975L;
	private int id;
	/** 用户名 */
	private String loginName;
	/** 用户登录密码 */
	private String password;
	/**上次登录时间*/
	private long lastLoginData;
	/**编辑更新时间*/
	private long editDate;
	/*创建时间*/
	private long createDate;
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
	@Column(nullable = false,columnDefinition="varchar(30) comment '登录名' default '' ")
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Column(nullable = false,columnDefinition="varchar(40) comment '登录密码'  default '' ")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '公司电话号码' default '' ")
	public String getCpPhoneNum() {
		return cpPhoneNum;
	}

	public void setCpPhoneNum(String cpPhoneNum) {
		this.cpPhoneNum = cpPhoneNum;
	}
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业邮箱' default '' ")
	public String getCpEmail() {
		return cpEmail;
	}
	
	
	public void setCpEmail(String cpEmail) {
		this.cpEmail = cpEmail;
	}
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业名' default '' ")
	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业地址' default '' ")
	public String getCpAddres() {
		return cpAddres;
	}

	public void setCpAddres(String cpAddres) {
		this.cpAddres = cpAddres;
	}
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业联系方式' default '' ")
	public String getCpContacts() {
		return cpContacts;
	}

	public void setCpContacts(String cpContacts) {
		this.cpContacts = cpContacts;
	}
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业类型' default '' ")
	public String getKindOfcp() {
		return kindOfcp;
	}
	/** 公司性质 */
	public void setKindOfcp(String kindOfcp) {
		this.kindOfcp = kindOfcp;
	}
	
	@Column(nullable = false,columnDefinition="bigint comment '上次登录时间'")
	public long getLastLoginData() {
		return lastLoginData;
	}

	public void setLastLoginData(long lastLoginData) {
		this.lastLoginData = lastLoginData;
	}
	@Column(nullable = false,columnDefinition="bigint comment '最新编辑时间'")
	public long getEditDate() {
		return editDate;
	}

	public void setEditDate(long editDate) {
		this.editDate = editDate;
	}
	@Column(nullable = false,columnDefinition="bigint comment '创建时间'")
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	
}
