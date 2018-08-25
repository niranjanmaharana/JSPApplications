package com.jit.beans;

public class AmtDetailsBean {
	private String cname=null;
	private float pamt=0.0f;
	private float rate=0.0f;
	private int time=0;
	private float sInterest=0.0f;
	
	public AmtDetailsBean()
	{
		System.out.println("0-param constructor");
	}
	
	public String getCname()
	{
		System.out.println("getCname()");
		return cname;
	}
	public void setCname(String cname) 
	{
		System.out.println("setCname(String)");
		this.cname = cname;
	}
	public float getPamt() 
	{
		System.out.println("getPamt()");
		return pamt;
	}
	public void setPamt(float pamt)
	{
		System.out.println("setPamt(float)");
		this.pamt = pamt;
	}
	public float getRate() 
	{
		System.out.println("getRate()");
		return rate;
	}
	public void setRate(float rate)
	{
		System.out.println("setRate(float)");
		this.rate = rate;
	}
	public int getTime() 
	{
		System.out.println("getTime()");
		return time;
	}
	public void setTime(int time) 
	{
		System.out.println("setTime(int)");
		this.time = time;
	}
	public float getsInterest() 
	{
		System.out.println("getInterest()");
		return sInterest;
	}
	public void setsInterest(float sInterest) 
	{
		System.out.println("setInterest(float)");
		this.sInterest = sInterest;
	}
}