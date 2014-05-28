package com.etech.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 普通用户的信息
 */
@Entity
@Table
public class TcomInfo extends TbaseEntity implements Serializable{
	private static final long serialVersionUID = -948982752176471588L;
	
}
