package com.cruds.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cruds.entity.Cart;
import com.cruds.entity.Product;

public class ProductDAO 
{
	public void addproduct(Product p)
	{
		String sql = "insert into product(productname,price,image) values(?,?,?)";
		int rows = 0;
		
		try(Connection conn = DBConnectionManager.getConnection())
		{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductname());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getImage());
			
			rows = ps.executeUpdate();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return;
	}
	
	public List<Product> getAllProducts() 
	{
        List<Product> products = new ArrayList<>();
        
        try (Connection conn = DBConnectionManager.getConnection())
        {
            String query = "select * from product";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) 
            {
            	Product product = new Product();
                product.setProductid(rs.getInt("productid"));  
                product.setProductname(rs.getString("productname"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));

                products.add(product);
            }

        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return products;
    }
	
	public Product getSingleProduct(int productid)
	{
		 Product row = null;
	     try (Connection conn = DBConnectionManager.getConnection())
	     {
	            String query = "select * from product where productid=? ";

	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setInt(1, productid);
	            
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) 
	            {
	            	row = new Product();
	                row.setProductid(rs.getInt("productid"));
	                row.setProductname(rs.getString("productname"));
	                row.setPrice(rs.getDouble("price"));
	                row.setImage(rs.getString("image"));
	            }
	        } 
	        catch (Exception e) 
	        {
	            e.printStackTrace();           
	        }

	        return row;
	    }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList)
	{
        double sum = 0;
        try (Connection conn = DBConnectionManager.getConnection())
        {
            if (cartList.size() > 0)
            {
                for (Cart item : cartList) 
                {
                    String query = "select price from product where productid=?";
                    
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1, item.getProductid());
                    
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) 
                    {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }
                }
            }
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return sum;
    }
	
    public List<Cart> getCartProducts(ArrayList<Cart> cartList)
    {
	    List<Cart> products = new ArrayList<>();
	    
	    try (Connection conn = DBConnectionManager.getConnection())
	    {
	    	if (cartList.size() > 0)
	    	{
               for (Cart item : cartList) 
               {
            	   String query = "select * from product where productid=?";
                 
            	   PreparedStatement ps = conn.prepareStatement(query);
                   ps.setInt(1, item.getProductid());
                   
                   ResultSet rs = ps.executeQuery();
                   while (rs.next()) 
                   {
                        Cart product = new Cart();
                        
                        product.setProductid(rs.getInt("productid"));  
                        product.setProductname(rs.getString("productname"));
                        product.setPrice(rs.getDouble("price")*item.getQuantity());
                        product.setQuantity(item.getQuantity());

                        products.add(product);
                    }
                }
            }
	    }
	    catch (SQLException e) 
        {
            e.printStackTrace();  
        }
	    
	    return products;
    }	        
}
