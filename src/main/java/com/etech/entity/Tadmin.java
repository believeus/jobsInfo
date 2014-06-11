package com.etech.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Tadmin extends TbaseUser {
	
	private static final long serialVersionUID = -7392366453218801368L;
	// 管理员描述
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
