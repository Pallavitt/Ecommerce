package com.cruds.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cruds.entity.Cart;

@WebServlet("/QuantityServlet")
public class QuantityServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        
        ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");



		if (action != null && id >= 1)
		{
			if (action.equals("inc"))
			{
				for (Cart c : cart_list) 
				{
					if (c.getProductid() == id)
					{
						int quantity = c.getQuantity();
						quantity++;
						c.setQuantity(quantity);
						response.sendRedirect("cart.jsp");
					}
				}
			}

			if (action.equals("dec")) 
			{
				for (Cart c : cart_list) 
				{
					if (c.getProductid() == id && c.getQuantity() > 1)
					{
						int quantity = c.getQuantity();
						quantity--;
						c.setQuantity(quantity);
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			}
		} 
		else 
		{
			response.sendRedirect("cart.jsp");
		}
    }
}
