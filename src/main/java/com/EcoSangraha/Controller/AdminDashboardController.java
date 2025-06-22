package com.EcoSangraha.Controller;

import com.EcoSangraha.Model.AdminStats;
import com.EcoSangraha.Model.UserModel;
import com.EcoSangraha.Service.AdminDashboardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/AdminDashboard", "/admin", "/admin-dashboard" })
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AdminDashboardService adminService = new AdminDashboardService();
    
    public AdminDashboardController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("\n=== ADMIN DASHBOARD LOADING ===");
        
        // Check if admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            System.out.println("❌ No admin session found - Redirecting to login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        // Check if user has admin role
        UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
        if (!"admin".equals(loggedInUser.getRole())) {
            System.out.println("❌ User is not admin - Access denied");
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
        System.out.println("✅ Admin access granted for: " + loggedInUser.getUsername());
        
        try {
            // Load dashboard statistics
            System.out.println("📊 Loading dashboard statistics...");
            AdminStats stats = adminService.getDashboardStats();
            
            if (stats != null) {
                System.out.println("✅ Dashboard stats loaded:");
                System.out.println("  - Total Users: " + stats.getTotalUsers());
                System.out.println("  - New Listings: " + stats.getNewListings());
                System.out.println("  - Revenue: Rs. " + stats.getRevenue());
                System.out.println("  - Pending Approvals: " + stats.getPendingApprovals());
                
                request.setAttribute("stats", stats);
            } else {
                System.out.println("⚠️ Could not load dashboard stats");
                // Set default stats
                AdminStats defaultStats = new AdminStats();
                defaultStats.setTotalUsers(120);
                defaultStats.setNewListings(45);
                defaultStats.setRevenue(75000.0);
                defaultStats.setPendingApprovals(12);
                request.setAttribute("stats", defaultStats);
            }
            
            // Load revenue data for chart
            System.out.println("📈 Loading revenue chart data...");
            List<Double> revenueData = adminService.getMonthlyRevenueData();
            if (revenueData != null && !revenueData.isEmpty()) {
                System.out.println("✅ Revenue data loaded: " + revenueData.size() + " months");
                request.setAttribute("revenueData", revenueData.toString());
            } else {
                System.out.println("⚠️ Using default revenue data");
                request.setAttribute("revenueData", "[15000, 20000, 25000, 22000, 30000, 35000]");
            }
            
            // Load recent users
            System.out.println("👥 Loading recent users...");
            List<UserModel> recentUsers = adminService.getRecentUsers(10);
            if (recentUsers != null && !recentUsers.isEmpty()) {
                System.out.println("✅ Recent users loaded: " + recentUsers.size());
                request.setAttribute("recentUsers", recentUsers);
            } else {
                System.out.println("⚠️ No recent users found");
            }
            
            // Set admin info in session if not already set
            session.setAttribute("admin", loggedInUser);
            
            // Set page metadata
            request.setAttribute("pageTitle", "Admin Dashboard - PaperCycle");
            
            System.out.println("✅ Admin dashboard data prepared successfully");
            System.out.println("=== FORWARDING TO ADMIN DASHBOARD JSP ===\n");
            
            // Forward to admin dashboard JSP
            request.getRequestDispatcher("/WEB-INF/pages/AdminDashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("❌ Error loading admin dashboard: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message and forward to error page
            request.setAttribute("error", "Unable to load dashboard data. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST requests to GET
        doGet(request, response);
    }
}