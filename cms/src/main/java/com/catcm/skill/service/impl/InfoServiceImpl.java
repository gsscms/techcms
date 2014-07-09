package com.catcm.skill.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;














import com.catcm.skill.dao.DictDao;
import com.catcm.skill.dao.InfoDao;
import com.catcm.skill.dao.InfoTypeDao;
import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.InfoType;
import com.catcm.skill.service.InfoService;
import com.catcm.skill.util.ApplicationConstants;
import com.catcm.skill.vo.Page;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	@Autowired
	private InfoDao infoDao;
	
	@Autowired
	private InfoTypeDao infoTypeDao;
	
	@Autowired
	private DictDao dictDao;

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public Page getAllInfoPaging(int pageNum, int pageSize) {
		
		return this.infoDao.getAllInfoPaging(pageNum, pageSize);
	}

	public int queryResultsCount() {
		
		return this.infoDao.getAllInfoNum();
	}

	public List<Info> queryByPage(int from, int length) {

		return (List<Info>) this.infoDao.queryByPage(from, length);
	}

	public List<InfoType> getAllInfoTypeList() {
		
		return infoTypeDao.getInfoTypeList();
	}

	public void publicInfo(Info info) {		
		infoTypeDao.insert(info);		
	}

	public Info getPlateInfo() {
		List<Info> infoList = infoDao.getInfoListByType(ApplicationConstants.INFO_TYPE_CODE_PLATFORM);
	
		return infoList==null?new Info():
			(infoList.size()>0?infoList.get(0):new Info());
	}

	public void savePlateInfo(Info info) {
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_PLATFORM);
		infoDao.saveOrUpdate(info);
	}


	public int queryResultsCount(String type) {
		// TODO Auto-generated method stub
		return infoDao.getAllInfoNum(type);
	}

	public List<Info> queryByPage(int from, int length, String type) {
		// TODO Auto-generated method stub
		return infoDao.queryByPage(from, length, type);
	}

	public List<Dict> getDictByType(String Type) {
		
		return dictDao.getDictListByType(Type);
	}

	public void saveInfo(Info info) {
		if("".equals(info.getId())||null==info.getId()){
			info.setId(null);
			info.setCreateTime(new Timestamp(new Date().getTime()));	
		}
		info.setUpdateTime(new Timestamp(new Date().getTime()));
		this.infoDao.saveOrUpdate(info);
	}

	public void setDisplay(String id) {
		infoDao.setInfoFlag(id, ApplicationConstants.FLAG_DISPLAY);		
	}

	public Info getTopicHomeDisplay() {
		List<Info> infos = infoDao.getInfoByFlagAndType(ApplicationConstants.FLAG_DISPLAY, ApplicationConstants.INFO_TYPE_CODE_TOPIC);
		return infos!=null&&infos.size()>0?infos.get(0):null;
	}

	public List<Info> queryByPage(String type) {
		return infoDao.getInfoByType(type);
	}

	public List<Info> getTrainByDictType(String dictId) {
		
		return infoDao.getInfoByTypeAndDict(dictId, ApplicationConstants.INFO_TYPE_CODE_COMMUNICATION_TRAIN);
	}

	public void deletInfo(String infoId) {
		infoDao.deleteInfo(infoId);
	}

	public Info getInfoById(String id) {
		return (Info) infoDao.get(Info.class, id);
	}

	public int queryResultsCount(Info info) {
		
		return infoDao.getCountByInfo(info);
	}

	public List<Info> queryPageByInfo(int from, int length, Info info) {
		
		return infoDao.getInfoPageByInfo(from, from+length, info);
	}

	public void setNODisplay(String id) {
		infoDao.setInfoFlag(id, ApplicationConstants.FLAG_NORMAL);	
		
	}

	
	
}
