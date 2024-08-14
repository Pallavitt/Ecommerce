<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cruds.db.OrdersDAO"%>
<%@page import="com.cruds.entity.User"%>
<%@page import="com.cruds.entity.Orders"%>
<%@page import="java.util.*"%>

<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    User auth = (User) request.getSession().getAttribute("auth");
    List<Orders> orders = null;
    double totalAmount = 0.0;

    if (auth != null) {
        int userId = auth.getUserid(); // Retrieve user ID
        request.setAttribute("person", auth);
        OrdersDAO orderdao = new OrdersDAO();
        orders = orderdao.userOrders(userId); // Pass user ID to retrieve orders

        for (Orders o : orders) {
            totalAmount += o.getPrice();
        }
    } else {
        response.sendRedirect("login.jsp");
        return; // Exit if user is not authenticated
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-SSpb3YH9dWJhAcpZh0mKXWb9LlHsMHwzgp/LF+dyFO1NYmxx+XH9FtNuKHLwSwg6" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Order Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 20px;
        }
        header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        h1 {
            text-align: center;
            color: black;
        }
        h2 {
            text-align: center;
            color: brown;
            font-size: 25px;
        }
        nav {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin-right: 10px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #fff;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        td {
            background-color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: #777;
        }
        .total-amount {
            text-align: right;
            font-weight: bold;
            padding: 15px;
            background-color: #f2f2f2;
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 96%;
            text-align: center;
            background-color:#333;
            color: red;
            padding: 1px 0;
        }
        .content {
            max-height: 80vh;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="content">
    <header>
        <h1>E-Commerce Website</h1>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a></li>
                <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </nav>
    </header>
    <h2>Order Items</h2>
    <table>
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
            <th scope="col">Cancel</th>
        </tr>
        </thead>
        <tbody>
        <%
            if (orders != null && !orders.isEmpty()) {
                for (Orders o : orders) {%>
                    <tr>
                        <td><%=o.getOrderdate() %></td>
                        <td><%=o.getProductname() %></td>
                        <td><%=o.getQuantity() %></td>
                        <td><%=dcf.format(o.getPrice()) %></td>
                        <td><a class="btn btn-sm btn-danger" style="color:white; padding:7px; background-color: brown; text-decoration: none;" href="CancelOrderServlet?orderid=<%= o.getOrderid() %>">Cancel Order</a></td>
                    </tr>
                    <%    }
            } else { %>
                <tr>
                    <td colspan="5" class="no-data">Orders not found</td>
                </tr>
                <% } %>
        </tbody>
    </table>
    <div class="total-amount">
        Total Amount: <%=dcf.format(totalAmount) %>
    </div>
</div>
<footer>
    <p>&copy; 2024 E-Commerce Website. All rights reserved.</p>
</footer>
</body>
</html>
