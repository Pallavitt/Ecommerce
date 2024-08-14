package com.cruds.entity;

public class OrderItem 
{
    private int orderid;
    private String orderdate;
    private String productname;
    private int quantity;
    private double price;

   

    public OrderItem(int orderid, String orderdate, String productname, int quantity, double price) 
    {
		super();
		this.orderid = orderid;
		this.orderdate = orderdate;
		this.productname = productname;
		this.quantity = quantity;
		this.price = price;
	}



	public int getOrderid() {
		return orderid;
	}



	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}



	public String getOrderdate() {
		return orderdate;
	}



	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}



	public String getProductname() {
		return productname;
	}



	public void setProductname(String productname) {
		this.productname = productname;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}
	
}
