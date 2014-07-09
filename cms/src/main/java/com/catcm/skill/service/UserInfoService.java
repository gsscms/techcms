package com.catcm.skill.service;

import com.catcm.skill.pojo.UserInfo;




public interface UserInfoService {
	/**
	 * 检测身份证号是否注册过
	 * @return
	 */
	public boolean validateCardId(String cardId);
	/**
	 * 检测手机是否注册过
	 * @return
	 */
	public boolean validatePhone(String phone);
	/**
	 * 检测account是否注册过
	 * @return
	 */
	public boolean validateAccount(String account);
	
	
	public void register(UserInfo user);
}
