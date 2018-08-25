package com.jit.services;

import com.jit.beans.AmtDetailsBean;

public class CalcIntrAmtService 
{
	public void calcSimpleIntr(AmtDetailsBean amtBean)
	{
		amtBean.setsInterest(((amtBean.getPamt())*(amtBean.getTime())*(amtBean.getRate()))/100);
	}
}