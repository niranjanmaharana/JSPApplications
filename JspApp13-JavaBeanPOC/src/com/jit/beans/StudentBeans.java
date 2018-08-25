package com.jit.beans;

public class StudentBeans {

	int sno=0;
	String sname=null;
	String sadd=null;
	
	public int getSno() {
		System.out.println("getSno()");
		return sno;
	}
	public void setSno(int sno) {
		System.out.println("setSno(int)");
		this.sno = sno;
	}
	public String getSname() {
		System.out.println("getSname()");
		return sname;
	}
	public void setSname(String sname) {
		System.out.println("setSname(String)");
		this.sname = sname;
	}
	public String getSadd() {
		System.out.println("getSadd()");
		return sadd;
	}
	public void setSadd(String sadd) {
		System.out.println("setSno(String)");
		this.sadd = sadd;
	}
	public static void main(String[] args) {
		
	}
}
