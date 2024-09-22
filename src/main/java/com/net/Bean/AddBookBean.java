package com.net.Bean;

public class AddBookBean {
	String bname;
	String auname;
	String bprice;
	int bid;

	public AddBookBean(String bname, String auname, String bprice, String bcategories, String bstatus, String bphoto) {
		
		this.bname = bname;
		this.auname = auname;
		this.bprice = bprice;
		this.bcategories = bcategories;
		this.bstatus = bstatus;
		this.bphoto = bphoto;

	}

	

	



	public AddBookBean() {
		super();
		// TODO Auto-generated constructor stub
	}







	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getBid() {
		return bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getAuname() {
		return auname;
	}

	public void setAuname(String auname) {
		this.auname = auname;
	}

	public String getBprice() {
		return bprice;
	}

	public void setBprice(String bprice) {
		this.bprice = bprice;
	}

	public String getBcategories() {
		return bcategories;
	}

	public void setBcategories(String bcategories) {
		this.bcategories = bcategories;
	}

	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	@Override
	public String toString() {
		return "AddBookBean [bid=" + bid + ",bname=" + bname + ", auname=" + auname + ", bprice=" + bprice
				+ ", bcategories=" + bcategories + ", bstatus=" + bstatus + ", bphoto=" + bphoto + "]";
	}

	public String getBphoto() {
		return bphoto;
	}

	public void setBphoto(String bphoto) {
		this.bphoto = bphoto;
	}

	String bcategories;
	String bstatus;
	String bphoto;
}
