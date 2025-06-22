package com.EcoSangraha.Controller;

import com.EcoSangraha.Model.UserModel;
import com.EcoSangraha.Service.LoginService;
import com.EcoSangraha.Util.CookieUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private final LoginService loginService = new LoginService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("\n=== LOGIN PAGE LOADING ===");
        
        // Check if user is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("loggedInUser") != null) {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            System.out.println("User already logged in: " + loggedInUser.getUsername() + " (Role: " + loggedInUser.getRole() + ")");
            
            // Redirect based on role
            if ("admin".equals(loggedInUser.getRole())) {
                System.out.println("Redirecting admin to admin dashboard");
                response.sendRedirect(request.getContextPath() + "/AdminDashboard");
            } else {
                System.out.println("Redirecting user to user dashboard");
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
            }
            return;
        }
        
        // Debug: Print all existing cookies
        CookieUtil.debugPrintAllCookies(request);
        
        // Check for remembered credentials
        Map<String, String> rememberedCredentials = CookieUtil.getRememberedCredentials(request);
        
        if (!rememberedCredentials.isEmpty()) {
            String rememberedUsername = rememberedCredentials.get("username");
            String rememberedPassword = rememberedCredentials.get("password");
            
            System.out.println("✅ Found remembered credentials for: " + rememberedUsername);
            
            // Set attributes to pre-fill the form
            request.setAttribute("rememberedUsername", rememberedUsername);
            request.setAttribute("rememberedPassword", rememberedPassword);
            request.setAttribute("rememberMeChecked", true);
            
            System.out.println("✅ Form will be pre-filled with remembered data");
        } else {
            System.out.println("ℹ️ No remembered credentials found");
        }
        
        System.out.println("=== FORWARDING TO LOGIN JSP ===\n");
        
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("\n=== LOGIN FORM SUBMISSION ===");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        System.out.println("Username: " + username);
        System.out.println("Password: " + (password != null && !password.isEmpty() ? "***provided***" : "empty"));
        System.out.println("Remember Me parameter: '" + rememberMe + "'");
        
        // Check if remember me is checked
        boolean isRememberMeChecked = "on".equals(rememberMe);
        System.out.println("Remember Me checked: " + isRememberMeChecked);
        
        // Validate input
        if (username == null || username.trim().isEmpty()) {
            handleError(request, response, "Username is required", "");
            return;
        }
        
        if (password == null || password.trim().isEmpty()) {
            handleError(request, response, "Password is required", username);
            return;
        }
        
        try {
            System.out.println("✅ Attempting authentication with plain password");
            
            // LoginService will handle password encryption and database fixing
            UserModel user = loginService.authenticateUser(username, password);
            
            if (user != null) {
                System.out.println("✅ Authentication successful for: " + username);
                
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                
                System.out.println("✅ Session created for user: " + username);
                System.out.println("✅ User role: " + user.getRole());
                
                // Handle Remember Me functionality
                if (isRememberMeChecked) {
                    System.out.println("🔐 User wants to be remembered - Setting cookies");
                    
                    // Store original password (not encrypted) for auto-fill
                    CookieUtil.setRememberMeCookies(response, username, password);
                    
                    System.out.println("🔐 Remember me cookies set successfully");
                    System.out.println("   - Username cookie: " + username);
                    System.out.println("   - Password cookie: ***set***");
                } else {
                    System.out.println("🔐 Remember me not checked - Clearing any existing cookies");
                    CookieUtil.clearRememberMeCookies(response);
                }
                
                // Update last login
                try {
                    loginService.updateLastLogin(user.getUserId());
                } catch (Exception e) {
                    System.err.println("Warning: Could not update last login: " + e.getMessage());
                }
                
                // ⭐ ROLE-BASED REDIRECT - This is the main fix
                if ("admin".equals(user.getRole())) {
                    System.out.println("✅ Admin user detected - Redirecting to admin dashboard");
                    response.sendRedirect(request.getContextPath() + "/AdminDashboard");
                } else {
                    System.out.println("✅ Regular user detected - Redirecting to user dashboard");
                    response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
                }
                
            } else {
                System.out.println("❌ Authentication failed for: " + username);
                handleError(request, response, "Invalid username or password. Please try again.", username);
            }
            
        } catch (Exception e) {
            System.err.println("❌ Login error: " + e.getMessage());
            e.printStackTrace();
            handleError(request, response, "An unexpected error occurred. Please try again.", username);
        }
        
        System.out.println("=== END LOGIN PROCESSING ===\n");
    }
    
    private void handleError(HttpServletRequest request, HttpServletResponse response, 
                           String errorMessage, String username) 
            throws ServletException, IOException {
        
        System.out.println("❌ Handling login error: " + errorMessage);
        
        request.setAttribute("error", errorMessage);
        request.setAttribute("username", username); // Keep username in form
        
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
}