/**
 * 
 */
package com.psl.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.*;


/*
 * Variables in Wallet should be identical to mobile_wallet table
 * 
 * Form homesubmit and homelogin use variables which must be SUBSET of Wallet
 * 
 * 
 */

@Entity
@Table(name = "mobile_wallet")
public class Wallet
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="username") //this name is used to match with field in form with same name as well column with same name in table.
	private String username;

	@Column(name="password")
	private String password;

	@Column(name="email")
	private String email;
	
	@Column(name="mobileno")
	private Long mobileno;
	
	@Column(name="balance")
	private long balance;
	
	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public Long getMobileno() {
		return mobileno;
	}
	
	public void setMobileno(Long mobileno){
		this.mobileno=mobileno;
	}

	
}
