package com.dollop.model;

import java.math.BigInteger;

public class Contact {
	private Integer id;
	private String name;
	private String email;
	private BigInteger phone;
	private Integer uId;
	public Contact() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public BigInteger getPhone() {
		return phone;
	}
	public void setPhone(BigInteger phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Contact [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", uId=" + uId + "]";
	}
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}

}
