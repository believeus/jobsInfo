package com.etech.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

/**
 * 普通用户的信息
 */
@Entity
@Table
public class TcomInfo extends TbaseEntity implements Serializable{
	private static final long serialVersionUID = -948982752176471588L;
	
	/**系别*/
	private String dept;
	/**工作职责*/
	private String duty;
	/**开始时间*/
	private long beginData;
	/**结束时间*/
	private long endData;
	/**技能等级*/
	private String skillLevel;
	/**工作年限*/
	private String workingLife;
	/**工作单位*/
	private String workspace;
	/**期望薪水*/
    private String expectSalary;
    /**期望工作所在地*/
    private String expectArea;
	/**描述*/
	private String note;
	/**工种*/
	private TmajorType workType;
	/**专业*/
	private TmajorType majorType;
	
	/**该信息属于哪个用户*/
	private TcomUser comUser;
	
	
	@ManyToOne(cascade=CascadeType.ALL,optional = false)
	@JoinColumn(name="fk_comUserId",referencedColumnName="id")
	public TcomUser getComUser() {
		return comUser;
	}
	public void setComUser(TcomUser comUser) {
		this.comUser = comUser;
	}
	@Column(nullable=true)
	@Length(max=30)
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	@Column(nullable=true)
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	@Column(nullable=true)
	public long getBeginData() {
		return beginData;
	}
	public void setBeginData(long beginData) {
		this.beginData = beginData;
	}
	@Column(nullable=true)
	public long getEndData() {
		return endData;
	}
	public void setEndData(long endData) {
		this.endData = endData;
	}
	@Column(nullable=true)
	@Length(max=20)
	public String getSkillLevel() {
		return skillLevel;
	}
	public void setSkillLevel(String skillLevel) {
		this.skillLevel = skillLevel;
	}
	@Column(nullable=true)
	@Length(max=20)
	public String getWorkingLife() {
		return workingLife;
	}
	public void setWorkingLife(String workingLife) {
		this.workingLife = workingLife;
	}
	@Column(nullable=true)
	public String getWorkspace() {
		return workspace;
	}
	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}
	@Column(nullable=true)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getExpectSalary() {
		return expectSalary;
	}
	public void setExpectSalary(String expectSalary) {
		this.expectSalary = expectSalary;
	}
	public String getExpectArea() {
		return expectArea;
	}
	public void setExpectArea(String expectArea) {
		this.expectArea = expectArea;
	}

	@ManyToOne(fetch = FetchType.LAZY)//多对一的时候可以获取admin对象
	@JoinColumn(name="fk_workTypeId",referencedColumnName="id",nullable=true)
	public TmajorType getWorkType() {
		return workType;
	}
	public void setWorkType(TmajorType workType) {
		this.workType = workType;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="fk_majorTypeId",referencedColumnName="id",nullable=true)
	public TmajorType getMajorType() {
		return majorType;
	}
	public void setMajorType(TmajorType majorType) {
		this.majorType = majorType;
	}
}
