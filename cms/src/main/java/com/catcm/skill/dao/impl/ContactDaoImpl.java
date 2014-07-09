package com.catcm.skill.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.catcm.skill.dao.ContactDao;
import com.catcm.skill.pojo.Contact;
@Component("contactDao")
public class ContactDaoImpl extends HibernateDao implements ContactDao {

	@SuppressWarnings("unchecked")
	public List<Contact> getContact() {
		String hql = "from Contact";
		return this.select(hql);
	}

	public int getCountOfContact() {
//		String hql ="select * from "this.getTotalCount(hql)
		return 1;
	}

}
