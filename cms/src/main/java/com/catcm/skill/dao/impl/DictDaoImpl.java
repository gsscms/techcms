package com.catcm.skill.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.catcm.skill.dao.DictDao;
import com.catcm.skill.pojo.Dict;
@Component("dictDao")
public class DictDaoImpl  extends HibernateDao implements DictDao{
	
	@SuppressWarnings("unchecked")
	public List<Dict> getDictListByType(String type) {
		String hql = "from Dict where type = ?";
		
		return (List<Dict>) this.getHibernateTemplate().find(hql, type);
	}

	public void setFlagByIds(List<String> ids, int flag) {
		String hql ="update Dict set flag =? where id = ?";
		for(String id:ids){
			this.getHibernateTemplate().bulkUpdate(hql,flag,id);
		}
		
	}

	public void setFlagByType(int flag,String code) {
		String hql ="update Dict set flag =? where type=?";
		this.getHibernateTemplate().bulkUpdate(hql,flag,code);
		
	}

	public List<Dict> getFlagByFlagAndType(int flag, String type) {
		String hql="from Dict where flag=? and type=?";
		return (List<Dict>) this.getHibernateTemplate().find(hql, flag,type);
	}

	public int getDictCountByType(String type) {
		String hql ="select count(*)"
				+ " from Dict where type = '"+type+"'";
		try {
			return getTotalCount(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public void setPathById(String id, String path) {
		String hql="update Dict set path=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql, path,id);
	}

	@SuppressWarnings("unchecked")
	public List<Dict> getDictList(int from, int to,Dict dict) {
		String hql="from Dict where 1=1 ";
		List<Object> list = new ArrayList<Object>();
	    if(dict.getValue()!=null&&!"".equals(dict.getValue())){
	    	hql+=" and value like";
	    	list.add("%"+dict.getValue()+"%");
	    }
	    if(dict.getType()!=null&&!"".equals(dict.getType())){
	    	hql +=" and type = ?";
	    	list.add(dict.getType());
	    }
	    return this.select(hql, list.toArray(), from, to);
	}

	public int getCount(Dict dict) {
		String hql= "select count(*) from Dict where 1=1";
		List<Object> list = new ArrayList<Object>();
	    if(dict.getValue()!=null&&!"".equals(dict.getValue())){
	    	hql+=" and value like";
	    	list.add("%"+dict.getValue()+"%");
	    }
	    if(dict.getType()!=null&&!"".equals(dict.getType())){
	    	hql +=" and type = ?";
	    	list.add(dict.getType());
	    }
		
		return this.getCount(hql, list.toArray());
	}

	@Override
	public void delDict(String id) {
		String hql = "delete Dict where id=?";
		this.getHibernateTemplate().bulkUpdate(hql, id);
		
	}

}
