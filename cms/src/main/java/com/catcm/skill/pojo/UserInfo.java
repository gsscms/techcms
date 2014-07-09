package com.catcm.skill.pojo;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String cardId;
	private String weekUnit;
	private String gender;
	private String phone;
	private String account;
	private String password;
	private Integer age;
	private String wordAddress;
	private String userType;

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** full constructor */
	public UserInfo(String name, String cardId, String weekUnit, String gender,
			String phone, String account, String password, Integer age,
			String wordAddress, String userType) {
		this.name = name;
		this.cardId = cardId;
		this.weekUnit = weekUnit;
		this.gender = gender;
		this.phone = phone;
		this.account = account;
		this.password = password;
		this.age = age;
		this.wordAddress = wordAddress;
		this.userType = userType;
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

	public String getCardId() {
		return this.cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getWeekUnit() {
		return this.weekUnit;
	}

	public void setWeekUnit(String weekUnit) {
		this.weekUnit = weekUnit;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAge() {
		return this.age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getWordAddress() {
		return this.wordAddress;
	}

	public void setWordAddress(String wordAddress) {
		this.wordAddress = wordAddress;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}