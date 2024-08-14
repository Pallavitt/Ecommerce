<%@page import="com.cruds.db.ProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.util.List"%>
<%@page import="com.cruds.db.DBConnectionManager"%>
<%@page import="com.cruds.entity.User"%>
<%@page import="com.cruds.entity.Cart"%>
<%@page import="java.text.DecimalFormat"%>
   
    
    <%
      DecimalFormat dcf = new DecimalFormat("#.##");
      request.setAttribute("dcf", dcf);
      User auth = (User) request.getSession().getAttribute("auth");
      if (auth != null) 
      {
         request.setAttribute("person", auth);
      }
      ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
      List<Cart> cartProduct = null;
      if (cart_list != null)
      {
	    ProductDAO pDao = new ProductDAO();
	    cartProduct = pDao.getCartProducts(cart_list);
	    double total = pDao.getTotalCartPrice(cart_list);
	    request.setAttribute("total", total);
	    request.setAttribute("cart_list", cart_list);
      }
    %>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>Cart Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }

         header {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }
        
        h2
        {
            font-family: Arial, sans-serif;
            text-align : center;
            color: brown;
            font-size: 30px;
        }
        
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        nav ul li {
            display: inline-block;
            margin: 0 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
                    }
       

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table td,
        table th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        table th {
            background-color: #f2f2f2;
        }

        .btn {
            text-decoration: none;
            color: black;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        footer 
  {
    position: fixed;
    bottom: 0;
    width: 96%;
    text-align: center;
    background-color:#333;
    color: red;
    padding: 1px 0;
  }
  

    </style>
</head>

<body>

    <header>
        <h1>E-Commerce Website</h1>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="mainpage.jsp">Products <i class="fas fa-shopping-bag"></i></a></li>  
                <li><a href="cart.jsp">Cart <i class="fas fa-shopping-cart"></i><span class="badge badge-danger">${cart_list.size()}</span> </a></li>

            </ul>
        </nav>
    </header>
    
    

    <div class="cart">
        <h2>YOUR CART</h2>
        <div class="container my-3">
		<div class="d-flex py-3">
        <h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> 
       
</div>

        <br>
        <table>
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
				if (cart_list != null) 
				{
					for (Cart c : cartProduct) 
					{
				%>
                <tr>
                    <td><%= c.getProductname() %> </td>
                    <td><%= c.getPrice() %> </td>     
                    </td>
                    
                    <td>
                        <form action="OrderItemServlet" method="post" class="form-inline">
						<input type="hidden" name="productid" value="<%= c.getProductid() %>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="QuantityServlet?action=inc&id=<%= c.getProductid() %>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control"  value="<%= c.getQuantity() %>" readonly> 
								<a class="btn btn-sm btn-decre" href="QuantityServlet?action=dec&id=<%= c.getProductid() %>"><i class="fas fa-minus-square"></i></a>
							</div>
							
						</form>					
                    </td>
                       <td><a href="RemoveFromCartServlet?id=<%= c.getProductid() %>" class="btn btn-sm btn-danger" style="color: white; background-color: brown; ">Remove</a></td>

                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" class="empty-cart-message">Your cart is empty</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div><br><br>
      <form action="OrderItemServlet" method="post" class="form-inline">
        <div style="text-align: center;">
           <a class="mx-3 btn" href="CheckOutServlet" style="background-color: #007bff; color: white; background-color: #0056b3; text-decoration: none; padding:5px;">Check Out</a>
        </div>
      </form>


    <footer>
       <p>&copy; 2024 E-Commerce Website. All rights reserved.</p>
    </footer>

</body>

</html>
