package com.catcm.skill.action;


import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.pojo.InfoType;
import com.catcm.skill.service.InfoService;
import com.opensymphony.xwork2.ModelDriven;


public class InfoAction extends JqGridBaseAction<Info> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private InfoService infoService;
	
	private List<InfoType> types;
	
	
	private Info info;

	
	private String infoTypeId;
	
//	private String actionUrl;
	
	
	private String infoId;
	
	public String deleteInfo (){
		infoService.deletInfo(infoId);
		return "deleteInfo";
	}

	
	public String initPublicInfoGrid(){
		this.refreshGridModel();
		return "initPublicInfoGrid";
	}
	
	public String savaPlatForm(){
		if("".equals(info.getId()))
			info.setId(null);;
		infoService.savePlateInfo(info);
		this.addActionMessage("操作成功");
		return "savaPlatForm";
	}
	
	public String initPlatForm(){
		info = infoService.getPlateInfo();
		return "initPlatForm";
	}
	
//	public String platformManager(){
//		return "platformManager";
//	}
	
	public String allInfoList(){
//		infoPage=infoService.getAllInfoPaging(page,rows);
		return SUCCESS;
	}
	
	

	public String allInfoType(){
		types = infoService.getAllInfoTypeList();
		return SUCCESS;
	}

	public String publicInfo(){
		infoService.publicInfo(info);
		return "publicInfo";
	}
	public InfoService getInfoService() {
		return infoService;
	}

	
	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}


	



	public List<InfoType> getTypes() {
		return types;
	}

	public void setTypes(List<InfoType> types) {
		this.types = types;
	}


	public Info getInfo() {
		return info;
	}


	public void setInfo(Info info) {
		this.info = info;
	}

	public String getInfoTypeId() {
		return infoTypeId;
	}

	public void setInfoTypeId(String infoTypeId) {
		this.infoTypeId = infoTypeId;
	}

    @Override  
    public int getResultSize() {
        return this.infoService.queryResultsCount();  
    }  
      
    @Override  
    public List<Info> listResults(int from, int length) {  
        List<Info> results = Collections.emptyList();  
          
        results = this.infoService.queryByPage(from, length);  
          
        return results;  
    }


	


//	public String getActionUrl() {
//		return actionUrl;
//	}
//
//
//	public void setActionUrl(String actionUrl) {
//		this.actionUrl = actionUrl;
//	}


	public String getInfoId() {
		return infoId;
	}


	public void setInfoId(String infoId) {
		this.infoId = infoId;
	}
	
	
}
