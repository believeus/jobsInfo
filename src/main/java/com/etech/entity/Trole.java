package com.etech.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	
	/**角色拥有哪些权限*/
	
	private Set<Tauthority> authorities=new HashSet<Tauthority>();
	
	/**该角色属于哪个用户*/
	
	private TbaseUser user;
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@OneToMany
	@JoinColumn(name="fk_authId",referencedColumnName="id")
	public Set<Tauthority> getAuthorities() {
		return authorities;
	}
	public void setAuthorities(Set<Tauthority> authorities) {
		this.authorities = authorities;
	}
	@ManyToOne
	@JoinColumn(name="fk_userId",referencedColumnName="id")
	public TbaseUser getUser() {
		return user;
	}
	public void setUser(TbaseUser user) {
		this.user = user;
	}
	
	
}
