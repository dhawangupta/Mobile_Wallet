package com.psl.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "req_money")
public class ReqMoney {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="rsid")
	private int rsid;	//send id	
	
	@Column(name="senderid")
	private int senderid;	//sender's id
	
	@Column(name="receiverid")
	private long receiverid;	//receiver's id
	
	@Column(name="amount")
	private long amount;	//amount send
	
	private long rmobileno;
	
	
	public long getRmobileno() {
		return rmobileno;
	}

	public void setRmobileno(long rmobileno) {
		this.rmobileno = rmobileno;
	}

	public int getRsid() {
		return rsid;
	}

	public int getSenderid() {
		return senderid;
	}

	public void setSenderid(int senderid) {
		this.senderid = senderid;
	}

	public long getReceiverid() {
		return receiverid;
	}

	public void setReceiverid(long receiverid) {
		this.receiverid = receiverid;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

}
