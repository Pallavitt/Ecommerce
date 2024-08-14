<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.cruds.db.DBConnectionManager"%>
<%@page import="com.cruds.entity.User"%>
<%@page import="com.cruds.entity.Cart"%>
<%@page import="com.cruds.db.ProductDAO"%>
<%@page import="java.util.*"%>

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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Page</title>
      
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-SSpb3YH9dWJhAcpZh0mKXWb9LlHsMHwzgp/LF+dyFO1NYmxx+XH9FtNuKHLwSwg6" crossorigin="anonymous">
    
    <style>
         body 
         {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
         }

         header 
         {
            text-align: center;
            background-color: #f2f2f2;
            padding: 10px 0;
         }  

         nav
         {
            background-color: #333;"WebContent/mainpage.jsp"
            color: #fff;
            text-align: center;
            padding: 10px 0;
         }

         nav ul 
         {
            list-style-type: none;
            padding: 0;
         }

         nav ul li 
         {
            display: inline;
            margin-right: 10px;
         }

         nav ul li a
         {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #fff;
            border-radius: 5px;
         }
         
        

         main 
         {
            text-align: center;
            padding: 20px;
         }
  
         .featured-products 
         {
            padding: 30px 0;
         }
  
         .featured-products h2 
         {
            font-family: Arial, sans-serif;
            color: teal;
            text-align: center;
            font-size: 30px;
            margin-bottom: 10px;
         }
        
         .product 
         {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            text-align: center;
            margin-bottom: 30px;
         }

         .product img 
         {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 0px;
            transition: transform 0.3s ease;
         }

         .product img:hover 
         {
            transform: scale(1.05);
         }
  
         .product h3 
         {
            text-size: 20px;
            margin-bottom: 10px;
            text-transform: uppercase;
            color: black;
         }
  
         .product p 
         {
            font-size: 20px;
            color: black;
            margin-bottom: 20px;
         }
         
         
         button
         {
            background-color: #007bff; 
            color: #ffffff; 
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
         }
         
        

         button:hover 
         {
            background-color: #0056b3; 
         }

         footer 
         {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color:#333;
            color: red;
            padding: 1px 0;
         }
    </style>
</head>

<body>
    <header>
        <div class="container">
            <h1>E-Commerce Website</h1>
            <nav>
                <ul>
                	<li><a href="index.jsp" class="button"><i class="fas fa-home"></i> Home</a></li>              
                    <li><a href="orders.jsp">Orders <i class="fas fa-history"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <i class="fas fa-shopping-cart"></i><span class="badge badge-danger">${cart_list.size()}</span> </a></li>
                    <li><a href="login.jsp">Login <i class="fas fa-user"></i></a></li>                
                </ul>
            </nav>
        </div>
    </header>
    
   
    <section class="featured-products">
        <div class="container">
           <h2> ALL PRODUCTS </h2>
            <div class="product">
                <img src="product images/image1.jpg" alt="Titan">
                <h3>Titan</h3>
                <p class="price">$3000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="1">
                    <input type="hidden" name="productname" value="Titan">
                    <input type="hidden" name="productprice" value="3000.00">
                    <input type="hidden" name="productimageurl" value="product images/image1.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>

       
            <div class="product">
                <img src="product images/image2.jpg" alt="Fossil">
                <h3>Fossil</h3>
                <p class="price">$5000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="2">
                    <input type="hidden" name="productname" value="Fossil">
                    <input type="hidden" name="productprice" value="5000.00">
                    <input type="hidden" name="productimageurl" value="product images/image2.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image3.jpg" alt="Rolex">
                <h3>Rolex</h3>
                <p class="price">$20000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="3">
                    <input type="hidden" name="productname" value="Rolex">
                    <input type="hidden" name="productprice" value="20000.00">
                    <input type="hidden" name="productimageurl" value="product images/image3.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>               
            </div>
            
            <div class="product">
                <img src="product images/image4.jpg" alt="Joker & Witch">
                <h3>Joker & Witch</h3>
                <p class="price">$12000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="4">
                    <input type="hidden" name="productname" value="Joker & Witch">
                    <input type="hidden" name="productprice" value="12000.00">
                    <input type="hidden" name="productimageurl" value="product images/image4.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>                  
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image5.jpg" alt="Dior">
                <h3>Dior</h3>
                <p class="price">$15000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="5">
                    <input type="hidden" name="productname" value="Dior">
                    <input type="hidden" name="productprice" value="15000.00">
                    <input type="hidden" name="productimageurl" value="product images/image5.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image6.jpg" alt="Boat">
                <h3>Boat</h3>
                <p class="price">$4000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="6">
                    <input type="hidden" name="productname" value="Boat">
                    <input type="hidden" name="productprice" value="4000.00">
                    <input type="hidden" name="productimageurl" value="product images/image6.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image7.jpg" alt="Omega">
                <h3>Omega</h3>
                <p class="price">$8000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="7">
                    <input type="hidden" name="productname" value="Omega">
                    <input type="hidden" name="productprice" value="8000.00">
                    <input type="hidden" name="productimageurl" value="product images/image7.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image8.jpg" alt="Casio">
                <h3>Casio</h3>
                <p class="price">$18000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="8">
                    <input type="hidden" name="productname" value="Casio">
                    <input type="hidden" name="productprice" value="18000.00">
                    <input type="hidden" name="productimageurl" value="product images/image8.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
               
            
           <div class="product">
                <img src="product images/image9.jpg" alt="Fastrack">
                <h3>Fastrack</h3>
                <p class="price">$2500.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="9">
                    <input type="hidden" name="productname" value="Fastrack">
                    <input type="hidden" name="productprice" value="2500.00">
                    <input type="hidden" name="productimageurl" value="product images/image9.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
            
            <div class="product">
                <img src="product images/image10.jpg" alt="Burberry">
                <h3>Burberry</h3>
                <p class="price">$10000.00</p>
               
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productid" value="10">
                    <input type="hidden" name="productname" value="Burberry">
                    <input type="hidden" name="productprice" value="10000.00">
                    <input type="hidden" name="productimageurl" value="product images/image10.jpg">
                  
                    <button type="submit" class="btn-dark">Add to Cart</button>
                </form>
            </div>
           
        </div>
    </section>

    <footer>
        <p>&copy; 2024 E-commerce Website. All rights reserved.</p>
    </footer>
</body>
</html>