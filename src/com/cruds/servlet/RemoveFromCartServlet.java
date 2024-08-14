package com.cruds.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cruds.entity.Cart;


@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
			String id = request.getParameter("id");
			if (id != null)
			{
				ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				if (cart_list != null) 
				{
					for (Cart c : cart_list) 
					{
						if (c.getProductid() == Integer.parseInt(id))
						{
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				response.sendRedirect("cart.jsp");

			} 
			else 
			{
				response.sendRedirect("cart.jsp");
			}
	}
}

		
	

	    
		
	


