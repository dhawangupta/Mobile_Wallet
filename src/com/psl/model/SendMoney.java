package com.psl.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.*;


/*
 * 
 * */

@Entity
@Table(name = "send_money")
public class SendMoney {
	
	
	// creating @id is compulsory for every table
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="sid")
	private int sid;	//send id	
	
	@Column(name="senderid")
	private int senderid;	//sender's id
	
	// private int rid;	//receiver's id
	
	@Column(name="amount")
	private long amount;	//amount send
	
	@Column(name="rmobileno")
	private long rmobileno;	//mobile no of receiver  

	public int getSid() {
		return sid;
	}
	
	public int getSenderid() {
		return senderid;
	}

	public void setSenderid(int senderid) {
		this.senderid = senderid;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public long getRmobileno() {
		return rmobileno;
	}

	public void setRmobileno(long rmobileno) {
		this.rmobileno = rmobileno;
	}
}
