package com.catcm.skill.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcm.skill.dao.DictDao;
import com.catcm.skill.dao.TechnicalDataDao;
import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.TechnicalData;
import com.catcm.skill.service.TechnicalDataService;
import com.catcm.skill.util.ApplicationConstants;
@Service("techService")
public class TechnicalServiceImpl implements TechnicalDataService {
    @Autowired
	private TechnicalDataDao techDao;
    
    @Autowired
    private DictDao dictDao;

	public TechnicalDataDao getTechDao() {
		return techDao;
	}

	public void setTechDao(TechnicalDataDao techDao) {
		this.techDao = techDao;
	}

	public List<Dict> getSkillTypeList() {
		
		return dictDao.getDictListByType(ApplicationConstants.DICT_TYPE_SKILL_TYPE);
	}

	public List<Dict> getSkillSourceList() {
	
		return dictDao.getDictListByType(ApplicationConstants.DICT_TYPE_SKILL_SOURCE);
	}

	public List<Dict> getSkillDiseaseList() {
		
		return dictDao.getDictListByType(ApplicationConstants.DICT_TYPE_DISEASE);
	}

	public DictDao getDictDao() {
		return dictDao;
	}

	public void setDictDao(DictDao dictDao) {
		this.dictDao = dictDao;
	}

	public void registTec(TechnicalData tec) {
		tec.setFlag(ApplicationConstants.FLAG_NORMAL);
		tec.setStatus(ApplicationConstants.STATUS_NON_CHECKED);
		tec.setCreateTime(new Timestamp((new Date()).getTime()));
		this.techDao.insert(tec);
	}

	public List<TechnicalData> queryByPage(int from, int length) {
		
		return techDao.queryByPage(from, length);
	}

	public int queryResultsCount() {
		
		return techDao.getAllInfoNum();
	}

	public TechnicalData getTelById(String id) {
		
		return (TechnicalData) techDao.get(TechnicalData.class, id);
	}

	public void doPass(TechnicalData tech) {
		tech.setStatus(ApplicationConstants.STATUS_CHECKED);
		techDao.doCheck(tech);
	}

	public void doNopass(TechnicalData tech) {
		tech.setStatus(ApplicationConstants.STATUS_FAILD_CHECKED);
		techDao.doCheck(tech);
	}

	public void setDisplay(String id) {
		techDao.updateFlag(id, ApplicationConstants.FLAG_DISPLAY);
	}

	public TechnicalData getDisplay() {
		List<TechnicalData> list = techDao.getTechListByFlag(ApplicationConstants.FLAG_DISPLAY);
		
	    return list!=null&&list.size()>0?list.get(0):null;
	}

	public List<TechnicalData> homeDisplaySkill() {
		List<TechnicalData> list = techDao.getTechListByFlag(ApplicationConstants.FLAG_DISPLAY);
		return list;
	}

	public void displaySkillType(List<String> id) {
		dictDao.setFlagByType(ApplicationConstants.FLAG_NORMAL, ApplicationConstants.DICT_TYPE_SKILL_TYPE);
		dictDao.setFlagByIds(id, ApplicationConstants.FLAG_DISPLAY);
	}

	public List<Dict> forDisplaySkillType() {
		return dictDao.getFlagByFlagAndType(ApplicationConstants.FLAG_DISPLAY, ApplicationConstants.DICT_TYPE_SKILL_TYPE);
	}

	public int getSkillTypeCount() {
	
		return dictDao.getDictCountByType(ApplicationConstants.DICT_TYPE_SKILL_TYPE);
	}

	public List<TechnicalData> getDisplaySkill(String dictId) {
		
		return techDao.getDisplaySkill(dictId, ApplicationConstants.DISPLAY_FLAG);
	}

	public void doSkillDisplay(TechnicalData tech) {
		tech.setDisplay(ApplicationConstants.DISPLAY_FLAG);
		techDao.updateDisplayFlag(tech.getId(),tech.getDisplay());
		
	}

	public List<TechnicalData> queryByPageByTech(int from, int length,
			TechnicalData tech) {
		return techDao.getInfoPageByTech(from, from+length, tech);
	}

	public int queryResultsCount(TechnicalData tech) {
		return techDao.getCountByTech(tech);
	}

	public void doBatchDisplay(List<String> ids) {
		techDao.BatchUpdateFlag(ApplicationConstants.FLAG_NORMAL, ApplicationConstants.STATUS_CHECKED);
		techDao.batchUpdateFlagByIds(ids, ApplicationConstants.FLAG_DISPLAY);
		
	}

	@Override
	public List<TechnicalData> getAllChecked() {
		TechnicalData tech=new TechnicalData();
		tech.setStatus(ApplicationConstants.STATUS_CHECKED);
		
		return techDao.getInfoPageByTech(tech);
	}

	
	
	
}
