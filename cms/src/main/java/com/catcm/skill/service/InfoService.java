package com.catcm.skill.service;

import java.util.List;

import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.InfoType;
import com.catcm.skill.vo.Page;


public interface InfoService {
	public Page getAllInfoPaging(int pageNum, int pageSize);
	
	public int queryResultsCount();
	
	public int queryResultsCount(Info info);
	
	
	public int queryResultsCount(String type);
	public List<Info> queryByPage(String type);
	public List<Info> queryByPage(int from,int length);
	public List<Info> queryByPage(int from,int length,String type);
	public List<Info> queryPageByInfo(int from,int length,Info info);
	
	public List<InfoType> getAllInfoTypeList();
	
	public void publicInfo(Info info);
	
	public Info getPlateInfo();
	
	public void savePlateInfo(Info info);
	
	public List<Dict> getDictByType(String Type);
	
	public void saveInfo(Info info);
	
	public void setDisplay(String id);
	
	public void setNODisplay(String id);
	
	public Info getTopicHomeDisplay();
	
	public List<Info> getTrainByDictType(String dictId);
	
	public void deletInfo(String infoId);
	
	public Info getInfoById(String id);
	
}
