package com.catcm.skill.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.catcm.skill.dao.TechnicalDataDao;
import com.catcm.skill.pojo.TechnicalData;
@Component("techDao")
public class TechnicalDataDaoImpl extends HibernateDao implements TechnicalDataDao{

	@SuppressWarnings("unchecked")
	public List<TechnicalData> queryByPage(int from, int length) {
		String hql ="from TechnicalData tec";
		return   select(hql, null, from, length);
	}

	public int getAllInfoNum() {

		try {
			String hql ="select count(*)"
					+ " from TechnicalData ";
			return getTotalCount(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public void doCheck(TechnicalData tel) {
		String hql = "update TechnicalData set advice=?,status=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql, tel.getAdvice(),tel.getStatus(),tel.getId());
	}

	public void updateFlag(String id, int flag) {
		String hql = "update TechnicalData set flag=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql,flag, id);
	}

	@SuppressWarnings("unchecked")
	public List<TechnicalData> getTechListByFlag(int flag) {
		String hql = "from TechnicalData where flag = ?";
		return (List<TechnicalData>) this.getHibernateTemplate().find(hql, flag);
	}

	@SuppressWarnings("unchecked")
	public List<TechnicalData> getDisplaySkill(String dictId,int flag) {
		String hql ="from TechnicalData where display=? and type=?";
		return (List<TechnicalData>) this.getHibernateTemplate().find(hql, flag,dictId);
	}
	

	public void updateDisplayFlag(String id,int flag) {
		String hql = "update TechnicalData set display=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql,flag, id);		
	}

	@SuppressWarnings("unchecked")
	public List<TechnicalData> getInfoPageByTech(int from, int to,
			TechnicalData tech) {
		String hql= "from TechnicalData where 1=1";
	    List<Object> params = new ArrayList<Object>();
		if(tech.getType()!=null&&!"".equals(tech.getType())){
			hql+=" and type =?";
			params.add(tech.getType());			
		}
		if(tech.getSource()!=null&&!"".equals(tech.getSource())){
			hql+=" and source =?";
			params.add(tech.getSource());			
		}
		if(tech.getStatus()!=null&&!"".equals(tech.getStatus())){
			hql+=" and status =?";
			params.add(tech.getStatus());			
		}
		if(tech.getDisease()!=null&&!"".equals(tech.getDisease())){
			hql+=" and disease like ?";
			params.add("%"+tech.getDisease()+"%");			
		}
		if(tech.getName()!=null&&!"".equals(tech.getName())){
			hql+=" and name like ?";
			params.add("%"+tech.getName()+"%");			
		}
		if(tech.getFlag()!=null&&tech.getFlag()!=0){
			hql+=" and flag = ?";
			params.add(tech.getFlag());
		}
		if(tech.getDisplay()!=0){
			hql+=" and display = ?";
			params.add(tech.getDisplay());
		}
		return this.select(hql, params.toArray(), from, to);
	}

	public int getCountByTech(TechnicalData tech) {
		String hql= "select count(*) from TechnicalData where 1=1";
	    List<Object> params = new ArrayList<Object>();
		if(tech.getType()!=null&&!"".equals(tech.getType())){
			hql+=" and type =?";
			params.add(tech.getType());			
		}
		if(tech.getSource()!=null&&!"".equals(tech.getSource())){
			hql+=" and source =?";
			params.add(tech.getSource());			
		}
		if(tech.getStatus()!=null&&!"".equals(tech.getStatus())){
			hql+=" and status =?";
			params.add(tech.getStatus());			
		}
		if(tech.getDisease()!=null&&!"".equals(tech.getDisease())){
			hql+=" and disease like ?";
			params.add("%"+tech.getDisease()+"%");			
		}
		if(tech.getName()!=null&&!"".equals(tech.getName())){
			hql+=" and name like ?";
			params.add("%"+tech.getName()+"%");			
		}
		if(tech.getFlag()!=null&&tech.getFlag()!=0){
			hql+=" and flag = ?";
			params.add(tech.getFlag());
		}
		if(tech.getDisplay()!=0){
			hql+=" and display = ?";
			params.add(tech.getDisplay());
		}
		return this.getCount(hql, params.toArray());
	}

	public void batchUpdateFlagByIds(List<String> ids, int flag) {
		String hql="update TechnicalData set flag=? where id=?";
		for (String id:ids) {
			this.getHibernateTemplate().bulkUpdate(hql,flag, id);
		}
		
	}

	public void BatchUpdateFlag(int flag, String status) {
		String hql="update TechnicalData set flag=? where status=?";
		this.getHibernateTemplate().bulkUpdate(hql,flag, status);
	}

	@Override
	public List<TechnicalData> getInfoPageByTech(TechnicalData tech) {
		String hql= "from TechnicalData where 1=1";
	    List<Object> params = new ArrayList<Object>();
		if(tech.getType()!=null&&!"".equals(tech.getType())){
			hql+=" and type =?";
			params.add(tech.getType());			
		}
		if(tech.getSource()!=null&&!"".equals(tech.getSource())){
			hql+=" and source =?";
			params.add(tech.getSource());			
		}
		if(tech.getStatus()!=null&&!"".equals(tech.getStatus())){
			hql+=" and status =?";
			params.add(tech.getStatus());			
		}
		if(tech.getDisease()!=null&&!"".equals(tech.getDisease())){
			hql+=" and disease like ?";
			params.add("%"+tech.getDisease()+"%");			
		}
		if(tech.getName()!=null&&!"".equals(tech.getName())){
			hql+=" and name like ?";
			params.add("%"+tech.getName()+"%");			
		}
		if(tech.getFlag()!=null&&tech.getFlag()!=0){
			hql+=" and flag = ?";
			params.add(tech.getFlag());
		}
		if(tech.getDisplay()!=0){
			hql+=" and display = ?";
			params.add(tech.getDisplay());
		}
		return this.select(hql, params.toArray());
	}

}
