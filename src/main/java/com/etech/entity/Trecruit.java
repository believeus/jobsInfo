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

/**招聘信息*/
@Entity
@Table
public class Trecruit extends TbaseEntity implements Serializable {
	private static final long serialVersionUID = 2866696326333568722L;
	
	/**招聘单位*/
	@Length(max=25)
	@Column(nullable=false)
	private String company;
	/**招收人数*/
	private int worknum;
	/**性别*/
	@Length(max=5)
	@Column(nullable=true)
	private String sex;
	/**技术等级*/
	@Length(max=15)
	@Column(nullable=true)
	private String eteLevel;
	/**文化程度*/
	@Length(max=20)
	@Column(nullable=true)
	private String eduLevel;
	/**从事年限*/
	private int workyear;
	private int age;
	/**视力*/
	@Length(max=5)
	private String eyesight;
	/**身高*/
	@Length(max=10)
	private String height;
	/**薪资待遇*/
	@Length(max=10)
	private String salary;
	/**招聘限制*/
	@Length(max=2)
	private String worklimit;
	/**面试时间*/
	private long viewData;
	/**用工形式*/
	@Length(max=20)
	private String workWay;
	/**工作地点*/
	@Length(max=45)
	private String workspace;
	/**备注*/
	@Column(nullable=true)
	private String note;
	
	/**专业类型*/
	private TmajorType majorType;
	
	/**工种类型*/
	private TmajorType workType;
	
	/** 该信息属于那个用户 */
	private TentUser entUser;
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getWorknum() {
		return worknum;
	}

	public void setWorknum(int worknum) {
		this.worknum = worknum;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEteLevel() {
		return eteLevel;
	}

	public void setEteLevel(String eteLevel) {
		this.eteLevel = eteLevel;
	}

	public String getEduLevel() {
		return eduLevel;
	}

	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}

	public int getWorkyear() {
		return workyear;
	}

	public void setWorkyear(int workyear) {
		this.workyear = workyear;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEyesight() {
		return eyesight;
	}

	public void setEyesight(String eyesight) {
		this.eyesight = eyesight;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	

	public String getWorklimit() {
		return worklimit;
	}

	public void setWorklimit(String worklimit) {
		this.worklimit = worklimit;
	}

	public long getViewData() {
		return viewData;
	}

	public void setViewData(long viewData) {
		this.viewData = viewData;
	}

	public String getWorkWay() {
		return workWay;
	}

	public void setWorkWay(String workWay) {
		this.workWay = workWay;
	}

	public String getWorkspace() {
		return workspace;
	}

	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="fk_workTypeId",referencedColumnName="id")
	public TmajorType getWorkType() {
		return workType;
	}
	public void setWorkType(TmajorType workType) {
		this.workType = workType;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="fk_majorTypeId",referencedColumnName="id")
	public TmajorType getMajorType() {
		return majorType;
	}
	public void setMajorType(TmajorType majorType) {
		this.majorType = majorType;
	}

	@ManyToOne(cascade=CascadeType.ALL,optional = false)
	@JoinColumn(name="fk_entuUserId",referencedColumnName="id")
	public TentUser getEntUser() {
		return entUser;
	}

	public void setEntUser(TentUser entUser) {
		this.entUser = entUser;
	}
	
	
}
