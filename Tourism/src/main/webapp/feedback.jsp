<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback Form - Help the Tourists</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        /* Add the updated CSS styles here */
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
            max-width: 600px;
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
</head>
<body>
    <header>
        <h1>Help the Tourists - Feedback Form</h1>
    </header>
    <main>
        <!-- Feedback Form Handling -->
        <%
            String message = request.getParameter("message");
            String feedbackSubmitted = request.getParameter("feedbackSubmitted");
            String errorMessage = request.getParameter("errorMessage");

            if ("true".equals(feedbackSubmitted)) {
        %>
            <div class="success">Thank you for your feedback!</div>
        <%
            } else if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <div class="error"><%= errorMessage %></div>
        <%
            }
        %>

        <!-- Feedback Form -->
        <form action="feedback.jsp" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="rating">Rating:</label>
                <div class="rating">
                    <input type="radio" name="rating" id="star5" value="5"><label for="star5">★</label>
                    <input type="radio" name="rating" id="star4" value="4"><label for="star4">★</label>
                    <input type="radio" name="rating" id="star3" value="3"><label for="star3">★</label>
                    <input type="radio" name="rating" id="star2" value="2"><label for="star2">★</label>
                    <input type="radio" name="rating" id="star1" value="1" required><label for="star1">★</label>
                </div>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit">Submit Feedback</button>
        </form>

        <%
            // Database connection details
            String DB_URL = "jdbc:mysql://localhost:3306/tourism";
            String DB_USER = "root";
            String DB_PASSWORD = "root";
            Connection connection = null;
            PreparedStatement preparedStatement = null;

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Get form data
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String messageText = request.getParameter("message");
                String ratingStr = request.getParameter("rating");

                if (name != null && email != null && messageText != null && ratingStr != null) {
                    try {
                        int rating = Integer.parseInt(ratingStr);

                        // Validate inputs
                        if (name.isEmpty() || email.isEmpty() || messageText.isEmpty() || rating < 1 || rating > 5) {
                            response.sendRedirect("feedback.jsp?errorMessage=All fields are required and rating must be between 1 and 5.");
                        } else {
                            // Connect to database and insert feedback
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                            String sql = "INSERT INTO feedback (name, email, message, rating) VALUES (?, ?, ?, ?)";
                            preparedStatement = connection.prepareStatement(sql);
                            preparedStatement.setString(1, name);
                            preparedStatement.setString(2, email);
                            preparedStatement.setString(3, messageText);
                            preparedStatement.setInt(4, rating);

                            int result = preparedStatement.executeUpdate();
                            if (result > 0) {
                                response.sendRedirect("index.jsp");
                            } else {
                                response.sendRedirect("feedback.jsp?errorMessage=Failed to submit feedback.");
                            }
                        }
                    } catch (Exception e) {
                        response.sendRedirect("feedback.jsp?errorMessage=An error occurred while submitting feedback: " + e.getMessage());
                    } finally {
                        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { }
                        if (connection != null) try { connection.close(); } catch (SQLException e) { }
                    }
                } else {
                    response.sendRedirect("feedback.jsp?errorMessage=All fields are required.");
                }
            }
        %>
    </main>
    <footer>
        
    </footer>
</body>
</html>