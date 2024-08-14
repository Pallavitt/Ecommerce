package com.cruds.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cruds.db.OrdersDAO;
import com.cruds.entity.Cart;
import com.cruds.entity.Orders;
import com.cruds.entity.User;

@WebServlet("/OrderNowServlet")
public class OrderNowServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date orderdate = new Date();

        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        if (auth != null)
        {
            String productid = request.getParameter("productid");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity <= 0) 
            {
                quantity = 1;
            }
            Orders order = new Orders();
            order.setProductid(Integer.parseInt(productid));
            order.setUserid(auth.getUserid()); 
            order.setQuantity(quantity);
            order.setOrderdate(formatter.format(orderdate));

            OrdersDAO orderdao = new OrdersDAO();
            boolean result = orderdao.insertOrder(order);
            if (result) 
            {
                ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
                if (cart_list != null) 
                {
                    for (Cart c : cart_list)
                    {
                        if (c.getProductid() == Integer.parseInt(productid)) 
                        {
                            cart_list.remove(cart_list.indexOf(c));
                            break;
                        }
                    }
                }
                response.sendRedirect("placeorder.jsp");
            } 
            else
            {
                response.sendRedirect("ordererror.jsp");
            }
        }
        else 
        {
            response.sendRedirect("login.jsp");
        }
    }
}
