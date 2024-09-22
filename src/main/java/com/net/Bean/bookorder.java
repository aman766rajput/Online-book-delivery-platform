package com.net.Bean;

public class bookorder {
	private String uname;
public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
private String username;
private String email;
private String phno;
private String payment;
private String fulladd;
private String author;
private String pincode;
private int price;
private String bname;
private String orderid;
public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
public String getBname() {
	return bname;
}
public void setBname(String bname) {
	this.bname = bname;
}
public String getFulladd() {
	return fulladd;
}
public void setFulladd(String fulladd) {
	this.fulladd = fulladd;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getPayment() {
	return payment;
}
public void setPayment(String payment) {
	this.payment = payment;
}
@Override
public String toString() {
	return "bookorder [username=" + username + ", email=" + email + ", phno=" + phno + ", payment=" + payment + "]";
}

}
