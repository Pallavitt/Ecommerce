<!DOCTYPE html>
<html>
<head>
<title>Invalid email or password</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    
   
    .container {
        width: 50%;
        margin: 50px auto;
        padding: 20px;
        background-color: #f9f9f9;
    }

        
    h1 {
        color: brown;
    }
    h2 {
        color: black;
    }
    a {
        display: block;
        margin-top: 20px;
        text-decoration: none;
        color: black;
    }
    button {
        padding: 10px 20px;
        background-color: #3498db;
        color: white;
        border: none;
        cursor: pointer;
    }
    button:hover {
        background-color: #2980b9;
    }
    .error-symbol {
        font-size: 30px;
        color: red;
    }
</style>
</head>
<body>  
  <div class = "container">
    <h1 class="error-symbol">&#9888;</h1>
    <h2> Invalid email id or password </h2>
    <a href="login.jsp"> Please try to Login again</a><br>
    <button onclick="location.href='login.jsp';">Login</button>
  </div>
</body>
</html> 