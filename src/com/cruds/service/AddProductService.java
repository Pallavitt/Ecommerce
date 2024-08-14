package com.cruds.service;

import com.cruds.db.ProductDAO;
import com.cruds.entity.Product;

public class AddProductService 
{
	 public static void main(String[] args)
	 {
		 Product product1 = new Product("Titan", 3000.00, "product images/image1.jpg");
	     Product product2 = new Product("Fossil", 5000.00, "product images/image2.jpg");
	     Product product3 = new Product("Rolex", 20000.00, "product images/image3.jpg");
	     Product product4 = new Product("Joker & Witch", 12000.00, "product images/image4.jpg");
	     Product product5 = new Product("Dior", 15000.00, "product images/image5.jpg");
	     Product product6 = new Product("Boat", 4000.00, "product images/image6.jpg");
	     Product product7 = new Product("Omega", 8000.00, "product images/image7.jpg");
	     Product product8 = new Product("Casio", 18000.00, "product images/image8.jpg");
	     Product product9 = new Product("Fastrack", 2500.00, "product images/image9.jpg");
	     Product product10 = new Product("Burberry", 10000.00, "product images/image10.jpg");
	     
	     ProductDAO productDAO = new ProductDAO();
	        
	     try
	     {
	    	 productDAO.addproduct(product1);
	         productDAO.addproduct(product2);
	         productDAO.addproduct(product3);
	         productDAO.addproduct(product4);
	         productDAO.addproduct(product5);
	         productDAO.addproduct(product6);
	         productDAO.addproduct(product7);
	         productDAO.addproduct(product8);
	         productDAO.addproduct(product9);
	         productDAO.addproduct(product10);
	         
	         System.out.println("Products have been added successfully");
	     }
	     catch (Exception e) 
	     {
	    	 e.printStackTrace();
	         System.out.println("Failed to add products");
	     }
	 }
}	           
	        
	           
	            
	           
	        
	        
	    


	   
	        
	       
	       
	       
	       