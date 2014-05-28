package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * 用户拥有技能的类型
 * */
@Entity
@Table
public class TmajorType extends TbaseEntity implements Serializable {

	private static final long serialVersionUID = 265386274128991391L;
	/**专业或工种名*/
	private String name;
	/**专业或工种编码*/
	private int codeId;
	/**专业或工种属于哪个子类*/
	private int parent;
	
	/**专业或工种名*/
	@NotEmpty
	@Length(max = 25)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public int getCodeId() {
		return codeId;
	}
	
	@NotEmpty
	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}
	
	@NotEmpty
	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}
	
	
}
