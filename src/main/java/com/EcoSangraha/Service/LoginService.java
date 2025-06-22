package com.EcoSangraha.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.EcoSangraha.Model.UserModel;
import com.EcoSangraha.Config.dbConfig;
import com.EcoSangraha.Util.PasswordUtil;

public class LoginService {

    private Connection dbConn;

    public LoginService() {
        try {
            this.dbConn = dbConfig.getDbConnection();
            if (this.dbConn != null) {
                System.out.println("✅ LoginService: Database connection established");
            } else {
                System.err.println("❌ LoginService: Database connection is null");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("❌ LoginService database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public UserModel authenticateUser(String username, String plainPassword) {
        if (dbConn == null) {
            System.err.println("❌ Database connection not available for authentication");
            return null;
        }

        System.out.println("\n🔍 === AUTHENTICATION DEBUG ===");
        System.out.println("Input username: '" + username + "'");

        // First, get user from database
        String checkUserQuery = "SELECT user_id, User_name, user_password, status, role, " +
                               "Phone_number, Email_address, address, profile_image, date_joined, " +
                               "upload_count, purchase_count FROM user WHERE User_name = ?";
        
        try (PreparedStatement checkStmt = dbConn.prepareStatement(checkUserQuery)) {
            checkStmt.setString(1, username);
            
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    String dbPassword = rs.getString("user_password");
                    String dbStatus = rs.getString("status");
                    
                    System.out.println("✅ User found in database");
                    System.out.println("  - DB Status: '" + dbStatus + "'");
                    
                    // Try current encryption method
                    String currentEncrypted = PasswordUtil.encrypt(username, plainPassword);
                    System.out.println("  - Current encrypted: '" + currentEncrypted + "'");
                    System.out.println("  - DB password: '" + dbPassword + "'");
                    
                    boolean passwordMatch = currentEncrypted.equals(dbPassword);
                    System.out.println("  - Password match: " + passwordMatch);
                    
                    // If password doesn't match, update it in database
                    if (!passwordMatch) {
                        System.out.println("⚠️ Password mismatch - Updating database password");
                        
                        String updateQuery = "UPDATE user SET user_password = ? WHERE User_name = ?";
                        try (PreparedStatement updateStmt = dbConn.prepareStatement(updateQuery)) {
                            updateStmt.setString(1, currentEncrypted);
                            updateStmt.setString(2, username);
                            
                            int updated = updateStmt.executeUpdate();
                            if (updated > 0) {
                                System.out.println("✅ Password updated in database");
                                passwordMatch = true; // Now it matches
                            }
                        } catch (SQLException e) {
                            System.err.println("❌ Error updating password: " + e.getMessage());
                        }
                    }
                    
                    // Check status and fix if needed
                    if (dbStatus == null || !dbStatus.equals("active")) {
                        System.out.println("⚠️ Status is not 'active' - Fixing it");
                        
                        String statusUpdateQuery = "UPDATE user SET status = 'active' WHERE User_name = ?";
                        try (PreparedStatement statusStmt = dbConn.prepareStatement(statusUpdateQuery)) {
                            statusStmt.setString(1, username);
                            statusStmt.executeUpdate();
                            dbStatus = "active";
                            System.out.println("✅ Status updated to 'active'");
                        } catch (SQLException e) {
                            System.err.println("❌ Error updating status: " + e.getMessage());
                        }
                    }
                    
                    // If password matches and status is active, create user object
                    if (passwordMatch && "active".equals(dbStatus)) {
                        UserModel user = new UserModel();
                        
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("User_name"));
                        user.setPhoneNumber(rs.getString("Phone_number"));
                        user.setEmail(rs.getString("Email_address"));
                        user.setAddress(rs.getString("address"));
                        user.setPassword(currentEncrypted); // Use current encrypted password
                        user.setUserPhoto(rs.getString("profile_image"));
                        
                        java.sql.Date sqlDate = rs.getDate("date_joined");
                        if (sqlDate != null) {
                            user.setDateJoined(sqlDate.toLocalDate());
                        }
                        
                        user.setStatus("active");
                        user.setUploadCount(rs.getInt("upload_count"));
                        user.setPurchaseCount(rs.getInt("purchase_count"));
                        
                        String role = rs.getString("role");
                        user.setRole(role != null ? role : "user");

                        System.out.println("✅ Authentication successful: " + username);
                        System.out.println("=== END AUTHENTICATION DEBUG ===\n");
                        return user;
                    } else {
                        System.err.println("❌ Authentication failed - Password or status issue");
                        System.err.println("=== END AUTHENTICATION DEBUG ===\n");
                        return null;
                    }
                    
                } else {
                    System.err.println("❌ User not found: '" + username + "'");
                    System.err.println("=== END AUTHENTICATION DEBUG ===\n");
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("❌ Error during authentication: " + e.getMessage());
            e.printStackTrace();
            System.err.println("=== END AUTHENTICATION DEBUG ===\n");
            return null;
        }
    }

    public void updateLastLogin(int userId) {
        if (dbConn == null) return;

        String query = "UPDATE user SET date_joined = ? WHERE user_id = ?";
        
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
            stmt.setInt(2, userId);
            
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("✅ Last login updated for user ID: " + userId);
            }
        } catch (SQLException e) {
            System.err.println("❌ Error updating last login: " + e.getMessage());
            e.printStackTrace();
        }
    }
}