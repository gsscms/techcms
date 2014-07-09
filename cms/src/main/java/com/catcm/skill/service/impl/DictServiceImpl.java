package com.catcm.skill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcm.skill.dao.DictDao;
import com.catcm.skill.pojo.Dict;
import com.catcm.skill.service.DictService;
@Service("dictService")
public class DictServiceImpl implements DictService {
	@Autowired
	private DictDao dictDao;
	public List<Dict> getDictList(Dict dict) {
		
		return null;
	}
	public DictDao getDictDao() {
		return dictDao;
	}
	public void setDictDao(DictDao dictDao) {
		this.dictDao = dictDao;
	}
	public List<Dict> getDictList(int from, int length, Dict dict) {
		// TODO Auto-generated method stub
		return dictDao.getDictList(from, from+length, dict);
	}
	public int getCount(Dict dict) {
		// TODO Auto-generated method stub
		return dictDao.getCount(dict);
	}
	@Override
	public void delDict(String id) {
		
		dictDao.delDict(id);
		
	}
	@Override
	public void saveDict(Dict dict) {
		dictDao.saveOrUpdate(dict);
	}
	
	

}
