package com.etech.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 角色
 * */
@Entity
@Table(name="Trole")
public class Trole extends TbaseEntity{
	private static final long serialVersionUID = -4218776314250203152L;
	/**角色名*/
	private String roleName;
	//角色描述
	private String description;
	
	/**角色拥有哪些权限*/
	
	private Set<Tauthority> authorities=new HashSet<Tauthority>();
	
	/**该角色属于哪个用户*/
	
	private Set<TbaseUser> users=new HashSet<TbaseUser>();
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@OneToMany(cascade=CascadeType.ALL,mappedBy="role")
	public Set<Tauthority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Set<Tauthority> authorities) {
		this.authorities = authorities;
	}
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE },mappedBy="roles")
	public Set<TbaseUser> getUsers() {
		return users;
	}
	public void setUsers(Set<TbaseUser> users) {
		this.users = users;
	}
	
	
	
}
