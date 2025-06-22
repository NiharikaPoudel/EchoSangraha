package com.EcoSangraha.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.EcoSangraha.Model.UserModel;
import com.EcoSangraha.Config.dbConfig;

public class RegisterService {

    private Connection dbConn;

    public RegisterService() {
        try {
            this.dbConn = dbConfig.getDbConnection();
            if (this.dbConn != null) {
                System.out.println("Database connection established successfully");
            } else {
                System.err.println("Database connection is null");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public Boolean addUser(UserModel user) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        // First check if user already exists
        if (userExists(user.getUsername(), user.getEmail())) {
            System.err.println("User already exists with username: " + user.getUsername() + " or email: " + user.getEmail());
            return false;
        }

        // Updated query matching your actual database schema
        String insertQuery = "INSERT INTO user " +
                "(User_name, Phone_number, Email_address, address, user_password, profile_image, date_joined, status, upload_count, purchase_count, role) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {
            // Set default values for new users
            String defaultRole = "user";
            String defaultStatus = "active";
            LocalDate currentDate = LocalDate.now();
            int defaultUploadCount = 0;
            int defaultPurchaseCount = 0;

            stmt.setString(1, user.getUsername());           // User_name
            stmt.setString(2, user.getPhoneNumber());        // Phone_number
            stmt.setString(3, user.getEmail());              // Email_address
            stmt.setString(4, user.getAddress());            // address
            stmt.setString(5, user.getPassword());           // user_password
            stmt.setString(6, user.getUserPhoto());          // profile_image
            stmt.setDate(7, java.sql.Date.valueOf(currentDate)); // date_joined
            stmt.setString(8, defaultStatus);                // status
            stmt.setInt(9, defaultUploadCount);              // upload_count
            stmt.setInt(10, defaultPurchaseCount);           // purchase_count
            stmt.setString(11, defaultRole);                 // role

            int rowsAffected = stmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    private boolean userExists(String username, String email) {
        // Updated query matching your actual database schema
        String checkQuery = "SELECT COUNT(*) FROM user WHERE User_name = ? OR Email_address = ?";
        
        try (PreparedStatement stmt = dbConn.prepareStatement(checkQuery)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking if user exists: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
}