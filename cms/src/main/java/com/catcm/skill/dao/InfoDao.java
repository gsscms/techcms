package com.catcm.skill.dao;


import java.util.List;

import com.catcm.skill.vo.Page;
import com.catcm.skill.pojo.Info;

public interface InfoDao extends IHibernateDao {
	public Page getAllInfoPaging(int pageNum, int pageSize);
	public int getAllInfoNum();
	public int getAllInfoNum(String infoType);
	public List<Info> queryByPage(int from, int length);
	public List<Info> queryByPage(int from, int length,String infoType);
	public List<Info> getInfoListByType(String type);
	public void setInfoFlag(String id,int flag);
	public List<Info> getInfoByFlagAndType(int flag,String infoType);
	public List<Info> getInfoByType(String infoType);
	public List<Info> getInfoByTypeAndDict(String dictId,String infoType);
	public void deleteInfo(String id);
	public int getCountByInfo(Info info);
	public List<Info> getInfoPageByInfo(int from, int to,Info info);
}
