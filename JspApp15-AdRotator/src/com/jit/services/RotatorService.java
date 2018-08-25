package com.jit.services;

import java.util.Random;

public class RotatorService 
{
	private int counter=0;
	private String[] images={"1.jpg",
							 "2.jpg",
							 "3.jpg",
							 "4.jpg",
							 "5.jpg",
							 "6.jpg",};
	
	private String[] links={"http://www.google.com",
							"http://www.w3schools.com",
							"http://www.aceit.in",
							"http://www.yahoo.co.in",
							"http://www.c-sharpcorner.com",
							"http://www.noukri.com"};

	public String getImages()
	{
		return images[counter];
	}
	public String getLinks()
	{
		return links[counter];
	}
	
	public void generateNextRandom()
	{
		Random rndm=new Random();
		counter=rndm.nextInt(6);
	}
}
