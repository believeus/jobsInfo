package com.etech.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 权限
 * */
@Entity
@Table(name="Tauthority")
public class Tauthority extends TbaseEntity {
	private static final long serialVersionUID = -6401764655592096058L;
	private String authName;
	
	private Trole role;
	
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_roleId",referencedColumnName="id")
	public Trole getRole() {
		return role;
	}
	public void setRole(Trole role) {
		this.role = role;
	}
	
	
}
