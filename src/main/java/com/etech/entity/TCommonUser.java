package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author wuqiwei
 * Data:2014-05-23
 * 一般用户
 * */
@Entity
@Table
public class TCommonUser extends TUser implements Serializable{

	private static final long serialVersionUID = 5791526164788361621L;
	
	/**真实姓名*/
	private String trueName;
	/**身高*/
	private String height;	
	/** 用户民族 */
	private String ethnic;
	/** 教育程度 */
	private String eduLevel;
	/** 政治面貌 */
	private String politicalFace;
	/** 户口性质 */
	private String kindOfAccounts;

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

	@Column(nullable = true,columnDefinition="varchar(10) comment '身高' default '' ")
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}

	
}
