package com.nit.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTagHandler extends TagSupport {
	
	String name=null;
	
	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
	}

	@Override
	public int doStartTag() throws JspException 
	{
		try
		{
			pageContext.getOut().println("Your name is "+name);
		}
		catch(Exception e)
		{
			
		}
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException 
	{
		return EVAL_PAGE;
	}

}
