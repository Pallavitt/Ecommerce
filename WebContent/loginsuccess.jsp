<!DOCTYPE html>
<html>
<head>
    <title>Login Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: lightblue;
            text-align: center;
        }
        h1 {
            color: darkblue;
        }
        p {
            color: darkblue;
        }
    </style>
</head>
<body>

<%
    com.cruds.entity.User auth = (com.cruds.entity.User) session.getAttribute("auth");
    if (auth != null) { 
%>
    <h1>Welcome, <%= auth.getUsername() %>!</h1>
    <p>Your login was successful. You are now logged in to your account.</p>
    <script>
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 3000); 
    </script>
<%
    } else {
        response.sendRedirect("login.jsp"); 
    }
%>

</body>
</html>
