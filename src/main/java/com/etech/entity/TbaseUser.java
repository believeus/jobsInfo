package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table
/*使用继承关系创建子类表*/
@Inheritance(strategy=InheritanceType.JOINED)
public class TbaseUser extends TbaseEntity implements Serializable{
	
	private static final long serialVersionUID = -6040207682160417660L;
	/** 登录名 */
	private String loginName;
	/**真实姓名*/
	private String trueName;
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
	
	@NotEmpty
	@Length(max = 25)
	@Column(nullable = false)
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	@Column(nullable = true)
	public long getEditDate() {
		return editDate;
	}
	public void setEditDate(long editDate) {
		this.editDate = editDate;
	}
	@Column(nullable = true)
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	@Column(nullable = true)
	public long getLastLoginData() {
		return lastLoginData;
	}
	public void setLastLoginData(long lastLoginData) {
		this.lastLoginData = lastLoginData;
	}
	@NotEmpty
	@Length(max = 32)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Length(max = 25)
	@Column(nullable = true)
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	@Length(max = 32)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	/** 身份证号码 */
	@NotEmpty
	@Length(max = 18)
	public String getIdcard() {
		return idcard;
	}
	/** 身份证号码 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	/**家庭住址*/
	
	@Length(max = 32)
	@Column(nullable = true)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Length(max = 32)
	@Column(nullable = true)
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	
	
}
