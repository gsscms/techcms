package com.catcm.skill.action;


import org.springframework.beans.factory.annotation.Autowired;




import com.catcm.skill.pojo.Contact;
import com.catcm.skill.service.ContactService;

public class ContactAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private ContactService contactService;
	
	private Contact contact;
	
	public String initContact(){
		contact = contactService.getContact();
		return "initContact";
	}
	
	public String saveContact(){
		contactService.saveContact(contact);
		return "saveContact";
	}

	public ContactService getContactService() {
		return contactService;
	}

	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}


	

	
}
