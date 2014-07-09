package com.catcm.skill.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.catcm.skill.dao.InfoTypeDao;
import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.InfoType;

@Component("infoTypeDao")
public class InfoTypeDaoImpl  extends HibernateDao implements InfoTypeDao{

	@SuppressWarnings("unchecked")
	public List<InfoType> getInfoTypeList() {
		String hql = " from InfoType";
		return (List<InfoType>) this.getHibernateTemplate().find(hql);
	}

	public int getAllInfoNum() {
		try {
			String hql ="select count(*)" + " from InfoType";
			return getTotalCount(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@SuppressWarnings("unchecked")
	public List<InfoType> queryByPage(int from, int length) {
		String hql =" from InfoType ";
		return   select(hql, null, from, length);
	}

	public void updateFlagById(String id, int flag) {
		String hql ="update InfoType set flag=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql, flag,id);
	}

	
}
