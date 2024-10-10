<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register - Help the Tourists</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Help the Tourists - Register</h1>
        
        <style>
      body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #E0BC9F;
            
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #D29844;
            color: white;
            padding: 15px 0;
            text-align: center;
        }

        main {
            max-width: 400px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        form {
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        .rating {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .rating input {
            display: none;
        }

        .rating label {
            font-size: 2rem;
            color: #ddd;
            cursor: pointer;
            transition: color 0.2s;
        }

        .rating label:hover,
        .rating label:hover ~ label,
        .rating input:checked ~ label {
            color: #f5c518;
        }

        button[type="submit"] {
            display: inline-block;
            background-color: #D29844;
            color: white;
            font-size: 16px;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        button[type="submit"]:hover {
            background-color: #b07a37;
        }

        .success,
        .error {
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            border-radius: 4px;
        }

        .success {
            color: #2f7d32;
            background-color: #dff2da;
            border: 1px solid #2f7d32;
        }

        .error {
            color: #d32f2f;
            background-color: #f9d6d5;
            border: 1px solid #d32f2f;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #222;
            color: #fff;
        }
    </style>
        
    </header>
    <main>
        <form action="UserRegister" method="post">
            <input type="hidden" name="action" value="register">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <input type="submit">
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a>.</p>

        
    </main>
    <footer>
        <p>&copy; 2024 Help the Tourists</p>
    </footer>
</body>
</html>
