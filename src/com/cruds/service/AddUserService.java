package com.cruds.service;

import com.cruds.db.UserDAO;
import com.cruds.entity.User;

public class AddUserService
{
    private UserDAO userdao;

    public AddUserService() 
    {
        userdao = new UserDAO();
    }

    public boolean registerUser(User user) 
    {
        return userdao.addUser(user.getUsername(),user.getEmail(),user.getPassword());
    }

}
