package com.etech.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/** 企业存放图片和视频的路径 */
@Entity
@Table
public class TentImgVedio extends TbaseEntity {
	public static final int typeImg = 0;
	public static final int typeVideo = 1;
	public static final int typeMap = 2;
	private static final long serialVersionUID = -107563856421078437L;
	private String url;
	private String descption;
	private int type;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescption() {
		return descption;
	}

	public void setDescption(String descption) {
		this.descption = descption;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public static int getTypeimg() {
		return typeImg;
	}

	public static int getTypevideo() {
		return typeVideo;
	}

	public static int getTypemap() {
		return typeMap;
	}

}
