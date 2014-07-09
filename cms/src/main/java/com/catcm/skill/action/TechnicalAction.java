package com.catcm.skill.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.TechnicalData;
import com.catcm.skill.service.TechnicalDataService;
import com.catcm.skill.vo.Page;

public class TechnicalAction extends BaseAction{
	
	@Autowired
	private TechnicalDataService techService;
	
	private TechnicalData tel;
	
	private List<Dict> skillTypeList;
	
	private List<Dict> skillSourceList;
	
	private List<Dict> diseaseList;
	
	private TechnicalData tec;
	
	private Page telPage;
	
	
	private List<TechnicalData> tecList;
	
	public String registTec(){
		techService.registTec(tec);
		return "registTecSuccess";
	}
	
	
	
	public String initDiseaseList(){
		diseaseList = techService.getSkillDiseaseList();
		return "initDiseaseList";
	}

	public String initSkillSource(){
		skillSourceList = techService.getSkillSourceList();
		return "initSkillSource";
	}
	
	public String initSkillType(){
		skillTypeList = techService.getSkillTypeList();
		return "initSkillType";
	}
	
	public TechnicalData getTel() {
		return tel;
	}

	public void setTel(TechnicalData tel) {
		this.tel = tel;
	}

	public TechnicalDataService getTechService() {
		return techService;
	}

	public void setTechService(TechnicalDataService techService) {
		this.techService = techService;
	}

	public List<Dict> getSkillTypeList() {
		return skillTypeList;
	}

	public void setSkillTypeList(List<Dict> skillTypeList) {
		this.skillTypeList = skillTypeList;
	}

	public List<Dict> getSkillSourceList() {
		return skillSourceList;
	}

	public void setSkillSourceList(List<Dict> skillSourceList) {
		this.skillSourceList = skillSourceList;
	}

	public List<Dict> getDiseaseList() {
		return diseaseList;
	}

	public void setDiseaseList(List<Dict> diseaseList) {
		this.diseaseList = diseaseList;
	}

	public TechnicalData getTec() {
		return tec;
	}

	public void setTec(TechnicalData tec) {
		this.tec = tec;
	}



	public Page getTelPage() {
		return telPage;
	}



	public void setTelPage(Page telPage) {
		this.telPage = telPage;
	}



	public List<TechnicalData> getTecList() {
		return tecList;
	}



	public void setTecList(List<TechnicalData> tecList) {
		this.tecList = tecList;
	}
	
	
}
