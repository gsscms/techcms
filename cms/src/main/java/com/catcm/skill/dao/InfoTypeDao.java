package com.catcm.skill.dao;

import java.util.List;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.InfoType;

public interface InfoTypeDao extends IHibernateDao{
	public List<InfoType> getInfoTypeList();
	public int getAllInfoNum();
	public List<InfoType> queryByPage(int from, int length);
	public void updateFlagById(String id,int Flag);
}
