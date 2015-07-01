package com.psl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psl.mobilewallet.util.HibernateUtil;
import com.psl.model.Wallet;
import com.psl.model.Transactions;

@Controller
public class DisplayPreviousTransactions
{
	/**
	 * @return index page
	 */
	@RequestMapping("/Previoustransactions.jsp")
	public String displayHomePage(String name)
	{
		return "PreviousTransactions";
	}

	@RequestMapping("")
	public String submitHomePage(@ModelAttribute Wallet wallet)
	{
		
			return "savesuccess";
		}
	}

