package com.catcm.skill.dao.impl;
import org.springframework.stereotype.Component;
import com.catcm.skill.dao.UserInfoDao;
import com.catcm.skill.pojo.UserInfo;
@Component("userInfoDao")
public class UserInfoDaoImpl extends HibernateDao implements UserInfoDao{
	public int getNumByCardId(String cardId) {
		String hql = "select count(*) from UserInfo where cardId = ?";
		try {
			int num = this.getCount(hql,new String[]{cardId});
			return num;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getNumByPhone(String phone) {
		String hql = "select count(*) from UserInfo where phone = ?";
		try {
			int num = this.getCount(hql,new String[]{phone});
			return num;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int getNumByAccount(String account) {
		String hql = "select count(*) from UserInfo where account = ?";
		try {
			int num = this.getCount(hql,new String[]{account});
			return num;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
