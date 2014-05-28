package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/** 企业用户 */
/**
 * @author wuqiwei
 *
 */
@Entity
@Table
public class TentUser extends TbaseUser implements Serializable {
	private static final long serialVersionUID = 6293704345783832975L;
	
	/** 公司联系人 */
	private String contacts;
	/** 单位类型 */
	private String unitType;
	/**经济类型*/
	private String economicType;
	/**详细地址*/
	private String detailAddress;
	/**单位简称*/
	private String shorName;
	/**法人*/
	private String legalMan;
	/**是否审核通过 0:审核中 1:审核通过*/
	private String status;
	/**所属地区*/
	private String area;
	/**行业*/
	private String trade;
	/**注册资金*/
	private String regMoney;
	/**邮编*/
	private String zip;
	/**简介*/
	private String introduce;
	/**网址*/
	private String webSite;
	/**隶属关系*/
	private String relationship;
	@Length(max=25)
	@Column(nullable=true)
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	
	@Length(max=25)
	@Column(nullable=true)
	public String getLegalMan() {
		return legalMan;
	}
	public void setLegalMan(String legalMan) {
		this.legalMan = legalMan;
	}
	@NotEmpty
	@Length(max=2)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Length(max=10)
	public String getUnitType() {
		return unitType;
	}
	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}
	@Length(max=10)
	public String getEconomicType() {
		return economicType;
	}
	public void setEconomicType(String economicType) {
		this.economicType = economicType;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	@Length(max=20)
	public String getShorName() {
		return shorName;
	}
	public void setShorName(String shorName) {
		this.shorName = shorName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	@Length(max=10)
	public String getRegMoney() {
		return regMoney;
	}
	public void setRegMoney(String regMoney) {
		this.regMoney = regMoney;
	}
	@Length(max=20)
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getWebSite() {
		return webSite;
	}
	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}
	@Length(max=10)
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	
}
