package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * 类型
 * */
@Entity
@Table
public class TclassType extends TbaseEntity implements Serializable {

	private static final long serialVersionUID = 265386274128991391L;
	private String name;
	private int codeId;
	private int parent;
	
	/**类型描述*/
	@NotEmpty
	@Length(max = 25)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@NotEmpty
	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getCodeId() {
		return codeId;
	}
	
	@NotEmpty
	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}
	

}
