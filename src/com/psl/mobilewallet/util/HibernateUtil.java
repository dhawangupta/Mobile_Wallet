/**
 * 
 */
package com.psl.mobilewallet.util;

import org.springframework.orm.hibernate3.HibernateTemplate;


/**
 * 
 */
public class HibernateUtil
{
	private static HibernateTemplate hibernateTemplate;

	/**
	 * @return hibernateTemplate
	 */
	public static HibernateTemplate getHibernateTemplate()
	{
		return hibernateTemplate;
	}

	/**
	 * @param template
	 */
	public static void setHibernateTemplate(HibernateTemplate template)
	{
		hibernateTemplate = template;
	}
}
