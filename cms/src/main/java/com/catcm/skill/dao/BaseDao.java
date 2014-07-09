package com.catcm.skill.dao;

import java.util.List;

public interface BaseDao {
	public void create(Object obj);
	public void update(Object obj);
	public void remove(Object obj);
	public Object getById(Object obj, String id);
	public List getListByHQL(String hql);
	public void saveOrUpdate(Object obj);

}
