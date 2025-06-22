package com.EcoSangraha.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConfig {

    private static final String DB_NAME = "ecosangraha";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }

    public static void main(String[] args) {
        try (Connection conn = getDbConnection()) {
            if (conn != null) {
                System.out.println("Database Connection Successful!");
                System.out.println("Connected to database: " + conn.getCatalog());
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Database Connection Failed: " + e.getMessage());
        }
    }
}
