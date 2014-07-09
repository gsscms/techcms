package com.catcm.skill.action;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Dict;
import com.catcm.skill.service.DictService;
import com.catcm.skill.util.ApplicationConstants;


@SuppressWarnings("serial")
public class DictGridAction extends JqGridBaseAction<Dict> {

	@Autowired
	private DictService dictService;
	
	private Dict dict;
	
	private String value;
	
	private String id;
	
	public String saveDict(){
		dict.setPath("");
		dict.setFlag(ApplicationConstants.FLAG_NORMAL);
		dictService.saveDict(dict);
		return "saveDict";
	}
	
	public String delDict(){
		dictService.delDict(id);
		return "delDict";
	}
	
	public String initDictList(){
		this.refreshGridModel();
		return "initDictList";
	}
	
	public String initTrainTypeDict(){
		if(dict==null)
			dict = new Dict();
		dict.setValue(value);
		dict.setType(ApplicationConstants.DICT_TYPE_COMMUNICATION_TRAIN);
		this.refreshGridModel();
		return "inittTrainTypeDict";
	}
	
	public String initSkillTypeDict(){
		if(dict==null)
			dict = new Dict();
		dict.setValue(value);
		dict.setType(ApplicationConstants.DICT_TYPE_SKILL_TYPE);
		this.refreshGridModel();
		return "initSkillTypeDict";
	}
	
	@Override
	public int getResultSize() {
		if(dict==null)
			dict = new Dict();
		return dictService.getCount(dict);
	}

	@Override
	public List<Dict> listResults(int from, int length) {
		if(dict==null)
			dict = new Dict();
		List<Dict> results = Collections.emptyList();
		results = dictService.getDictList(from, length, dict);
		return results;
	}

	

	public DictService getDictService() {
		return dictService;
	}

	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}

	public Dict getDict() {
		return dict;
	}

	public void setDict(Dict dict) {
		this.dict = dict;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
	

}
