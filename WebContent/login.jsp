<%@page import="com.cruds.entity.User"%>

 <%
      User auth = (User) request.getSession().getAttribute("auth");
      if(auth != null)
      {
    	  response.sendRedirect("index.jsp");
      }
 %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
        }
        .card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #0056b3;
            color: #fff;
            font-size: 24px;
            padding: 10px;
            text-align: center;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .card-body {
            padding: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px; 
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 10px;
        }
        button {
            background-color: #0056b3;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: grey;
        }
        .text-center {
            text-align: center;
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: blue;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">User Login</div>
            <div class="card-body">
                <form action="LoginServlet" method="post">
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email" placeholder="Enter your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password" placeholder="Enter your Password" required>
                    </div>
                    <div class="text-center">
                        <button type="submit">Login</button>
                    </div>
                    <div class="login-link">
                       <p>Don't have an account? <a href="signup.jsp">Signup</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>