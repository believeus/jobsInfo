package com.etech.entity;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;
import org.hibernate.validator.constraints.Length;


/**
 * 普通用户的信息
 */
@Entity
@Table
@Indexed(index = "com.etech.entity.TcomInfo")
public class TcomInfo extends TbaseEntity implements Serializable {
	private static final long serialVersionUID = -948982752176471588L;

	/** 系别 */
	private String dept;
	/** 工作职责 */
	private String duty;
	/** 开始时间 */
	private long beginData;
	/** 结束时间 */
	private long endData;
	/** 编辑时间 */
	private long editDate;
	/** 创建时间 */
	private long createDate;
	/** 技能等级 */
	private String skillLevel;
	/** 工作年限 */
	private String workingLife;
	/** 工作单位 */
	private String workspace;
	/** 期望薪水 */
	private String expectSalary;
	/** 期望工作所在地 */
	private String expectArea;
	/** 工作方式 */
	private String workWay;
	/** 描述 */
	private String note;
	/** 工种 */
	private TmajorType workType;
	/** 专业 */
	private TmajorType majorType;

	/** 该信息属于哪个用户 */
	private TcomUser comUser;
	private String loginName;
	private String jobPost;

	/** 该信息属于哪个类型 1：表示具备技能，2：表示学习经历，3：表示工作经验，4：表示选择志愿 */
	private Integer infoType;

	@IndexedEmbedded
	@ManyToOne(cascade = CascadeType.ALL, optional = false)
	@JoinColumn(name = "fk_comUserId", referencedColumnName = "id")
	public TcomUser getComUser() {
		return comUser;
	}

	public void setComUser(TcomUser comUser) {
		this.comUser = comUser;
	}

	@Column(nullable = true)
	@Length(max = 30)
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	@Column(nullable = true)
	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	@Column(nullable = true)
	public long getBeginData() {
		return beginData;
	}

	public void setBeginData(long beginData) {
		this.beginData = beginData;
	}

	@Column(nullable = true)
	public long getEndData() {
		return endData;
	}

	public void setEndData(long endData) {
		this.endData = endData;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	@Column(nullable = true)
	@Length(max = 20)
	public String getSkillLevel() {
		return skillLevel;
	}

	public void setSkillLevel(String skillLevel) {
		this.skillLevel = skillLevel;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	@Column(nullable = true)
	@Length(max = 20)
	public String getWorkingLife() {
		return workingLife;
	}

	public void setWorkingLife(String workingLife) {
		this.workingLife = workingLife;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	@Column(nullable = true)
	public String getWorkspace() {
		return workspace;
	}

	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}

	@Column(nullable = true)
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	public String getExpectSalary() {
		return expectSalary;
	}

	public void setExpectSalary(String expectSalary) {
		this.expectSalary = expectSalary;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	public String getExpectArea() {
		return expectArea;
	}

	public void setExpectArea(String expectArea) {
		this.expectArea = expectArea;
	}

	@IndexedEmbedded
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_workTypeId", referencedColumnName = "id")
	public TmajorType getWorkType() {
		return workType;
	}

	public void setWorkType(TmajorType workType) {
		this.workType = workType;
	}

	@IndexedEmbedded
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_majorTypeId", referencedColumnName = "id")
	public TmajorType getMajorType() {
		return majorType;
	}

	public void setMajorType(TmajorType majorType) {
		this.majorType = majorType;
	}

	@NotNull
	@Field(store = Store.YES, index = Index.TOKENIZED)
	public Integer getInfoType() {
		return infoType;
	}

	public void setInfoType(Integer infoType) {
		this.infoType = infoType;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	public long getEditDate() {
		return editDate;
	}

	public void setEditDate(long editDate) {
		this.editDate = editDate;
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public String getWorkWay() {
		return workWay;
	}

	public void setWorkWay(String workWay) {
		this.workWay = workWay;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		try {
			this.loginName = comUser.getLoginName();
		} catch (Exception e) {
			this.loginName = loginName;
		}
	}

	@Field(store = Store.YES, index = Index.TOKENIZED)
	public String getJobPost() {
		try {
			return jobPost = workType.getName();
		} catch (Exception e) {
			return this.jobPost;
		}
	}

	public void setJobPost(String jobPost) {
		try {
			jobPost=workType.getName();
		} catch (Exception e) {
			this.jobPost = jobPost;
		}
	}

}
