package com.catcm.skill.service;

import java.util.List;

import com.catcm.skill.pojo.Dict;

import com.catcm.skill.pojo.TechnicalData;

public interface TechnicalDataService {
	
	public List<TechnicalData> getAllChecked();
	
	public List<Dict> getSkillTypeList();
	
	public int getSkillTypeCount();
	
	public List<Dict> getSkillSourceList();
	
	public List<Dict> getSkillDiseaseList();
	
	public void registTec(TechnicalData tec);
	
	public List<TechnicalData> queryByPage(int from, int length);
	
	public List<TechnicalData> queryByPageByTech(int from, int length,TechnicalData tech);
	
	public int queryResultsCount();
	
	public int queryResultsCount(TechnicalData tech);
	
	public TechnicalData getTelById(String id);
	//审核通过
	public void doPass(TechnicalData tech);
	//审核不通过
	public void doNopass(TechnicalData tech);
	
	public void setDisplay(String id);
	
	public TechnicalData getDisplay();
	
	public List<TechnicalData> homeDisplaySkill();
	
	public void displaySkillType(List<String> id);
	
	public List<Dict> forDisplaySkillType();
	
	public List<TechnicalData> getDisplaySkill(String dictId);
	
	public void doSkillDisplay(TechnicalData tech);
	
	public void doBatchDisplay(List<String> ids);

}
