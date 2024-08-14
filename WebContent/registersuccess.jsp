<!DOCTYPE html> 
<html> 
<head> 
<title>Registered Successfully</title> 
<style> 
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 0;
    }

    .container {
        background-color: #fff;
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h1 {
        color: green;
    }

    p {
        color: #666;
    }

    .login-btn {
        display: inline-block;
        background-color:  #0056b3;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-top: 20px;
        transition: background-color 0.3s;
    }

    .login-btn:hover {
        background-color: grey;
    }
</style> 
</head>
<body> 
    <div class="container">
        <h1>Registration Successful</h1>
        <p>Your account has been successfully created.</p>
        <div class="login-link">
            <p>Proceed to <a href="login.jsp"  class="login-btn">Login</a></p>
        </div>
    </div>
</body> 
</html> 