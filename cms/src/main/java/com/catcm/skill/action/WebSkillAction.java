package com.catcm.skill.action;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;

import com.catcm.skill.pojo.Dict;
import com.catcm.skill.pojo.TechnicalData;
import com.catcm.skill.service.TechnicalDataService;

public class WebSkillAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private TechnicalDataService techService;
	
	private TechnicalData skill;
	
	private List<Dict> sdict;
	
	private List<Dict> tdict;
	
	private List<TechnicalData> techList;
	
	private String dictId;
	
	private List<String> dictIds=new List<String>() {
		
		public <T> T[] toArray(T[] a) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public Object[] toArray() {
			// TODO Auto-generated method stub
			return null;
		}
		
		public List<String> subList(int fromIndex, int toIndex) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public int size() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		public String set(int index, String element) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public boolean retainAll(Collection<?> c) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public boolean removeAll(Collection<?> c) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public String remove(int index) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public boolean remove(Object o) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public ListIterator<String> listIterator(int index) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public ListIterator<String> listIterator() {
			// TODO Auto-generated method stub
			return null;
		}
		
		public int lastIndexOf(Object o) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		public Iterator<String> iterator() {
			// TODO Auto-generated method stub
			return null;
		}
		
		public boolean isEmpty() {
			// TODO Auto-generated method stub
			return false;
		}
		
		public int indexOf(Object o) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		public String get(int index) {
			// TODO Auto-generated method stub
			return null;
		}
		
		public boolean containsAll(Collection<?> c) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public boolean contains(Object o) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public void clear() {
			// TODO Auto-generated method stub
			
		}
		
		public boolean addAll(int index, Collection<? extends String> c) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public boolean addAll(Collection<? extends String> c) {
			// TODO Auto-generated method stub
			return false;
		}
		
		public void add(int index, String element) {
			// TODO Auto-generated method stub
			
		}
		
		public boolean add(String e) {
			// TODO Auto-generated method stub
			return false;
		}
	};
	
	public String forDisplaySkillInfo(){
		techList = techService.getDisplaySkill(dictId);
		return "forDisplaySkillInfo";
	}
	
	public String forDisplaySkillType(){
		tdict = techService.forDisplaySkillType();
		return "forDisplaySkillType";
	}
	
	public String setDisplaySkillType(){
		techService.displaySkillType(dictIds);
		return "setDisplaySkillType";
	}
	
	public String homeDisplaySkill(){
		//techList = techService.homeDisplaySkill();
		techList = techService.getAllChecked();
		return "homeDisplaySkill";
	}
	
	public String initTechList(){
		techList = techService.queryByPage(0, 15);
		return "initTechList";
	}
	
	public String initSourceDict(){
		sdict = techService.getSkillSourceList();
		return "initSourceDict";
	}

	public String initSkillTypeDict(){
		tdict = techService.getSkillTypeList();
		return "initSkillTypeDict";
	}
	public String registSkill(){
		techService.registTec(skill);
		return "registSkill";
	}
	
	public TechnicalDataService getTechService() {
		return techService;
	}

	public void setTechService(TechnicalDataService techService) {
		this.techService = techService;
	}

	public TechnicalData getSkill() {
		return skill;
	}

	public void setSkill(TechnicalData skill) {
		this.skill = skill;
	}

	public List<Dict> getSdict() {
		return sdict;
	}

	public void setSdict(List<Dict> sdict) {
		this.sdict = sdict;
	}

	public List<Dict> getTdict() {
		return tdict;
	}

	public void setTdict(List<Dict> tdict) {
		this.tdict = tdict;
	}

	public List<TechnicalData> getTechList() {
		return techList;
	}

	public void setTechList(List<TechnicalData> techList) {
		this.techList = techList;
	}

	public List<String> getDictIds() {
		return dictIds;
	}

	public void setDictIds(List<String> dictIds) {
		this.dictIds = dictIds;
	}

	public String getDictId() {
		return dictId;
	}

	public void setDictId(String dictId) {
		this.dictId = dictId;
	}


	
	
}
