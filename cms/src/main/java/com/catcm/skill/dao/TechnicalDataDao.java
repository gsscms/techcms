package com.catcm.skill.dao;

import java.util.List;

import com.catcm.skill.pojo.TechnicalData;

public interface TechnicalDataDao extends  IHibernateDao{
	
	public List<TechnicalData> queryByPage(int from, int length);
	
	public int getAllInfoNum();
	
	public void doCheck(TechnicalData tel);
	
	public void updateFlag(String id,int flag);
	
	public List<TechnicalData> getTechListByFlag(int flag);
	
	public List<TechnicalData> getDisplaySkill(String dictId,int flag);
	
	public void updateDisplayFlag(String id,int flag);
	
	public List<TechnicalData> getInfoPageByTech(int from,int to,TechnicalData tech);
	
	public int getCountByTech(TechnicalData tech);
	
	public void batchUpdateFlagByIds(List<String> ids,int flag);
	
	public void BatchUpdateFlag(int flag,String Status);
	
	public List<TechnicalData> getInfoPageByTech(TechnicalData tech);
}
