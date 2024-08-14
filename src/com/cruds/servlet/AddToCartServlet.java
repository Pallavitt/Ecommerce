package com.cruds.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cruds.entity.Cart;
import com.cruds.entity.Product;


@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet
{
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	 {
	        
		 ArrayList<Cart> cartList = new ArrayList<>();
         int productid = Integer.parseInt(request.getParameter("productid"));
         Cart c = new Cart();
         c.setProductid(productid);
         c.setQuantity(1);
         
         HttpSession session = request.getSession();
         ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
         if (cart_list == null) 
         {
             cartList.add(c);
             session.setAttribute("cart-list", cartList);
             response.sendRedirect("mainpage.jsp");
         } 
         else 
         {
             cartList = cart_list;

             boolean exist = false;
             for (Cart cart : cart_list) 
             {
                 if (cart.getProductid() == productid) 
                 {
                     exist = true;
                     break; 
                 }
             }


             if (!exist) 
             {
                 cartList.add(c);
                 response.sendRedirect("mainpage.jsp");
                 
             }
         }
     }
}
	    


