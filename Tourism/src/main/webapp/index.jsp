<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome to Help the Tourists</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css"> <!-- Ensure this path is correct -->
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
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        nav ul li {
            margin: 0 10px;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: block;
            text-align: center;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .content {
            margin: 20px;
            padding: 20px;
            background-color: #FFFFFF80;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to Help the Tourists</h1>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropbtn">Login</a>
                    <div class="dropdown-content">
                        <a href="login.jsp">User Login</a>
                        <a href="adminLogin.jsp">Admin Login</a>
                    </div>
                </li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <div class="content">
            <p>Your journey to discover the best homestays and tourism places starts here!</p>
            <section>
                <h2>Featured Homestays</h2>
                <!-- Include featured homestays here -->
            </section>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Help the Tourists</p>
    </footer>
</body>
</html>