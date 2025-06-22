package com.EcoSangraha.Service;

import com.EcoSangraha.Model.BlogModel;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogService {
    
    // Database configuration - तपाईंको database details अनुसार change गर्नुहोस्
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecosangraha";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "your_password";
    
    // Load MySQL driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ MySQL Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ MySQL Driver not found: " + e.getMessage());
        }
    }
    
    // Get database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }
    
    // Get all blogs for home page (limited to 6)
    public List<BlogModel> getAllBlogsForHome() {
        List<BlogModel> blogs = new ArrayList<>();
        String sql = "SELECT id, title, summary, content, image, author, created_date, status " +
                    "FROM blogs WHERE status = 'published' " +
                    "ORDER BY created_date DESC LIMIT 6";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            System.out.println("📰 Loading blogs for home page...");
            
            while (rs.next()) {
                BlogModel blog = createBlogFromResultSet(rs);
                blogs.add(blog);
                System.out.println("✅ Loaded blog: " + blog.getTitle());
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error fetching blogs for home: " + e.getMessage());
            e.printStackTrace();
        }
        
        return blogs;
    }
    
    // Get all blogs with pagination
    public List<BlogModel> getAllBlogs(int page, int limit) {
        List<BlogModel> blogs = new ArrayList<>();
        int offset = (page - 1) * limit;
        
        String sql = "SELECT id, title, summary, content, image, author, created_date, status " +
                    "FROM blogs WHERE status = 'published' " +
                    "ORDER BY created_date DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, limit);
            stmt.setInt(2, offset);
            
            System.out.println("📰 Loading blogs - Page: " + page + ", Limit: " + limit);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BlogModel blog = createBlogFromResultSet(rs);
                    blogs.add(blog);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error fetching paginated blogs: " + e.getMessage());
            e.printStackTrace();
        }
        
        return blogs;
    }
    
    // Get single blog by ID
    public BlogModel getBlogById(int id) {
        String sql = "SELECT id, title, summary, content, image, author, created_date, status " +
                    "FROM blogs WHERE id = ? AND status = 'published'";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            System.out.println("📰 Loading blog with ID: " + id);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    BlogModel blog = createBlogFromResultSet(rs);
                    System.out.println("✅ Blog found: " + blog.getTitle());
                    return blog;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error fetching blog by ID: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("❌ Blog not found with ID: " + id);
        return null;
    }
    
    // Search blogs
    public List<BlogModel> searchBlogs(String query, int page, int limit) {
        List<BlogModel> blogs = new ArrayList<>();
        int offset = (page - 1) * limit;
        
        String sql = "SELECT id, title, summary, content, image, author, created_date, status " +
                    "FROM blogs WHERE status = 'published' " +
                    "AND (title LIKE ? OR summary LIKE ? OR content LIKE ?) " +
                    "ORDER BY created_date DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + query + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            stmt.setString(3, searchPattern);
            stmt.setInt(4, limit);
            stmt.setInt(5, offset);
            
            System.out.println("🔍 Searching blogs with query: " + query);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BlogModel blog = createBlogFromResultSet(rs);
                    blogs.add(blog);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error searching blogs: " + e.getMessage());
            e.printStackTrace();
        }
        
        return blogs;
    }
    
    // Get related blogs (exclude current blog)
    public List<BlogModel> getRelatedBlogs(int excludeId, int limit) {
        List<BlogModel> blogs = new ArrayList<>();
        
        String sql = "SELECT id, title, summary, content, image, author, created_date, status " +
                    "FROM blogs WHERE status = 'published' AND id != ? " +
                    "ORDER BY RAND() LIMIT ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, excludeId);
            stmt.setInt(2, limit);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BlogModel blog = createBlogFromResultSet(rs);
                    blogs.add(blog);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error fetching related blogs: " + e.getMessage());
            e.printStackTrace();
        }
        
        return blogs;
    }
    
    // Get total blogs count
    public int getTotalBlogsCount() {
        String sql = "SELECT COUNT(*) FROM blogs WHERE status = 'published'";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting total blogs count: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    // Get search blogs count
    public int getSearchBlogsCount(String query) {
        String sql = "SELECT COUNT(*) FROM blogs WHERE status = 'published' " +
                    "AND (title LIKE ? OR summary LIKE ? OR content LIKE ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + query + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);
            stmt.setString(3, searchPattern);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("❌ Error getting search blogs count: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    // Helper method to create BlogModel from ResultSet
    private BlogModel createBlogFromResultSet(ResultSet rs) throws SQLException {
        BlogModel blog = new BlogModel();
        blog.setId(rs.getInt("id"));
        blog.setTitle(rs.getString("title"));
        blog.setSummary(rs.getString("summary"));
        blog.setContent(rs.getString("content"));
        blog.setImage(rs.getString("image"));
        blog.setAuthor(rs.getString("author"));
        blog.setCreatedDate(rs.getTimestamp("created_date"));
        blog.setStatus(rs.getString("status"));
        return blog;
    }
}