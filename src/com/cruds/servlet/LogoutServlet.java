package com.cruds.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	if(request.getSession().getAttribute("auth")!=null)
    	{
			request.getSession().removeAttribute("auth");
			response.sendRedirect("login.jsp");
		}
    	else 
    	{
			response.sendRedirect("index.jsp");
		}
    }
}
