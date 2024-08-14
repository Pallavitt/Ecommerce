<!DOCTYPE html>
<html>
<head>
    
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: lightblue;
            text-align: center;
            font-family: Arial, sans-serif;
        }

        h1 {
            color: #ff6600;
        }

        p {
            font-size: 20px;
            color: #333;
        }

        .button {
            background-color: #ff6600;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
            margin: 10px;
        }

        .button-container {
            text-align: right;
        }

        .smiley {
            color: black;
        }
    </style>
</head>
<body>
    <div class="button-container">
        <a href="index.jsp" class="button"><i class="fas fa-home"></i> Home</a>
        <a href="orders.jsp" class="button"><i class="fas fa-history"></i> Orders</a>
    </div>
    <h1>Thank You for Your Order!</h1>
    <p>Your order has been confirmed.</p>
    <p>Thank you for shopping with us!!  <br><br>Visit again <span class="smiley">&#128522;</span></p>
</body>
</html>
