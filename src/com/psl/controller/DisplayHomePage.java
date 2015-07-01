/**
 * 
 */
package com.psl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.psl.mobilewallet.util.HibernateUtil;
import com.psl.model.ReqMoney;
import com.psl.model.Wallet;
import com.psl.helper.*;

/**
 * 
 */
@Controller
public class DisplayHomePage
{
	
	/**
	 * @return index page
	 */
	@RequestMapping("/home")
	public String displayHomePage(String name)
	{
		return "index";
	}

	@RequestMapping("/homesubmit")	// when submit button on form is pressed, this url is shown
	public String submitHomePage(@ModelAttribute Wallet wallet)
	
	//** Wallet wallet is entries of form
	
	//** Wallet w is mobile_wallet of database
	
	//**signup button (form)//
	{
		List rowsusername = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.username=?", new String[]
		{ wallet.getUsername() });
		
		List rowsemail = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.email=?", new String[]
		{ wallet.getEmail() });	
		
		//List rowsmobileno = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.mobileno=?", new long[]
				//{ (long) wallet.getMobileno() });	
		
		
		
		//**this checks from the database whether the username and email are already registered//
	
		if (rowsusername.size() > 0){
			return "savefailure-username-taken";
		}
		else 
			if(rowsemail.size()>0 ){
			return "savefailure-email-registered";
		}
		else {		
			
			//**if not registered then save the signup details filled into the database mobile_wallet
			
			Wallet w = new Wallet();
			w.setEmail( wallet.getEmail());
			w.setName(wallet.getName());
			w.setUsername(wallet.getUsername());
			w.setPassword(wallet.getPassword());
			w.setMobileno(wallet.getMobileno());
			//w.setBalance(0);
			HibernateUtil.getHibernateTemplate().save(w);
			return "savesuccess";
		}
	}
	
	//**the login button(form)
	
	
	@RequestMapping("/homelogin")
	public String submitLoginPage(@ModelAttribute Wallet wallet, Model model, HttpServletRequest request, HttpServletResponse res) throws ServletException,IOException 
	{
		List rows;
		
		//**the helper class is a file which identifies whether the user is logging in using mobileno or username
		
		
		if(Helper.isLong(wallet.getUsername())){
			rows = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.mobileno=?  AND w.password=? ", 
					new Object[] { Long.parseLong(wallet.getUsername()), wallet.getPassword() });
			
		} else {
			rows = HibernateUtil.getHibernateTemplate().find("from Wallet w where w.username=? AND w.password=? ", 
					new Object[] { wallet.getUsername(), wallet.getPassword() });
			
		}
		
		
		//**the following set of if else statements match the login credentials of the user from those stored in the database
		
		
		if (rows.size() > 0) {
			Wallet w1 = (Wallet) rows.get(0);
			//ReqMoney reqofuser = new ReqMoney();
						
			model.addAttribute("w", w1);	//w1 is a new identifier can be anything
			//model.addAttribute("reqofuser", reqofuser);
			
			HttpSession session = request.getSession();
			session.setAttribute("w", w1);
			//session.setAttribute("reqofuser", reqofuser);
			
			return "mainhome";
		}
		
		else{
			model.addAttribute("error", "Login Fail!");
			return "index";  
		}
		
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String submitLogoutPage(@ModelAttribute Wallet wallet, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		/*if(session!=null){
		session.invalidate();
		}*/
		return "index";
}
}