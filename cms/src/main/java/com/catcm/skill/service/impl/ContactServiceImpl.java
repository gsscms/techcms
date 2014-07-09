package com.catcm.skill.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catcm.skill.dao.ContactDao;
import com.catcm.skill.pojo.Contact;
import com.catcm.skill.service.ContactService;

@Service("contactService")
public class ContactServiceImpl implements ContactService {

	@Autowired
	private ContactDao contactDao;

	
	
	public ContactDao getContactDao() {
		return contactDao;
	}

	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}

	public Contact getContact() {
		List<Contact> list = this.contactDao.getContact();
		return list!=null&&!list.isEmpty()?list.get(0):null;
	}

	public int getAllNum() {
		return 1;
	}

	public List<Contact> getAllList() {
		// TODO Auto-generated method stub
		return this.contactDao.getContact();
	}

	public void saveContact(Contact contact) {
		if("".equals(contact.getId()))
			contact.setId(null);
		this.contactDao.saveOrUpdate(contact);
	}
	
	
}
