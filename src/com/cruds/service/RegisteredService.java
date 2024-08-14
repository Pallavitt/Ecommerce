package com.cruds.service;

import com.cruds.db.UserDAO;
import com.cruds.entity.User;

public class RegisteredService 
{
	 private UserDAO userdao;

	    public RegisteredService () 
	    {
	        userdao = new UserDAO();
	    }

	    public boolean isEmailRegistered(User user) 
	    {
	        return userdao.addUser(user.getUsername(), user.getEmail(), user.getPassword());
	    }
}
