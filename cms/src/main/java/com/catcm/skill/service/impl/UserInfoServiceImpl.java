package com.catcm.skill.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcm.skill.dao.UserInfoDao;
import com.catcm.skill.pojo.UserInfo;
import com.catcm.skill.service.UserInfoService;
@Service("userService")
public class UserInfoServiceImpl implements UserInfoService {
	@Autowired
	private UserInfoDao userInfoDao;

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public boolean validateCardId(String cardId) {
		int num = this.userInfoDao.getNumByCardId(cardId);
		return num>0?true:false;
	}

	public boolean validatePhone(String phone) {
		int num = this.userInfoDao.getNumByPhone(phone);
		return num>0?true:false;
	}

	public boolean validateAccount(String account) {
		int num = this.userInfoDao.getNumByAccount(account);
		return num>0?true:false;
	}

	public void register(UserInfo user) {
		
		this.userInfoDao.insert(user);
	}
	
}
