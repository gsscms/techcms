package com.catcm.skill.action;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.service.InfoService;
import com.catcm.skill.util.ApplicationConstants;
import com.catcm.skill.pojo.Dict;

@SuppressWarnings("serial")
public class TopicGridAction extends JqGridBaseAction<Info> {

	@Autowired
	private InfoService infoService;

	private List<Dict> dict;

	private String infoType;

	private Info info;


	private String infoId;
	
	private List<Info> infoList;
	
	
	public String getHomeDisplay(){
		info = infoService.getTopicHomeDisplay();
		return "getHomeDisplay";
	}

	public String setWebDisplay(){
		
		infoService.setDisplay(infoId);
		return "setWebDisplay";
	}
	
	public String editTopic(){
		info=infoService.getInfoById(infoId);
		return "editTopic";
	}
	
	public String topicDict() {
//		dict = infoService
//				.getDictByType(ApplicationConstants.DICT_TYPE_TOPIC);
		return "topicDict";
	}

	public String saveTopic() {
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_TOPIC);
		if ("".equals(info.getId())) {
			info.setId(null);
			info.setCreateTime(new Timestamp(new Date().getTime()));
			info.setUpdateTime(new Timestamp(new Date().getTime()));
			info.setFlag(ApplicationConstants.FLAG_NORMAL);
		}

		infoService.saveInfo(info);

		return "saveTopic";
	}

	public String initTopicList() {
		this.refreshGridModel();
		return "initTopicList";
	}

	@Override
	public int getResultSize() {
		return this.infoService
				.queryResultsCount(ApplicationConstants.INFO_TYPE_CODE_TOPIC);
	}

	@Override
	public List<Info> listResults(int from, int length) {
		List<Info> results = Collections.emptyList();

		results = this.infoService.queryByPage(from, length,
				ApplicationConstants.INFO_TYPE_CODE_TOPIC);

		return results;
	}

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public List<Dict> getDict() {
		return dict;
	}

	public void setDict(List<Dict> dict) {
		this.dict = dict;
	}

	public String getInfoType() {
		return infoType;
	}

	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}





	public String getInfoId() {
		return infoId;
	}


	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}

	public List<Info> getInfoList() {
		return infoList;
	}

	public void setInfoList(List<Info> infoList) {
		this.infoList = infoList;
	}

	
}
