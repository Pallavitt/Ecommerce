package com.cruds.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cruds.db.UserDAO;
import com.cruds.entity.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet 
{
    
    private UserDAO userdao;

    public void init() 
    {
        userdao = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = userdao.isValidUser(email, password);
        
		if (user != null) 
		{
			request.getSession().setAttribute("auth", user);

			response.sendRedirect("loginsuccess.jsp");
		}
        else 
        {
            response.sendRedirect("Invalid.jsp");   
        }
    }
}
		
    
		

    

