package com.catcm.skill.service;

import java.util.List;


import com.catcm.skill.pojo.InfoType;

public interface WebMenuService {
	public int queryResultsCount();
	public List<InfoType> queryAllByPage(int from,int length);
	public void saveMenu(InfoType menu);
	public void delMenu(InfoType menu);
	public void setNoDisplay(InfoType menu);
	public void setDisplay(InfoType menu);
}
