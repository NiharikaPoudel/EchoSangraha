package com.EcoSangraha.Controller;

import com.EcoSangraha.Model.BlogModel;
import com.EcoSangraha.Service.BlogService;
import com.EcoSangraha.Model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/BlogServlet", "/blog", "/blogs" })
public class BlogController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BlogService blogService = new BlogService();
    
    public BlogController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("\n=== BLOG CONTROLLER ===");
        
        String action = request.getParameter("action");
        String blogId = request.getParameter("id");
        String searchQuery = request.getParameter("search");
        
        System.out.println("Action: " + action);
        System.out.println("Blog ID: " + blogId);
        System.out.println("Search Query: " + searchQuery);
        
        try {
            // Get user session
            HttpSession session = request.getSession(false);
            UserModel loggedInUser = null;
            if (session != null) {
                loggedInUser = (UserModel) session.getAttribute("loggedInUser");
                if (loggedInUser != null) {
                    request.setAttribute("user", loggedInUser);
                }
            }
            
            // Route to appropriate action
            if (blogId != null && !blogId.trim().isEmpty()) {
                // Show individual blog post
                showSingleBlog(request, response, blogId);
            } else if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                // Show search results
                showSearchResults(request, response, searchQuery);
            } else {
                // Show all blogs
                showAllBlogs(request, response);
            }
            
        } catch (Exception e) {
            System.err.println("❌ Error in BlogController: " + e.getMessage());
            e.printStackTrace();
            handleError(request, response, "Unable to load blog content. Please try again later.");
        }
    }
    
    private void showSingleBlog(HttpServletRequest request, HttpServletResponse response, String blogId) 
            throws ServletException, IOException {
        
        System.out.println("📰 Loading single blog with ID: " + blogId);
        
        try {
            int id = Integer.parseInt(blogId);
            BlogModel blog = blogService.getBlogById(id);
            
            if (blog != null) {
                System.out.println("✅ Blog found: " + blog.getTitle());
                
                // Set blog data
                request.setAttribute("blog", blog);
                request.setAttribute("pageTitle", blog.getTitle() + " - PaperCycle Blog");
                request.setAttribute("pageDescription", blog.getSummary());
                
                // Get related blogs (exclude current blog)
                List<BlogModel> relatedBlogs = blogService.getRelatedBlogs(id, 3);
                request.setAttribute("relatedBlogs", relatedBlogs);
                
                System.out.println("✅ Related blogs loaded: " + relatedBlogs.size());
                
                // Forward to single blog JSP
                request.getRequestDispatcher("/WEB-INF/pages/blog-single.jsp").forward(request, response);
                
            } else {
                System.out.println("❌ Blog not found with ID: " + blogId);
                handleError(request, response, "Blog post not found.");
            }
            
        } catch (NumberFormatException e) {
            System.err.println("❌ Invalid blog ID format: " + blogId);
            handleError(request, response, "Invalid blog ID.");
        }
    }
    
    private void showSearchResults(HttpServletRequest request, HttpServletResponse response, String searchQuery) 
            throws ServletException, IOException {
        
        System.out.println("🔍 Searching blogs with query: " + searchQuery);
        
        // Get pagination parameters
        String pageParam = request.getParameter("page");
        int currentPage = 1;
        int blogsPerPage = 9;
        
        try {
            if (pageParam != null && !pageParam.trim().isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }
        } catch (NumberFormatException e) {
            currentPage = 1;
        }
        
        // Get search results
        List<BlogModel> blogs = blogService.searchBlogs(searchQuery, currentPage, blogsPerPage);
        int totalBlogs = blogService.getSearchBlogsCount(searchQuery);
        
        // Calculate pagination
        int totalPages = (int) Math.ceil((double) totalBlogs / blogsPerPage);
        
        System.out.println("✅ Found " + blogs.size() + " blogs for search: " + searchQuery);
        
        // Set attributes
        request.setAttribute("blogs", blogs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalBlogs", totalBlogs);
        request.setAttribute("searchQuery", searchQuery);
        request.setAttribute("pageTitle", "Search Results for '" + searchQuery + "' - PaperCycle Blog");
        request.setAttribute("pageDescription", "Search results for " + searchQuery);
        
        // Forward to blog list JSP
        request.getRequestDispatcher("/WEB-INF/pages/blog-list.jsp").forward(request, response);
    }
    
    private void showAllBlogs(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("📰 Loading all blogs");
        
        // Get pagination parameters
        String pageParam = request.getParameter("page");
        int currentPage = 1;
        int blogsPerPage = 9;
        
        try {
            if (pageParam != null && !pageParam.trim().isEmpty()) {
                currentPage = Integer.parseInt(pageParam);
            }
        } catch (NumberFormatException e) {
            currentPage = 1;
        }
        
        // Get blogs with pagination
        List<BlogModel> blogs = blogService.getAllBlogs(currentPage, blogsPerPage);
        int totalBlogs = blogService.getTotalBlogsCount();
        
        // Calculate pagination
        int totalPages = (int) Math.ceil((double) totalBlogs / blogsPerPage);
        
        System.out.println("✅ Loaded " + blogs.size() + " blogs (Page " + currentPage + " of " + totalPages + ")");
        
        // Set attributes
        request.setAttribute("blogs", blogs);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalBlogs", totalBlogs);
        request.setAttribute("pageTitle", "Blog - PaperCycle");
        request.setAttribute("pageDescription", "Read our latest articles about sustainability, recycling, and eco-friendly practices.");
        
        // Forward to blog list JSP
        request.getRequestDispatcher("/WEB-INF/pages/blog-list.jsp").forward(request, response);
    }
    
    private void handleError(HttpServletRequest request, HttpServletResponse response, String errorMessage) 
            throws ServletException, IOException {
        
        System.out.println("❌ Handling blog error: " + errorMessage);
        
        request.setAttribute("error", errorMessage);
        request.setAttribute("pageTitle", "Error - PaperCycle Blog");
        
        // Forward to error page or blog list with error
        request.getRequestDispatcher("/WEB-INF/pages/blog-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests (like blog search form submissions)
        doGet(request, response);
    }
}