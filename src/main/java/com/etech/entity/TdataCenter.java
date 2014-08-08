package com.etech.entity;

import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.wltea.analyzer.lucene.IKAnalyzer;

@Entity
@Table
@Indexed(index = "com.etech.entity.TdataCenter")  
public class TdataCenter extends TbaseEntity implements Cloneable{
	private static final long serialVersionUID = 346855620951185851L;
	private String title;
	private String author;
	private int type;
	private String imgpath;
	private String content;
	private long createTime;
	private long editTime;
	private int clickNum;
	// 0:所有效率等级 1:法律 
	// 2：行政法规 3：地方法规
	// 4: 规章 5:规范性文件 6:省厅文件
	private int powerLevel;
	// 效率属性 0:全部 1:有效 2:失效
	private int powerProperty;
	// 1 置顶 0：取消之地
	private int top;
	private String alink;
	
	/** 图片宽 */
	private Integer width;
	/** 图片高 */
	private Integer height; 
	
	@Field(store=Store.YES,index = Index.TOKENIZED, analyzer = @Analyzer(impl =IKAnalyzer.class ))
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Field(store=Store.YES,index = Index.UN_TOKENIZED)
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	@Lob
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	@Lob
	@Field(store=Store.YES,index = Index.TOKENIZED, analyzer = @Analyzer(impl =IKAnalyzer.class ))
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public String getAlink() {
		return alink;
	}
	public void setAlink(String alink) {
		this.alink = alink;
	}
	
	public int getClickNum() {
		return clickNum;
	}
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}
	@Field(store=Store.YES,index = Index.UN_TOKENIZED)
	public int getPowerLevel() {
		return powerLevel;
	}
	public void setPowerLevel(int powerLevel) {
		this.powerLevel = powerLevel;
	}
	@Field(store=Store.YES,index = Index.UN_TOKENIZED)
	public int getPowerProperty() {
		return powerProperty;
	}
	public void setPowerProperty(int powerProperty) {
		this.powerProperty = powerProperty;
	}
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	public Integer getWidth() {
		return width;
	}
	public void setWidth(Integer width) {
		this.width = width;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	
}
