package com.ts.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourism";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public AdminLoginController() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = getConnection()) {
            String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // Login successful, create session
                        HttpSession session = request.getSession();
                        session.setAttribute("admin", username);

                        // Redirect to admin dashboard or home page
                        response.sendRedirect("adminHome.jsp");
                    } else {
                        // Login failed, return to admin login page with error message
                        request.setAttribute("errorMessage", "Invalid username or password");
                        request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error during admin login", e);
        }
    }

    private Connection getConnection() throws SQLException {
        // Load MySQL JDBC Driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }

        // Create a connection to the database
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
