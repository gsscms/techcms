package com.catcm.skill.service;

import java.util.List;

import com.catcm.skill.pojo.Contact;

public interface ContactService {
	
	public Contact getContact();
	
	public int getAllNum();
	
	public List<Contact> getAllList();
	
	public void saveContact(Contact contact);
}
