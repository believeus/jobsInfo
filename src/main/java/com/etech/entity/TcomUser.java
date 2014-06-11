package com.etech.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.Length;


/**
 * @author wuqiwei
 * Data:2014-05-23
 * 一般用户
 * */
@Entity
@Table
public class TcomUser extends TbaseUser implements Serializable{

	private static final long serialVersionUID = 5791526164788361621L;
	
	/**二进制头像*/
	private String imgHead;
	/**性别*/
	private String sex;
	/**身高*/
	private String height;	
	/** 用户民族 */
	private String nation;
	/** 教育程度 */
	private String eduLevel;
	/** 政治面貌 */
	private String polity;
	/** 户口性质 */
	private String accounts;
	/**原工作单位*/
	private String workspace;
	/**就业失业号*/
	private String jobId;
	/**是否是独身子女，1为是，0为否*/
	private String singleChild;
	/**特长*/
	private String strongPoint;
	/**视力*/
	private String eyesight;
	/**是否是二女户，1为是，0为否*/
	private String twoGirl;
	/**婚姻状况*/
	private String marriage;
	/**健康状况*/
	private String health;
	/**年龄*/
	private String age;
	/**是否享受免费职业培训，1为是，0为否*/
	private String freeTrain;
	/**是否享受免费职业介绍，1为是，0为否*/
	private String freeIntro;
	/**用户信息中心*/
	private List<TcomInfo> comInfo;

	
	/** 教育程度 */
	@Length(max = 10)
	@Column(nullable = true)
	public String getEduLevel() {
		return eduLevel;
	}
	/** 教育程度 */
	public void setEduLevel(String eduLevel) {
		this.eduLevel = eduLevel;
	}
	
	@Length(max =5)
	@Column(nullable = true)
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	@Length(max =5)
	@Column(nullable = true)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Length(max =3)
	@Column(nullable = true)
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(max =2)
	@Column(nullable = true)
	public String getFreeTrain() {
		return freeTrain;
	}
	public void setFreeTrain(String freeTrain) {
		this.freeTrain = freeTrain;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getFreeIntro() {
		return freeIntro;
	}
	public void setFreeIntro(String freeIntro) {
		this.freeIntro = freeIntro;
	}
   
	
	public String getImgHead() {
		return imgHead;
	}
	public void setImgHead(String imgHead) {
		this.imgHead = imgHead;
	}
	@Length(max =10)
	@Column(nullable = true)
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	@Length(max =4)
	@Column(nullable = true)
	public String getPolity() {
		return polity;
	}
	public void setPolity(String polity) {
		this.polity = polity;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getAccounts() {
		return accounts;
	}
	public void setAccounts(String accounts) {
		this.accounts = accounts;
	}
	@Length(max =30)
	@Column(nullable = true)
	public String getWorkspace() {
		return workspace;
	}
	public void setWorkspace(String workspace) {
		this.workspace = workspace;
	}
	
	@Length(max =30)
	@Column(nullable = true)
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getSingleChild() {
		return singleChild;
	}
	public void setSingleChild(String singleChild) {
		this.singleChild = singleChild;
	}
	@Length(max =20)
	@Column(nullable = true)
	public String getStrongPoint() {
		return strongPoint;
	}
	public void setStrongPoint(String strongPoint) {
		this.strongPoint = strongPoint;
	}
	@Length(max =10)
	@Column(nullable = true)
	public String getEyesight() {
		return eyesight;
	}
	public void setEyesight(String eyesight) {
		this.eyesight = eyesight;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getTwoGirl() {
		return twoGirl;
	}
	public void setTwoGirl(String twoGirl) {
		this.twoGirl = twoGirl;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	@Length(max =2)
	@Column(nullable = true)
	public String getHealth() {
		return health;
	}
	public void setHealth(String health) {
		this.health = health;
	}
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="comUser")
	public List<TcomInfo> getComInfo() {
		return comInfo;
	}
	public void setComInfo(List<TcomInfo> comInfo) {
		this.comInfo = comInfo;
	}
}
