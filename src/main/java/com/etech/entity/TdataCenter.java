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
	private int top;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
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
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
	
}
