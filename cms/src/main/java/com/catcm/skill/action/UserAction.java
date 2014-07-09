package com.catcm.skill.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.UserInfo;
import com.catcm.skill.service.UserInfoService;


public class UserAction extends BaseAction {
	
	@Autowired
	private UserInfoService userService;
	
	private UserInfo userInfo;
	
	private boolean isCardIdRegisted;
	
	private boolean isPhoneRegisted;
	
	private boolean isAccountRegisted;
	
	public String validateCardId(){
		isCardIdRegisted = userService.validateCardId(userInfo.getCardId());
		return "validateCardId";
	}
	public String validatePhone(){
		isPhoneRegisted = userService.validatePhone(userInfo.getPhone());
		return "validatePhone";
	}
	public String validateAccoount(){
		isAccountRegisted = userService.validateAccount(userInfo.getAccount());
		return "validateAccoount";
	}
	
	public String register(){
		this.userService.register(userInfo);
		return "registerSuccess";
	}

	public UserInfoService getUserService() {
		return userService;
	}

	public void setUserService(UserInfoService userService) {
		this.userService = userService;
	}
	
	
	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}


	public boolean isCardIdRegisted() {
		return isCardIdRegisted;
	}

	public void setCardIdRegisted(boolean isCardIdRegisted) {
		this.isCardIdRegisted = isCardIdRegisted;
	}

	public boolean isPhoneRegisted() {
		return isPhoneRegisted;
	}

	public void setPhoneRegisted(boolean isPhoneRegisted) {
		this.isPhoneRegisted = isPhoneRegisted;
	}

	public boolean isAccountRegisted() {
		return isAccountRegisted;
	}

	public void setAccountRegisted(boolean isAccountRegisted) {
		this.isAccountRegisted = isAccountRegisted;
	}


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
}
