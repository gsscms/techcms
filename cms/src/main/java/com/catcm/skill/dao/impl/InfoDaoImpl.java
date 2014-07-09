package com.catcm.skill.dao.impl;


import java.util.ArrayList;
import java.util.List;

















import com.catcm.skill.dao.InfoDao;
import com.catcm.skill.pojo.Info;
import com.catcm.skill.vo.Page;



public class InfoDaoImpl  extends HibernateDao implements InfoDao{
	


	public Page getAllInfoPaging(int pageNum, int pageSize) {
		int startIndex = Page.getStartOfPage(pageNum, pageSize);
		String hql ="select new Info(info.id,info.content,info.title,info.typeCode,info.createUser,info.updateUser,type.name) "
				+ " from Info info,InfoType type where info.typeCode=type.code";
	
		 Integer totalCount =0; //getAllInfoNum();
	     List list = select(hql, null, startIndex, pageSize);

	     return new Page(startIndex, totalCount, pageSize, list);
	}
	
	public int getAllInfoNum(){
		
		try {
			String hql ="select count(*)"
					+ " from Info";
			return getTotalCount(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Info> queryByPage(int from, int length) {
		String hql ="select new Info(info.id,info.content,info.title,info.typeCode,info.createUser,info.updateUser,type.name) "
				+ " from Info info,InfoType type where info.typeCode=type.code";
		return   select(hql, null, from, length);
	}

	public List<Info> getInfoListByType(String type) {
		String hql = "from Info where typeCode=?";
		return (List<Info>) this.getHibernateTemplate().find(hql, type);
	}

	public List<Info> queryByPage(int from, int length, String infoType) {
//		String hql ="select new Info(info.id,info.content,info.title,info.typeCode,info.createUser,info.updateUser,type.name) "
//				+ " from Info info,InfoType type where info.typeCode=type.code and info.typeCode='"+infoType+"'";
		String hql ="from Info info where info.typeCode='"+infoType+"'";
		return   select(hql, null, from, length);
	}

	public int getAllInfoNum(String infoType) {
		try {
			String hql ="select count(*)"
					+ " from Info where typeCode='"+infoType+"'";
			return getTotalCount(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public void setInfoFlag(String id,int flag) {
		String hql =" update Info set flag=? where id=?";
		this.getHibernateTemplate().bulkUpdate(hql,flag,id);
		
	}

	public List<Info> getInfoByFlagAndType(int flag,String infoType) {
		String hql = "from Info where flag =? and typeCode = ?";
		return (List<Info>) this.getHibernateTemplate().find(hql, flag,infoType);
	}

	public List<Info> getInfoByType(String infoType) {
		String hql = "from Info where typeCode = ?";
		return (List<Info>) this.getHibernateTemplate().find(hql,infoType);
	}

	public List<Info> getInfoByTypeAndDict(String dictId, String infoType) {
		String hql = "from Info where dictCode=? and typeCode = ?";
		return (List<Info>) this.getHibernateTemplate().find(hql,dictId,infoType);
	}

	public void deleteInfo(String id) {
		String hql = "delete Info where id=?";
		this.getHibernateTemplate().bulkUpdate(hql, id);
	}

	public int getCountByInfo(Info info) {
		String hql ="select count(*) from Info where 1=1 ";
		List<Object> param = new ArrayList<Object>();
		if(info.getId()!=null&&!"".equals(info.getId())){
			hql +=" and id =? ";
			param.add(info.getId());
		}
		if(info.getTitle()!=null&&!"".equals(info.getTitle())){
			hql +=" and title like ?";
			param.add("%"+info.getTitle()+"%");
		}
		if(info.getDictCode()!=null&&!"".equals(info.getDictCode())){
			
			hql +=" and dictCode = ?";
			param.add(info.getDictCode());
		}
		if(info.getTypeCode()!=null&&!"".equals(info.getTypeCode())){
			hql +=" and typeCode =? ";
			param.add(info.getTypeCode());
		}
		
		return this.getCount(hql, param.toArray());
	}

	@SuppressWarnings("unchecked")
	public List<Info> getInfoPageByInfo(int from, int to, Info info) {
		String hql ="from Info where 1=1 ";
		
		List<Object> param = new ArrayList<Object>();
		if(info.getId()!=null&&!"".equals(info.getId())){
			hql +=" and id =? ";
			param.add(info.getId());
		}
		if(info.getTitle()!=null&&!"".equals(info.getTitle())){
			hql +=" and title like ?";
			param.add("%"+info.getTitle()+"%");
		}
		if(info.getDictCode()!=null&&!"".equals(info.getDictCode())){
			hql +=" and dictCode=?";
			param.add(info.getDictCode());
		}
		if(info.getTypeCode()!=null&&!"".equals(info.getTypeCode())){
			hql +=" and typeCode =? ";
			param.add(info.getTypeCode());
		}
		hql +=" order by createTime desc";
		return this.select(hql, param.toArray(), from, to);
	}
	

}
