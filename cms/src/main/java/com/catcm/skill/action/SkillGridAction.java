package com.catcm.skill.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.TechnicalData;
import com.catcm.skill.service.TechnicalDataService;
import com.catcm.skill.util.ApplicationConstants;


public class SkillGridAction extends JqGridBaseAction<TechnicalData> {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private TechnicalDataService techService;
	
	private String techId;
	
	private TechnicalData tech;
	
	private String type;
	
	private String source;
	
	private String status;
	
	private String name;
	
	private String disease;
	
	private int homeflag;
	
	private int displayflag;
	
	private List<String> ids = new ArrayList<String>();
	
	public String doBatchDisplay(){
		techService.doBatchDisplay(ids);
		return "doBatchDisplay";
	}
	
	public String doSkillDisplay(){
		techService.doSkillDisplay(tech);
		return "doSkillDisplay";
	}
	
	public String setDisplay(){
		techService.setDisplay(tech.getId());
		return "setDisplay";
	}
	
	public String doPass(){
		techService.doPass(tech);
		return "doPass";
	}
	
	public String doNoPass(){
		techService.doPass(tech);
		return "doNoPass";
	}
	
	public String initSkill(){
		this.refreshGridModel();
		return "initSkill";
	}
	
	public String initDisplaySkill(){
		status=ApplicationConstants.STATUS_CHECKED;
		this.refreshGridModel();
		return "initDisplaySkill";
	}

	public String skillDetail(){
		tech = techService.getTelById(techId);
		return "skillDetail";
	}
	
	public String webSkillDetail(){
		tech = techService.getTelById(techId);
		return "webSkillDetail";
	}
	
	@Override
	public int getResultSize() {
		if(tech==null){
			tech = new TechnicalData();		
		}
		tech.setType(type);
		tech.setSource(source);
		tech.setName(name);
		tech.setDisease(disease);
		tech.setStatus(status);
		if(homeflag==1)
			tech.setFlag(ApplicationConstants.FLAG_DISPLAY);
		if(displayflag==1)
			tech.setDisplay(ApplicationConstants.DISPLAY_FLAG);
		return this.techService.queryResultsCount( tech);
	}

	@Override
	public List<TechnicalData> listResults(int from, int length) {
		List<TechnicalData> results = Collections.emptyList();
		if(tech==null){
			tech = new TechnicalData();		
		}
		tech.setType(type);
		tech.setSource(source);
		tech.setName(name);
		tech.setDisease(disease);
		tech.setStatus(status);
		if(homeflag==1)
			tech.setFlag(ApplicationConstants.FLAG_DISPLAY);
		if(displayflag==1)
			tech.setDisplay(ApplicationConstants.DISPLAY_FLAG);
		results = this.techService.queryByPageByTech(from, length,tech);

		return results;
	}

	public TechnicalDataService getTechService() {
		return techService;
	}

	public void setTechService(TechnicalDataService techService) {
		this.techService = techService;
	}

	public String getTechId() {
		return techId;
	}

	public void setTechId(String techId) {
		this.techId = techId;
	}

	public TechnicalData getTech() {
		return tech;
	}

	public void setTech(TechnicalData tech) {
		this.tech = tech;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public int getHomeflag() {
		return homeflag;
	}

	public void setHomeflag(int homeflag) {
		this.homeflag = homeflag;
	}

	public int getDisplayflag() {
		return displayflag;
	}

	public void setDisplayflag(int displayflag) {
		this.displayflag = displayflag;
	}

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}



	
}
