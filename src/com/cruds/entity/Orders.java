package com.cruds.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orders extends Product
{
    private int orderid;
    private int userid;
    private int quantity;
    private String orderdate;
    
    
    public Orders()
    {
    	
	}

    public Orders(int orderid, int userid, int quantity, String orderdate) 
    {
        this.orderid = orderid;
        this.userid = userid;
        this.quantity = quantity;
        this.orderdate = orderdate;      
    }
    
    public Orders(int userid, int quantity, String orderdate) 
    {
		super();
		this.userid = userid;
		this.quantity = quantity;
		this.orderdate = orderdate;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
}
	
	
    

    

