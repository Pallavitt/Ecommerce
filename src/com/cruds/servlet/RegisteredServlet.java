package com.cruds.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cruds.db.UserDAO;

@WebServlet("/RegisteredServlet")
public class RegisteredServlet extends HttpServlet 
{
    private UserDAO userdao;

    public void init() 
    {
        userdao = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        String email = request.getParameter("email");

        if (userdao.isEmailRegistered(email)) 
        {
            response.sendRedirect("registererror.jsp");
        } 
        else 
        {
            response.sendRedirect("registersuccess.jsp");
        }
    }
}