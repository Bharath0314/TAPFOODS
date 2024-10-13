<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmed</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #334756; 
            font-size: 24px;
        }

        p {
            font-size: 18px;
            color: #555; 
            margin-bottom: 20px;
        }

        .emoji {
            font-size: 50px;
            margin-bottom: 20px;
            color: #ff6600;
        }

        .emoji::before {
            content: '\1F60A'; 
        }

        .link-btn {
            background-color: #334756; 
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
            display: inline-block;
            margin-top: 30px;
        }

        .link-btn:hover {
            background-color: #001f3f; 
        }
        
        .bg-pattern {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('https://via.placeholder.com/600x600'); /* Placeholder image */
            opacity: 0.2; 
            z-index: -1; 
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">&#x1F60A;</div>
        <h2>Your Order is Confirmed!</h2>
        <p>Chill, relax, food is on your way!</p>
        <a href="Trackorder.jsp" class="link-btn">Track Order</a>
    </div>
</body>
</html>
