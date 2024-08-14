package com.cruds.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cruds.db.OrdersDAO;

@WebServlet("/CancelOrderServlet")
public class CancelOrderServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String orderid = request.getParameter("orderid");
		if(orderid != null)
		{
			OrdersDAO orderdao = new OrdersDAO();
			orderdao.cancelOrder(Integer.parseInt(orderid));
		}
		response.sendRedirect("orders.jsp");
	}
}
			
		
	


