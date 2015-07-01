/**
 * 
 */
package com.psl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.psl.mobilewallet.util.HibernateUtil;
import com.psl.model.AddMoney;
import com.psl.model.ReqMoney;
import com.psl.model.SendMoney;
import com.psl.model.Transactions;
import com.psl.model.Wallet;
import com.psl.helper.*;
import com.psl.controller.DisplayHomePage;
/**
 * 
 */
@Controller
public class DisplayTransactions
{
/*private static HttpSession session;
	
	public static HttpSession getSession(){
		return session;
	}
	
*/
	
	//taking values and working on values from send submit form
	//send for form s for table
	@RequestMapping(value="/ConfirmPayment", method = RequestMethod.POST)
	public String submitSendPage(@ModelAttribute SendMoney send, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		Wallet w = (Wallet)session.getAttribute("w");
		
		SendMoney s = new SendMoney();

		//Transactions t=new Transactions();
		
		long senderbal=w.getBalance();
		long amt=send.getAmount();
		boolean moreamt = amt>=senderbal;
				
		send.setSenderid(w.getId());
		
		s.setAmount(amt);
		s.setRmobileno(send.getRmobileno());
		s.setSenderid(send.getSenderid());
		
		model.addAttribute("senderbal", senderbal);
		model.addAttribute("amt", amt);
		model.addAttribute("moreamt", moreamt);
		
		session.setAttribute("senderbal", senderbal);
		session.setAttribute("amt", amt);
		session.setAttribute("moreamt", moreamt);
		
		
		//HibernateUtil.getHibernateTemplate().save(s);
		//w.setBalance(w.getBalance()-send.getAmount());
		
		return "ConfirmPayment";
	}
	
	@RequestMapping(value="/AddMoney", method = RequestMethod.POST)
	public String submitAddPage(@ModelAttribute AddMoney add, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		Wallet w = (Wallet)session.getAttribute("w");
		
		AddMoney a = new AddMoney();
		
		a.setAmount(add.getAmount());
		
		a.setUid(w.getId());
		
		model.addAttribute("a", a);
		
		session.setAttribute("a", a);
		//HibernateUtil.getHibernateTemplate().save(s);
		//w.setBalance(w.getBalance()-send.getAmount());
		
		return "AddMoney";
	}
	
	@RequestMapping(value="/RequestMoney", method = RequestMethod.POST)
	public String submitRequestPage(@ModelAttribute ReqMoney req, Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		Wallet sender = (Wallet)session.getAttribute("w");
		Wallet receiver = null;
		
		ReqMoney r = new ReqMoney();
		
		List rows = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.mobileno=?", new Object[]
				{ req.getRmobileno() });
		
		if(rows.size()>0){
			
			receiver = (Wallet)rows.get(0);
			r.setSenderid(sender.getId());
			r.setReceiverid(receiver.getId());
			r.setAmount(req.getAmount());
			r.setRmobileno(req.getRmobileno());
			
			HibernateUtil.getHibernateTemplate().save(r);
			model.addAttribute("error", "Request submitted successfully!");
	        return "mainhome";
			
			
		} else{
			model.addAttribute("error", "error");
	        return "mainhome";
		}
		
		
	}
	
	
	
	
}