package com.cruds.db;

import com.cruds.entity.Orders;
import com.cruds.entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO 
{
	public boolean insertOrder(Orders order)
	{
        boolean result = false;
        
        
        try (Connection conn = DBConnectionManager.getConnection())
        {
            String query = "insert into orders (productid, userid, quantity, orderdate) values(?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getProductid());
            ps.setInt(2, order.getUserid());
            ps.setInt(3, order.getQuantity());
            ps.setString(4, order.getOrderdate());
            ps.executeUpdate();
            
            //System.out.println(rs.getInt(1));
            int orderId;
            try (ResultSet rs = ps.getGeneratedKeys())
            {
                if (rs.next()) 
                {
                    orderId = rs.getInt(1);
                } 
                else 
                {
                    return false; // Failed to get order ID
                }
            }
            // insert into order items
            
            result = true;
        } 
        catch (SQLException e) 
        {
           e.printStackTrace();
        }
        return result;
    }
	

	public List<Orders> userOrders(int userid) {
        List<Orders> list = new ArrayList<>();
        try (Connection conn = DBConnectionManager.getConnection()) {
            String query = "select * from orders where userid=? order by orders.orderid desc";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                ProductDAO productdao = new ProductDAO();
                int productid = rs.getInt("productid");
                Product product = productdao.getSingleProduct(productid);
                order.setOrderid(rs.getInt("orderid"));
                order.setProductid(productid);
                order.setProductname(product.getProductname());
                order.setPrice(product.getPrice() * rs.getInt("quantity"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOrderdate(rs.getString("orderdate"));
                list.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }



    
    public List<Orders> getCurrentUserOrders(int userid, LocalDate startDate, LocalDate endDate) {
        List<Orders> list = new ArrayList<>();
        try (Connection conn = DBConnectionManager.getConnection()) {
            String query = "select * from orders where userid=? and orderdate between ? and ? order by orders.orderid desc";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            ps.setString(2, startDate.toString());
            ps.setString(3, endDate.toString());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders order = new Orders();
                ProductDAO productdao = new ProductDAO();
                int productid = rs.getInt("productid");
                Product product = productdao.getSingleProduct(productid);
                order.setOrderid(rs.getInt("orderid"));
                order.setProductid(productid);
                order.setProductname(product.getProductname());
                order.setPrice(product.getPrice() * rs.getInt("quantity"));
                order.setQuantity(rs.getInt("quantity"));
                order.setOrderdate(rs.getString("orderdate"));

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public void cancelOrder(int orderid) 
    {
        //boolean result = false;
        try (Connection conn = DBConnectionManager.getConnection())
        {
            String query = "delete from orders where orderid=?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            ps.execute();
            //result = true;
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        //return result;
    }
}