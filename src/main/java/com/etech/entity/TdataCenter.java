package com.etech.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class TdataCenter extends TbaseEntity{
	private static final long serialVersionUID = 346855620951185851L;
	private String title;
	private String author;
	private int type;
	private String imgpath;
	private String content;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
