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


/**
 * 
 */
@Entity
@Table(name = "transactions")
public class Transactions
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="tid")
	private int tid;

	@Column(name="sid")
	private int sid;
	
	@Column(name="rid")
	private int rid;	
	
	@Column(name="amount")
	private int amount;
	
	public int getTid() {
		return tid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
