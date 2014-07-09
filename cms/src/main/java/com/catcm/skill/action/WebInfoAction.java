package com.catcm.skill.action;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.service.InfoService;
import com.catcm.skill.util.ApplicationConstants;

public class WebInfoAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private InfoService infoService;
	
	private Info info;
	
	private List<Info> results;
	
	private String dictId;
	
	private String id;
	
	public String getInfoById(){
		info=infoService.getInfoById(id);
		return "getInfoById";
	}
	
	public String trainByDictType(){
		results = Collections.emptyList();
		info=new Info();
		info.setDictCode(dictId);
		results = infoService.queryPageByInfo(0, 9, info);

		return "trainByDictType";
	}
	
	
	public String lastTrain(){
		results = Collections.emptyList();
		info=new Info();
		info.setFlag(ApplicationConstants.FLAG_DISPLAY);
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_COMMUNICATION_TRAIN);
		results = infoService.queryPageByInfo(0, 9, info);
		return "lastTrain";
	}
	
	public String webInitTopic(){
		results = Collections.emptyList();

		results = this.infoService.queryByPage(ApplicationConstants.INFO_TYPE_CODE_TOPIC);
		return "webInitTopic";
	}
	
	public String webInitPublicInfo(){
		
		results = Collections.emptyList();

		results = this.infoService.queryByPage(ApplicationConstants.INFO_TYPE_CODE_PUBLIC_INFO);
		return "webInitPublicInfo";
	}
	
	public String webPlatform(){
		info = infoService.getPlateInfo();
		return "webPlatform";
	}

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

	public List<Info> getResults() {
		return results;
	}

	public void setResults(List<Info> results) {
		this.results = results;
	}


	public String getDictId() {
		return dictId;
	}


	public void setDictId(String dictId) {
		this.dictId = dictId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
