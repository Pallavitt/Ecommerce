package com.cruds.servlet;

import com.cruds.db.OrderItemDAO;
import com.cruds.entity.OrderItem;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderItemServlet")
public class OrderItemServlet extends HttpServlet
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // Get the order ID from the request parameter
        String orderIdParam = request.getParameter("orderId");
        int orderId = Integer.parseInt(orderIdParam);

        // Create an instance of OrderItemDAO
        OrderItemDAO orderItemDAO = new OrderItemDAO();

        // Retrieve the list of order items for the given order ID
        List<OrderItem> orderItems = orderItemDAO.getOrderItemsByOrderId(orderId);

        // Set the order items in the request attribute
        request.setAttribute("orderItems", orderItems);

        // Forward the request to a JSP page to display the order items
        request.getRequestDispatcher("orderItems.jsp").forward(request, response);
    }
}
