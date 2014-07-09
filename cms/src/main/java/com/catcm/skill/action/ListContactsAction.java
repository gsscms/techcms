package com.catcm.skill.action;

import java.util.Collections;  
import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Info;
import com.catcm.skill.service.InfoService;
@SuppressWarnings("serial")  
public class ListContactsAction extends JqGridBaseAction<Info> {  
      
	@Autowired
	private InfoService infoService;
      
    @Override  
    public String execute() {  
        return this.refreshGridModel();  
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

	public InfoService getInfoService() {
		return infoService;
	}

	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}  
    
      
}  
