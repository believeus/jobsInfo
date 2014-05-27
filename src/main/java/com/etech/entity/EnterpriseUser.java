package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/** 企业用户 */
/**
 * @author wuqiwei
 *
 */
@Entity
@Table(name="TEnterpriseUser")
public class EnterpriseUser extends TUser implements Serializable {
	
	private static final long serialVersionUID = 6293704345783832975L;
	/**公司名字*/
	private String cpName;
	/** 公司联系人 */
	private String cpContacts;
	/** 公司性质 */
	private String kindOfcp;

	
	
	@Column(nullable = false,columnDefinition="varchar(30) comment '企业名' default '' ")
	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
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
}
