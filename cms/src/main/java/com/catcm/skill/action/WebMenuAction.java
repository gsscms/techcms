package com.catcm.skill.action;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.InfoType;
import com.catcm.skill.service.WebMenuService;
import com.catcm.skill.util.ApplicationConstants;


public class WebMenuAction extends JqGridBaseAction<InfoType> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private WebMenuService webMenuService;
	
	private InfoType menu;
	
	public String setDisplay(){
		webMenuService.setDisplay(menu);
		return "setDisplay";
	}
	
	public String setNoDisplay(){
		webMenuService.setNoDisplay(menu);
		return "setNoDisplay";
	}
	
	public String delWebMenu(){
		webMenuService.delMenu(menu);
		return "delWebMenu";
	}
	
	public String initWebMenu(){
		 this.refreshGridModel();
		 return  "initWebMenu";
	}
	
	public String saveMenu(){
		if("".equals(menu.getId())){
			menu.setId(null);
			menu.setFlag(ApplicationConstants.FLAG_NORMAL);
		}
		
		  webMenuService.saveMenu(menu);
		return "saveMenu";
	}
	
	@Override
	public int getResultSize() {
		return this.webMenuService.queryResultsCount(); 
	}

	@Override
	public List<InfoType> listResults(int from, int length) {
		List<InfoType> results = Collections.emptyList();  
        
        results = this.webMenuService.queryAllByPage(from, length);  
          
        return results;
	}

	public WebMenuService getWebMenuService() {
		return webMenuService;
	}

	public void setWebMenuService(WebMenuService webMenuService) {
		this.webMenuService = webMenuService;
	}

	public InfoType getMenu() {
		return menu;
	}

	public void setMenu(InfoType menu) {
		this.menu = menu;
	}
	
	
}
