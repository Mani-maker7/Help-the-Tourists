<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String name = (String) session.getAttribute("name");
 String email = (String) session.getAttribute("email");
 String password =(String) session.getAttribute("password");
 
 
 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Tourism Platform</title>
    <!-- Add your CSS and JS files here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;        
            background-color: #E0BC9F;
        }
        header {
            background-color: #D29844;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .content {
            margin: 20px;
            padding: 20px;
            background-color: #FFFFFF99;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        footer {
            background-color: #f2f2f2;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to the Tourism Platform</h1>
        <p>Your gateway to explore beautiful homestays and nearby tourism places.</p>
    </header>

    <nav>
        <a href="home.jsp">Home</a>
        <a href="tourismPlaces.jsp">Tourism Places</a>
        <a href="contact.jsp">Contact</a>
        <a href="userlogout.jsp">Logout</a>
    </nav>

    <div class="content">
        <h2>Hello, <%= name %>!</h2>
        <p>We are glad to have you here. Explore the site using the navigation bar above.</p>

       
    <footer>
        <p>&copy; 2024 Tourism Website</p>
    </footer>
</body>
</html>