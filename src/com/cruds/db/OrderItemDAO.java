package com.cruds.db;

import com.cruds.entity.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderItemDAO 
{

    private static final Logger LOGGER = Logger.getLogger(OrderItemDAO.class.getName());

    public List<OrderItem> getOrderItemsByOrderId(int orderId) 
    {
        List<OrderItem> orderItems = new ArrayList<>();
        try (Connection conn = DBConnectionManager.getConnection()) {
            String query = "SELECT orderid, orderdate, productname, quantity, price FROM orderitem WHERE orderid = ?";
            try (PreparedStatement ps = conn.prepareStatement(query)) {
                ps.setInt(1, orderId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        OrderItem orderItem = new OrderItem(
                                rs.getInt("orderid"),
                                rs.getString("orderdate"),
                                rs.getString("productname"),
                                rs.getInt("quantity"),
                                rs.getDouble("price")
                        );
                        orderItems.add(orderItem);
                    }
                }
            }
        } catch (SQLException e)
        {
            LOGGER.log(Level.SEVERE, "Error retrieving order items", e);
        }
        return orderItems;
    }
}
