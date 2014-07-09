package com.catcm.skill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcm.skill.dao.InfoTypeDao;
import com.catcm.skill.pojo.InfoType;
import com.catcm.skill.service.WebMenuService;
import com.catcm.skill.util.ApplicationConstants;
@Service("webMenuServiceImpl")
public class WebMenuServiceImpl implements WebMenuService {
	
	@Autowired
	private InfoTypeDao infoTypeDao;
	
	public int queryResultsCount() {
		
		return infoTypeDao.getAllInfoNum();
	}

	public List<InfoType> queryAllByPage(int from, int length) {
		
		return infoTypeDao.queryByPage(from, length);
	}

	public InfoTypeDao getInfoTypeDao() {
		return infoTypeDao;
	}

	public void setInfoTypeDao(InfoTypeDao infoTypeDao) {
		this.infoTypeDao = infoTypeDao;
	}

	public void saveMenu(InfoType menu) {
		this.infoTypeDao.saveOrUpdate(menu);
		
	}

	public void delMenu(InfoType menu) {
		this.infoTypeDao.delete(menu);
	}

	public void setNoDisplay(InfoType menu) {
		menu.setFlag(ApplicationConstants.FLAG_NORMAL);
		this.infoTypeDao.updateFlagById(menu.getId(), menu.getFlag());
	}

	public void setDisplay(InfoType menu) {
		menu.setFlag(ApplicationConstants.FLAG_DISPLAY);
		this.infoTypeDao.updateFlagById(menu.getId(), menu.getFlag());
	}

	
}
