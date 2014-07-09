package com.catcm.skill.action;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.Info;
import com.catcm.skill.service.InfoService;
import com.catcm.skill.util.ApplicationConstants;

public class TrainGridAciton extends JqGridBaseAction<Info>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private InfoService infoService;
	
	private List<Dict> dict;
	
	private Info info;
	
	private String id;
	
	private String title;
	
	private String typeId;
	
	
	public String setHot(){
		infoService.setDisplay(id);
		return "setHot";
	}
	public String cencelHot(){
		infoService.setNODisplay(id);
		return "cencelHot";
	}
	
	public String editTrain(){
		info = infoService.getInfoById(id);
		return "editTrain";
	}
	
	public String saveTrain(){
	   
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_COMMUNICATION_TRAIN);
		info.setFlag(ApplicationConstants.FLAG_NORMAL);
		infoService.saveInfo(info);
		return "saveTrain";
	}
	
	public String trainDict(){
		dict = infoService.getDictByType(ApplicationConstants.DICT_TYPE_COMMUNICATION_TRAIN);
		return "trainDict";
	}
	public String initTrain(){
		this.refreshGridModel();
		return "initTrain";
	}
	
	@Override
	public int getResultSize() {
		if(info==null)
			info = new Info();
		
			info.setDictCode(typeId);
			info.setTitle(title);
			info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_COMMUNICATION_TRAIN);
	
		return this.infoService
				.queryResultsCount(info);
	}

	@Override
	public List<Info> listResults(int from, int length) {
		List<Info> results = Collections.emptyList();
		if(info==null)
			info = new Info();
		
			info.setDictCode(typeId);
			info.setTitle(title);
			info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_COMMUNICATION_TRAIN);
	
		results = this.infoService.queryPageByInfo(from, length,info);

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
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	
	
}
