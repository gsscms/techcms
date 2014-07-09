package com.catcm.skill.pojo;

import java.sql.Timestamp;

/**
 * Info entity. @author MyEclipse Persistence Tools
 */

public class Info implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String content;
	private String title;
	private Integer flag;
	private String typeCode;
	private Timestamp createTime;
	private Timestamp updateTime;
	private String createUser;
	private String updateUser;
	private String typeName;
	private String dictCode;
	private String dictName;

	// Constructors

	/** default constructor */
	public Info() {
	}



	public Info(String id, String content, String title, Integer flag,
			String typeCode, Timestamp createTime, Timestamp updateTime,
			String createUser, String updateUser, String typeName,
			String dictCode) {
		super();
		this.id = id;
		this.content = content;
		this.title = title;
		this.flag = flag;
		this.typeCode = typeCode;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.createUser = createUser;
		this.updateUser = updateUser;
		this.typeName = typeName;
		this.dictCode = dictCode;
	}



	public Info(String id, String content, String title, 
			String typeCode, 
			String createUser, String updateUser, String typeName) {
		super();
		this.id = id;
		this.content = content;
		this.title = title;
		//this.flag = flag;
		this.typeCode = typeCode;
	
		this.createUser = createUser;
		this.updateUser = updateUser;
		this.typeName = typeName;
	}



	// Property accessors

	public Info(String id, String content, String title, Integer flag,
			String typeCode, Timestamp createTime, Timestamp updateTime,
			String createUser, String updateUser, String typeName,
			String dictCode, String dictName) {
		super();
		this.id = id;
		this.content = content;
		this.title = title;
		this.flag = flag;
		this.typeCode = typeCode;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.createUser = createUser;
		this.updateUser = updateUser;
		this.typeName = typeName;
		this.dictCode = dictCode;
		this.dictName = dictName;
	}



	public String getTypeName() {
		return typeName;
	}



	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}



	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public String getTypeCode() {
		return this.typeCode;
	}

	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}

	public Timestamp getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getUpdateUser() {
		return this.updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}



	public String getDictCode() {
		return dictCode;
	}



	public void setDictCode(String dictCode) {
		this.dictCode = dictCode;
	}



	public String getDictName() {
		return dictName;
	}



	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	
}