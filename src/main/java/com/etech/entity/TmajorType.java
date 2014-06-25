package com.etech.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * 用户拥有技能的类型
 * */
@Entity
@Table
@Indexed(index="com.etech.entity.TmajorType")
public class TmajorType extends TbaseEntity implements Serializable {

	private static final long serialVersionUID = 265386274128991391L;
	/**专业或工种编码*/
	private int codeId;
	/** 个人用户专业信息*/
	private Set<TcomInfo> comInfoMajor;
	/** 个人用户工种信息*/
	private Set<TcomInfo> comInfoWork;
	/**专业或工种名*/
	private String name;

	/** 企业用户专业信息*/
	private Set<Trecruit> recruitMajor;
	/** 企业用户工种信息*/
	private Set<Trecruit> recruitWork;
	@OneToMany(fetch = FetchType.LAZY,mappedBy="majorType")
	public Set<TcomInfo> getComInfoMajor() {
		return comInfoMajor;
	}

	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public Set<TcomInfo> getComInfoWork() {
		return comInfoWork;
	}
	public int getCodeId() {
		return codeId;
	}

	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}


	/**专业或工种名*/
	@NotEmpty
	@Length(max = 25)
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getName() {
		return name;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="majorType")
	public Set<Trecruit> getRecruitMajor() {
		return recruitMajor;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public Set<Trecruit> getRecruitWork() {
		return recruitWork;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="workType")
	public void setComInfoMajor(Set<TcomInfo> comInfoMajor) {
		this.comInfoMajor = comInfoMajor;
	}

	public void setComInfoWork(Set<TcomInfo> comInfoWork) {
		this.comInfoWork = comInfoWork;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setRecruitMajor(Set<Trecruit> recruitMajor) {
		this.recruitMajor = recruitMajor;
	}

	public void setRecruitWork(Set<Trecruit> recruitWork) {
		this.recruitWork = recruitWork;
	}
}
