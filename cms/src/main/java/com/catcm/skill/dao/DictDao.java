package com.catcm.skill.dao;

import java.util.List;

import com.catcm.skill.pojo.Dict;

public interface DictDao extends IHibernateDao {
	public List<Dict> getDictListByType(String type);
	
	public int getDictCountByType(String type);
	
	public void setFlagByIds(List<String> ids,int flag);
	
	public void setFlagByType(int flag,String code);
	
	public List<Dict> getFlagByFlagAndType(int flag,String type);
	
	public void setPathById(String id,String path);
	
	public List<Dict> getDictList(int from, int to,Dict dict);
	
	public int getCount(Dict dict);
	
	public void delDict(String id);
}
