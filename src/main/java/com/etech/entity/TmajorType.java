package com.etech.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * 用户拥有技能的类型
 * */
@Entity
@Table
public class TmajorType extends TbaseEntity implements Serializable {

	private static final long serialVersionUID = 265386274128991391L;
	/**专业或工种名*/
	private String name;
	/**专业或工种编码*/
	private int codeId;
	/**专业或工种属于哪个子类*/
	private int parent;
	/** 个人用户工种信息*/
	private Set<TcomInfo> comInfoWork;
	/** 个人用户专业信息*/
	private Set<TcomInfo> comInfoMajor;
	/** 企业用户工种信息*/
	private Set<Trecruit> recruitWork;
	/** 企业用户专业信息*/
	private Set<Trecruit> recruitMajor;
	
	/**专业或工种名*/
	@NotEmpty
	@Length(max = 25)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public int getCodeId() {
		return codeId;
	}
	
	@NotEmpty
	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}
	
	@NotEmpty
	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public Set<TcomInfo> getComInfoWork() {
		return comInfoWork;
	}

	public void setComInfoWork(Set<TcomInfo> comInfoWork) {
		this.comInfoWork = comInfoWork;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="majorType")
	public Set<TcomInfo> getComInfoMajor() {
		return comInfoMajor;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public void setComInfoMajor(Set<TcomInfo> comInfoMajor) {
		this.comInfoMajor = comInfoMajor;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="majorType")
	public Set<Trecruit> getRecruitMajor() {
		return recruitMajor;
	}

	public void setRecruitMajor(Set<Trecruit> recruitMajor) {
		this.recruitMajor = recruitMajor;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public Set<Trecruit> getRecruitWork() {
		return recruitWork;
	}

	public void setRecruitWork(Set<Trecruit> recruitWork) {
		this.recruitWork = recruitWork;
	}
}
