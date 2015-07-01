package com.psl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "add_money")
public class AddMoney {
	/*
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="addid")
	private int addid;
	*/
	@Column(name="amount")
	private long amount;
	
	@Column(name="userid")
	private int uid;

	/*
	public int getAddid() {
		return addid;
	}
*/
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}
}
