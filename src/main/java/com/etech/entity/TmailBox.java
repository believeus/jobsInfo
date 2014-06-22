package com.etech.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.mysql.jdbc.log.Log;

@Entity
@Table(name="TmailBox")
public class TmailBox extends TbaseEntity implements Serializable{

	private static final long serialVersionUID = 2193036765010471780L;
	private String username;
	// 性别
	private String sex;
	// 电话号码
	private String phoneNum;
	// 邮箱
	private String email;
	//省
	private String province;
	// 市
	private String city;
	// 县
	private String county;
	// 补充地址
	private String supplyAddress;
	//职业
	private String job;
	// 身份证号
	private String idcard;
	// 固定电话
	private String fixPhone;
	// 标题
	private String title;
	//发生地方
	private String happenArea;
	// 问题类型
	private String questionType;
	// 来信人数
	private String letterNumber;
	// 内容
	private String content;
	// 上传文件
	private String uploadFile;
	// 上传附件
	private String uploadAttach;
	// 0:不同意 1 同意
	private String agree;
	// 0:需要审核 1：审核通过
	private String status;
	private long createTime;
	private long editTime;
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getSupplyAddress() {
		return supplyAddress;
	}
	public void setSupplyAddress(String supplyAddress) {
		this.supplyAddress = supplyAddress;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getFixPhone() {
		return fixPhone;
	}
	public void setFixPhone(String fixPhone) {
		this.fixPhone = fixPhone;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHappenArea() {
		return happenArea;
	}
	public void setHappenArea(String happenArea) {
		this.happenArea = happenArea;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getLetterNumber() {
		return letterNumber;
	}
	public void setLetterNumber(String letterNumber) {
		this.letterNumber = letterNumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadAttach() {
		return uploadAttach;
	}
	public void setUploadAttach(String uploadAttach) {
		this.uploadAttach = uploadAttach;
	}
	
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}
	public long getEditTime() {
		return editTime;
	}
	public void setEditTime(long editTime) {
		this.editTime = editTime;
	}
	
	
	
}
