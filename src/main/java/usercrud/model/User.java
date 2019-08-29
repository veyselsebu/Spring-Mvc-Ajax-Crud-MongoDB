package usercrud.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class User {

	@Id
	private String id;
	
	private String name;
	
	private String surName;

	private String phoneNumber;
	
	private String captcha;
	
	public User() {
		super();
	}

	
	public User(String id, String name, String surName, String phoneNumber, String captcha) {
		super();
		this.id = id;
		this.name = name;
		this.surName = surName;
		this.phoneNumber = phoneNumber;
		this.captcha = captcha;
	}


	public String getSurName() {
		return surName;
	}


	public void setSurName(String surName) {
		this.surName = surName;
	}


	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	
}
