<%@page import="java.util.List"%>
<%@page import="com.cruds.db.DBConnectionManager"%>
<%@page import="com.cruds.entity.User"%>
<%@page import="com.cruds.entity.Cart"%>
<%@page import="com.cruds.db.ProductDAO"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-SSpb3YH9dWJhAcpZh0mKXWb9LlHsMHwzgp/LF+dyFO1NYmxx+XH9FtNuKHLwSwg6" crossorigin="anonymous">
    <title>E-commerce website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        header {
            text-align: center;
            background-color: #f2f2f2;
            padding: 10px 0;
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

        .main {
            color: black;
            padding: 50px 0;
            text-align: center;
        }

        .main h2 {
            font-size: 30px;
            margin-bottom: 20px;
        }

        .main p {
            font-size: 25px;
            margin-bottom: 30px;
        }

        .main .btn {
            display: inline-block;
            background-color: teal;
            color: #fff;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 20px;
            transition: background-color 0.3s ease;
        }

        .main .btn:hover {
            background-color: cadetblue;
        }

        .featured-products {
            padding: 30px 0;
        }

        .featured-products h2 {
            text-align: center;
            font-size: 20px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .product {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            text-align: center;
            margin-bottom: 30px;
        }

        .product img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 0px;
            transition: transform 0.3s ease;
        }

        .product img:hover {
            transform: scale(1.05);
        }

        .product h3 {
            text-size: 20px;
            margin-bottom: 10px;
            text-transform: uppercase;
            color: black;
        }

        .product p {
            font-size: 20px;
            color: #888;
            margin-bottom: 20px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color: #333;
            color: red;
            padding: 1px 0;
        }
    </style>
</head>
<body>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth != null) 
    {
        request.setAttribute("auth", auth);
    }
%>

   <% 
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


<header>
    <h1>E-Commerce Website</h1>
</header>

<nav>
    <ul>
           <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <i class="fas fa-shopping-cart"></i><span class="badge badge-danger">${cart_list.size()}</span> </a></li>

        <% if(auth != null) { %>
            <li><a href="orders.jsp">Orders <i class="fas fa-history"></i></a></li>
            <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>

        <% } else { %>
            <li><a href="login.jsp">Login <i class="fas fa-user"></i></a></li>           
        <% } %>
    </ul>
</nav>

<section class="main">
    <div class="container">
        <h2>Welcome to our E-Commerce Website!</h2>
        <p>Explore the best products of your choice.</p>
        <a href="mainpage.jsp" class="btn" ><i class="fas fa-shopping-bag"></i> Shop Now</a>
    </div>
</section>

<section class="featured-products">
    <div class="container">
        <h2>Featured Products</h2>
        <div class="product">
            <img src="product images/image1.jpg" alt="Product 1">
            <h2>Titan</h2>
            <p>$3000.00</p>
        </div>

        <div class="product">
            <img src="product images/image2.jpg" alt="Product 2">
            <h3>Fossil</h3>
            <p>$5000.00</p>
        </div>

        <div class="product">
            <img src="product images/image3.jpg" alt="Product 3">
            <h3>Rolex</h3>
            <p>$20000.00</p>
        </div>

        <div class="product">
            <img src="product images/image4.jpg" alt="Product 4">
            <h3>Joker & Witch</h3>
            <p>$12000.00</p>
        </div>
    </div>
</section>



<footer>
    <p>&copy; 2024 E-Commerce Website. All rights reserved.</p>
</footer>

</body>
</html>
