package com.cruds.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cruds.db.OrdersDAO;
import com.cruds.entity.Cart;
import com.cruds.entity.Orders;
import com.cruds.entity.User;


@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date orderdate = new Date();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User auth = (User) request.getSession().getAttribute("auth");
			if(cart_list != null && auth!=null) 
			{
				for(Cart c:cart_list)
				{
					Orders order = new Orders();
					order.setProductid(c.getProductid());
					order.setUserid(auth.getUserid());
					order.setQuantity(c.getQuantity());
					order.setOrderdate(formatter.format(orderdate));
					
					OrdersDAO orderdao = new OrdersDAO();
					boolean result = orderdao.insertOrder(order);
					if(!result) 
					{
						break;
					}
				}
				cart_list.clear();
				response.sendRedirect("placeorder.jsp");
			}
			else 
			{
				if(auth==null || auth.getUserid() == 0) 
				{
					response.sendRedirect("login.jsp");
				}
				else
				{
					response.sendRedirect("cart.jsp");				
				}
		    }
	}
		
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		doGet(request, response);
	}

}