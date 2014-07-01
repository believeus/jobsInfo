package com.etech.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	/**创建时间*/
	private long createDate;
	/**上次登录时间*/
	private long lastLoginData;
	/** 用户登录密码 */
	private String password;
	/**确定密码*/
	private String comfirmPwd;
	/** 手机号码 */
	private String phoneNum;
	/** 用户邮箱 */
	private String email;
	/** 身份证号码 */
	private String idcard;
	/** 公司地址 */
	private String address;
	/**用户属于哪个角色*/
	
	/** 1:禁用 0:启用*/
	private int disable;
	
	private Set<Trole> roles=new HashSet<Trole>();
	
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
	@Transient
	public String getComfirmPwd() {
		return comfirmPwd;
	}
	public void setComfirmPwd(String comfirmPwd) {
		this.comfirmPwd = comfirmPwd;
	}
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinTable(name = "t_user_role",
    joinColumns = { @JoinColumn(name = "fk_userId", referencedColumnName = "id") }, 
    inverseJoinColumns = { @JoinColumn(name = "fk_roleId", referencedColumnName = "id") })
	public Set<Trole> getRoles() {
		return roles;
	}
	public void setRoles(Set<Trole> roles) {
		this.roles = roles;
	}
	public int getDisable() {
		return disable;
	}
	public void setDisable(int disable) {
		this.disable = disable;
	}
	
	
}
