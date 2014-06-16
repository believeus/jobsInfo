package com.etech.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Store;

@MappedSuperclass
public class TbaseEntity implements Serializable {
	private static final long serialVersionUID = -4017940130624140047L;
	private int id;
	@Id
	// MySQL/SQLServer: @GeneratedValue(strategy = GenerationType.AUTO)
	// Oracle: @GeneratedValue(strategy = GenerationType.AUTO, generator = "sequenceGenerator")
	@GeneratedValue(strategy = GenerationType.AUTO)
	@DocumentId
	@Field(store=Store.YES)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
