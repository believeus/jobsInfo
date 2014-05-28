package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/** 企业用户 */
/**
 * @author wuqiwei
 *
 */
@Entity
@Table
public class TentUser extends TbaseUser implements Serializable {
	
	private static final long serialVersionUID = 6293704345783832975L;
	
	/** 公司联系人 */
	private String contacts;
	/** 企业性质 */
	private String type;
	/**法人*/
	private String legalMan;
	/**是否审核通过 0:审核中 1:审核通过*/
	private String status;
	
	@Length(max=25)
	@Column(nullable=true)
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	@Length(max=25)
	@Column(nullable=true)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Length(max=25)
	@Column(nullable=true)
	public String getLegalMan() {
		return legalMan;
	}
	public void setLegalMan(String legalMan) {
		this.legalMan = legalMan;
	}
	@NotEmpty
	@Length(max=2)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
}
