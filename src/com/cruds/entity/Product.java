package com.cruds.entity;

public class Product 
{
	private int productid;
	private String productname;
	private double price;
	private String image;
	
	public Product() 
	{
        super();
    }
	
	public Product(String productname, double price, String image) 
	{
		super();
		this.productname = productname;
		this.price = price;
		this.image = image;
	}
	
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}


	@Override
	public String toString() 
	{
		return "product [productname=" + productname + ", price=" + price + ", image="
				+ image + "]";
	}
	
	
	
	

}
