package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author wuqiwei
 * Data:2014-05-23
 * 一般用户
 * */
@Entity
@Table
public class TCommonUser implements Serializable{

	private static final long serialVersionUID = 5791526164788361621L;
	public static final String LoginName="loginName";
	private int id;
	/** 登录名 */
	private String loginName;
	/**真实姓名*/
	private String trueName;
	/**编辑更新时间*/
	private long editDate;
	/*创建时间*/
	private long createDate;
	/**身高*/
	private String height;
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
	
	@Column(unique=true,nullable = false,columnDefinition="varchar(25) comment '登录名'  default '' ")
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Column(nullable = false,columnDefinition="varchar(25) comment '登录密码'  default '' ")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	/** 身份证号码 */
	@Column(unique=true,nullable = false,columnDefinition="varchar(45) comment '身份证号码'")
	public String getIdcard() {
		return idcard;
	}
	/** 身份证号码 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	@Column(nullable = false,columnDefinition="varchar(40) comment '电话号码' default '' ")
	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	@Column(nullable = true,columnDefinition="varchar(30) comment '邮箱' default '' ")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	/** 用户民族 */
	@Column(nullable = true,columnDefinition="varchar(25) comment '民族' default '' ")
	public String getEthnic() {
		return ethnic;
	}
	/** 用户民族 */
	public void setEthnic(String ethnic) {
		this.ethnic = ethnic;
	}
	/** 教育程度 */
	@Column(nullable = true,columnDefinition="varchar(25) comment '教育程度' default '' ")
	public String getEduLevel() {
		return eduLevel;
	}
	/** 教育程度 */
	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}
	/** 政治面貌 */
	@Column(nullable = true,columnDefinition="varchar(25) comment '政治面貌' default '' ")
	public String getPoliticalFace() {
		return politicalFace;
	}
	/** 政治面貌 */
	public void setPoliticalFace(String politicalFace) {
		this.politicalFace = politicalFace;
	}

	/** 户口性质 */
	@Column(nullable = true,columnDefinition="varchar(25) comment '户口性质' default '' ")
	public String getKindOfAccounts() {
		return kindOfAccounts;
	}
	/** 户口性质 */
	public void setKindOfAccounts(String kindOfAccounts) {
		this.kindOfAccounts = kindOfAccounts;
	}
	@Column(nullable = true,columnDefinition="varchar(20) comment '用户真实姓名' default '' ")
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	@Column(nullable = false,columnDefinition="bigint comment '用户创建时间'")
	public long getEditDate() {
		return editDate;
	}
	public void setEditDate(long editDate) {
		this.editDate = editDate;
	}
	@Column(nullable = true,columnDefinition="varchar(10) comment '身高' default '' ")
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	@Column(nullable = false,columnDefinition="bigint comment '用户编辑时间'")
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	
}
