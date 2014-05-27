package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name = "TUser")
/*使用继承关系创建子类表*/
@Inheritance(strategy=InheritanceType.JOINED)
public class TUser implements Serializable{
	
	private static final long serialVersionUID = -6040207682160417660L;
	private int id;
	/** 登录名 */
	private String loginName;
	/**编辑更新时间*/
	private long editDate;
	/*创建时间*/
	private long createDate;
	/**上次登录时间*/
	private long lastLoginData;
	/** 用户登录密码 */
	private String password;
	/** 手机号码 */
	private String phoneNum;
	/** 用户邮箱 */
	private String email;
	/** 身份证号码 */
	private String idcard;
	/** 公司地址 */
	private String address;
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
	@Column(nullable = false,columnDefinition="bigint comment '用户编辑时间'")
	public long getEditDate() {
		return editDate;
	}
	public void setEditDate(long editDate) {
		this.editDate = editDate;
	}
	@Column(nullable = false,columnDefinition="bigint comment '用户创建时间'")
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	@Column(nullable = false,columnDefinition="bigint comment '最近登录时间'")
	public long getLastLoginData() {
		return lastLoginData;
	}
	public void setLastLoginData(long lastLoginData) {
		this.lastLoginData = lastLoginData;
	}
	@Column(nullable = false,columnDefinition="varchar(40) comment '登录密码'  default '' ")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(nullable = true,columnDefinition="varchar(40) comment '电话号码' default '' ")
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
	/** 身份证号码 */
	@Column(unique=true,nullable = false,columnDefinition="varchar(45) comment '身份证号码'")
	public String getIdcard() {
		return idcard;
	}
	/** 身份证号码 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	/**家庭住址*/
	@Column(nullable = true,columnDefinition="varchar(30) comment '地址' default '' ")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
