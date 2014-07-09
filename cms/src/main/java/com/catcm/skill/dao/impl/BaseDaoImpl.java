package com.catcm.skill.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.catcm.skill.dao.BaseDao;

public class BaseDaoImpl extends HibernateDaoSupport implements BaseDao{

	public void create(Object obj) {	
		 this.getHibernateTemplate().save(obj);  
	}

	public void update(Object obj) {
		this.getHibernateTemplate().update(obj);
	}

	public void remove(Object obj) {
		this.getHibernateTemplate().delete(obj);
	}

	public Object getById(Object obj, String id) {
		return this.getHibernateTemplate().get(obj.getClass(), id);
	}

	public void saveOrUpdate(Object obj) {	
		this.getHibernateTemplate().saveOrUpdate(obj);
	}

	public List getListByHQL(String hql) {
	
		return  this.getHibernateTemplate().find(hql);
	}

	
}
