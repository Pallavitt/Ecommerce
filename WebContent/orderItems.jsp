<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Items</title>
</head>
<body>
<h2>Order Items</h2>
<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Order Date</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total Amount</th>
    </tr>
    <c:forEach var="item" items="${orderItems}">
        <tr>
            <td>${item.orderid}</td>
            <td>${item.orderdate}</td>
            <td>${item.productname}</td>
            <td>${item.quantity}</td>
            <td>${item.price}</td>
            <td>${item.totalamount}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
