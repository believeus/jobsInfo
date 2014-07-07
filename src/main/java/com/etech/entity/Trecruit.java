package com.etech.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;
import org.hibernate.validator.constraints.Length;

/**招聘信息*/
@Entity
@Table
@Indexed(index="com.etech.entity.Trecruit")
public class Trecruit extends TbaseEntity implements Serializable {
	private static final long serialVersionUID = 2866696326333568722L;
	
	/**招聘单位*/
	@Length(max=25)
	@Column(nullable=false)
	private String company;
	//公司类型
	private String companyType;
	/**招收人数*/
	private Integer worknum;
	
	/**性别*/
	@Length(max=5)
	private String sex;
	/**技术等级*/
	@Length(max=15)
	private String eteLevel;
	//创建时间
	private long createTime;
	//编辑时间
	private long editTime;
	/**文化程度*/
	@Length(max=20)
	private String eduLevel;
	/**从事年限*/
	private String workyear;
	private Integer age;
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
	private String worklimit;
	/**面试时间*/
	private long viewData;
	/**工作性质*/
	@Length(max=20)
	private String workWay;
	/**工作地点*/
	@Length(max=45)
	private String workspace;
	/**备注*/
	private String note;
	/**是否审核通过 0:审核中 1:审核通过*/
	@Column(nullable=true)
	private int status;
	private String isview;
	/**专业类型*/
	private TmajorType majorType;
	/**工种类型*/
	private TmajorType workType;
	/**工作岗位*/
	private String jobPost;
	/** 该信息属于那个用户 */
	private TentUser entUser;
	
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Integer getWorknum() {
		return worknum;
	}

	public void setWorknum(Integer worknum) {
		this.worknum = worknum;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	// 学历
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getEteLevel() {
		return eteLevel;
	}

	public void setEteLevel(String eteLevel) {
		this.eteLevel = eteLevel;
	}
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getEduLevel() {
		return eduLevel;
	}

	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getWorkyear() {
		return workyear;
	}

	public void setWorkyear(String workyear) {
		this.workyear = workyear;
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
	@Field(store=Store.YES,index = Index.UN_TOKENIZED)
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
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getWorkWay() {
		return workWay;
	}

	public void setWorkWay(String workWay) {
		this.workWay = workWay;
	}

	@Field(store=Store.YES,index=Index.TOKENIZED)
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
	
	@IndexedEmbedded
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="fk_workTypeId",referencedColumnName="id")
	public TmajorType getWorkType() {
		return workType;
	}
	public void setWorkType(TmajorType workType) {
		this.workType = workType;
		if(workType!=null){
			this.jobPost=workType.getName();
			setJobPost(jobPost);
		}
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	@Field(store=Store.YES,index = Index.UN_TOKENIZED)
	public long getEditTime() {
		return editTime;
	}

	public void setEditTime(long editTime) {
		this.editTime = editTime;
	}
	// 公司性质
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getCompanyType() {
		try {
			return companyType=entUser.getUnitType();
		} catch (Exception e) {
			return this.companyType;
		}
	}
	public void setCompanyType(String companyType) {
		try {
		   this.companyType=entUser.getUnitType();
		} catch (Exception e) {
			this.companyType = companyType;
		}
	}
	@Field(store=Store.YES,index = Index.TOKENIZED)
	public String getJobPost() {
		return jobPost;
	}

	public void setJobPost(String jobPost) {
		try {
			this.jobPost=workType.getName();
		} catch (Exception e) {
			this.jobPost = jobPost;
		}
	}
	public String getIsview() {
		return isview;
	}

	public void setIsview(String isview) {
		this.isview = isview;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	

}
