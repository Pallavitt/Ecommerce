package com.cruds.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cruds.db.UserDAO;
import com.cruds.entity.User;
import com.cruds.service.AddUserService;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(username, email, password);
        AddUserService userService = new AddUserService();
        
        UserDAO userDAO = new UserDAO();
        boolean isEmailRegistered = userDAO.isEmailRegistered(email);

        if (isEmailRegistered) 
        {
            response.sendRedirect("registererror.jsp");
        } 
        else 
        {
            boolean isSuccess = userService.registerUser(user);

            if(isSuccess) 
            {
                response.sendRedirect("registersuccess.jsp");
            } 
            else
            {
                response.sendRedirect("registererror.jsp");
            }
        }
    }

}