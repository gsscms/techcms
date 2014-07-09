package com.catcm.skill.dao;

import java.util.List;

import com.catcm.skill.pojo.Contact;

public interface ContactDao extends IHibernateDao {
	public List<Contact> getContact();
	
	public int getCountOfContact();
}
