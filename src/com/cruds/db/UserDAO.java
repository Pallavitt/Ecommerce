package com.cruds.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cruds.entity.User;

public class UserDAO {

    public boolean addUser(String username, String email, String password)
    {
       
        boolean result = false;

        try 
        {
            Connection conn = DBConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO user (username, email, password) VALUES (?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) 
            {
                result = true;
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        } 

        return result;
    }
    
    public User isValidUser(String email, String password)
    {
    	String sql = "SELECT * FROM user WHERE email = ? and password = ?";
    	User user = null;

        try 
        {
            Connection conn = DBConnectionManager.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) 
            {
                user = new User();
                
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
            }
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }

        return user;
    }

    
    public boolean isEmailRegistered(String email)
    {
        boolean isRegistered = false;
        
        try 
        {
        	Connection conn = DBConnectionManager.getConnection();
            
            String query = "SELECT count(*) FROM user WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
           
            
            if(rs.next()) 
            {
                int count = rs.getInt(1);
                if(count > 0)
                {
                    isRegistered = true;
                }
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace(); 
        }
        
        return isRegistered;
    }

}
