<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Page</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-SSpb3YH9dWJhAcpZh0mKXWb9LlHsMHwzgp/LF+dyFO1NYmxx+XH9FtNuKHLwSwg6" crossorigin="anonymous">
    
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .signup-form input[type="text"],
        .signup-form input[type="password"],
        .signup-form input[type="tel"],
        .signup-form button {
            font-size: 16px;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            transition: border-color 0.3s ease;
        }

        .signup-form input[type="text"]:focus,
        .signup-form input[type="password"]:focus,
        .signup-form input[type="tel"]:focus {
            border-color: #007bff;
            outline: none;
        }

        .signup-form button {
            background-color: #2196F3;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup-form button:hover {
            background-color: grey;
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
            color: grey;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sign Up</h1>
        <form class="signup-form" action="UserServlet" method="POST"> 
            <input type="text" name="username" placeholder="Enter your Username" required>
            <input type="text" name="email" placeholder="Enter your Email" required>
            <input type="password" name="password" placeholder="Enter your Password" required>
            
            <button type="submit">Sign Up</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</body>
</html>
