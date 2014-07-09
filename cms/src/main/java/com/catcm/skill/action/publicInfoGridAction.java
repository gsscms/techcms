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
public class publicInfoGridAction extends JqGridBaseAction<Info> {

	@Autowired
	private InfoService infoService;

	private List<Dict> dict;

	private String infoType;
	
	private String id;

	private Info info;
	
	private String title;
	
	public String editPublicInfo(){
		info = this.infoService.getInfoById(id);
		return "editPublicInfo";
	}
	

	public String publicDict() {
		dict = infoService
				.getDictByType(ApplicationConstants.DICT_TYPE_PUBLIC_INFO);
		return "publicDict";
	}

	public String savePublic() {
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_PUBLIC_INFO);
		if ("".equals(info.getId())) {
			info.setId(null);
			info.setCreateTime(new Timestamp(new Date().getTime()));
			info.setUpdateTime(new Timestamp(new Date().getTime()));
			info.setFlag(ApplicationConstants.FLAG_NORMAL);
		}

		infoService.saveInfo(info);

		return "savePublic";
	}

	public String initPublicInfoList() {
		this.refreshGridModel();
		return "initPublicInfoList";
	}

	@Override
	public int getResultSize() {
		if(info==null)
			info = new Info();
		info.setTitle(title);
		info.setDictCode(infoType);
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_PUBLIC_INFO);
		return this.infoService
				.queryResultsCount(info);
	}

	@Override
	public List<Info> listResults(int from, int length) {
		List<Info> results = Collections.emptyList();

		if(info==null)
			info = new Info();
		info.setTitle(title);
		info.setDictCode(infoType);
		info.setTypeCode(ApplicationConstants.INFO_TYPE_CODE_PUBLIC_INFO);
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}

	
}
