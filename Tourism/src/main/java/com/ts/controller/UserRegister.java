package com.ts.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Annotate the servlet for easy mapping

public class UserRegister extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // PrintWriter to send output to client
        PrintWriter out = response.getWriter();

        // Check if user already exists in the database
        if (isUserExists(email)) {
            out.println("<html><body>");
            out.println("<h3>User with this email already exists.</h3>");
            out.println("<a href='" + request.getContextPath() + "/register.jsp'>Try Again</a>");
            out.println("</body></html>");
            return;
        }

        // JDBC variables
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Load JDBC driver (optional since JDBC 4.0)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism", "root", "root");

            // SQL insert statement
            String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

            // Prepare statement
            statement = connection.prepareStatement(sql);

            // Set parameters
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);

            // Execute update
            int rowsInserted = statement.executeUpdate();

            // Check if insert was successful
            if (rowsInserted > 0) {
                // Redirect to login.jsp if registration is successful
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                out.println("<html><body>");
                out.println("<h3>Registration failed. Please try again.</h3>");
                out.println("<a href='" + request.getContextPath() + "/register.jsp'>Try Again</a>");
                out.println("</body></html>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<html><body>");
            out.println("<h3>Database Driver not found!</h3>");
            out.println("</body></html>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<html><body>");
            out.println("<h3>Error connecting to the database!</h3>");
            out.println("</body></html>");
        } finally {
            // Close resources
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to check if the user already exists
    private boolean isUserExists(String email) {
        boolean exists = false;
        Connection connection = null;
        PreparedStatement statement = null;
        java.sql.ResultSet resultSet = null;
        try {
        	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourism", "root", "root");

            String sql = "SELECT id FROM users WHERE email = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exists;
    }
}