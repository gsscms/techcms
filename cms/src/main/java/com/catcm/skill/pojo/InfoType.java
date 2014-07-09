package com.catcm.skill.pojo;

/**
 * InfoType entity. @author MyEclipse Persistence Tools
 */

public class InfoType implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String code;
	private Integer flag;
	private String url;
	private String remark;

	// Constructors

	/** default constructor */
	public InfoType() {
	}

	/** full constructor */
	public InfoType(String name, String code, Integer flag, String url,
			String desc) {
		this.name = name;
		this.code = code;
		this.flag = flag;
		this.url = url;
		this.remark = remark;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}