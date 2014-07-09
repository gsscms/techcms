package com.catcm.skill.pojo;

/**
 * Dict entity. @author MyEclipse Persistence Tools
 */

public class Dict implements java.io.Serializable {

	// Fields

	private String id;
	private String type;
	private Integer flag;
	private String value;
	private String path;

	// Constructors

	/** default constructor */
	public Dict() {
	}

	/** full constructor */
	public Dict(String type, Integer flag, String value) {
		this.type = type;
		this.flag = flag;
		this.value = value;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public String getValue() {
		return this.value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	
	
}