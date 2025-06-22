package com.EcoSangraha.Controller;

import com.EcoSangraha.Model.UserModel;
import com.EcoSangraha.Service.RegisterService;
import com.EcoSangraha.Util.PasswordUtil;
import com.EcoSangraha.Util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final RegisterService registerService = new RegisterService();
    
    // Define upload directory - adjust path as needed
    private static final String UPLOAD_DIR = "uploads/profile-photos";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Registration attempt started...");
        
        String validationMessage = validateRegistrationForm(request);
        if (validationMessage != null) {
            System.out.println("Validation failed: " + validationMessage);
            handleError(request, response, validationMessage, "/WEB-INF/pages/register.jsp");
            return;
        }

        try {
            UserModel userModel = extractUserModel(request);
            System.out.println("User model created for: " + userModel.getUsername());

            Boolean isRegistered = registerService.addUser(userModel);
            System.out.println("Registration result: " + isRegistered);

            if (Boolean.TRUE.equals(isRegistered)) {
                handleSuccess(request, response,
                    "Your account has been successfully created.",
                    "/WEB-INF/pages/login.jsp");
            } else {
                handleError(request, response,
                    "Registration failed. Please check if email or username already exists.",
                    "/WEB-INF/pages/register.jsp");
            }

        } catch (Exception e) {
            System.err.println("Registration error: " + e.getMessage());
            e.printStackTrace();
            handleError(request, response,
                "An unexpected error occurred: " + e.getMessage(),
                "/WEB-INF/pages/register.jsp");
        }
    }

    private String validateRegistrationForm(HttpServletRequest request) {
        String username    = request.getParameter("username");
        String email       = request.getParameter("email");
        String address     = request.getParameter("address");
        String password    = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");

        if (ValidationUtil.isNullOrEmpty(username))
            return "Username is required.";
        if (ValidationUtil.isNullOrEmpty(email))
            return "Email is required.";
        if (ValidationUtil.isNullOrEmpty(password))
            return "Password is required.";
        if (ValidationUtil.isNullOrEmpty(phoneNumber))
            return "Phone number is required.";
        if (ValidationUtil.isNullOrEmpty(address))
            return "Address is required.";

        if (!ValidationUtil.isValidEmail(email))
            return "Invalid email format.";

        return null;
    }

    private UserModel extractUserModel(HttpServletRequest request) throws Exception {
        String username    = request.getParameter("username");
        String email       = request.getParameter("email");
        String password    = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String address     = request.getParameter("address");

        String encryptedPassword = PasswordUtil.encrypt(username, password);
        if (encryptedPassword == null) {
            throw new Exception("Password encryption failed");
        }

        // Handle file upload
        String userPhoto = null;
        Part imagePart = request.getPart("userPhoto");
        
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = imagePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Create unique filename to avoid conflicts
                String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                String uniqueFileName = username + "_" + System.currentTimeMillis() + fileExtension;
                
                // Save file to server
                String savedFileName = saveUploadedFile(imagePart, uniqueFileName);
                userPhoto = savedFileName;
                System.out.println("File uploaded: " + savedFileName);
            }
        }

        UserModel userModel = new UserModel();
        userModel.setUsername(username);
        userModel.setEmail(email);
        userModel.setPassword(encryptedPassword);
        userModel.setPhoneNumber(phoneNumber);
        userModel.setAddress(address);
        userModel.setUserPhoto(userPhoto);

        return userModel;
    }
    
    private String saveUploadedFile(Part filePart, String fileName) throws IOException {
        // Get the real path of the web application
        String applicationPath = getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        
        // Create directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        
        // Save the file
        Path filePath = Paths.get(uploadPath, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
        
        return fileName;
    }

    private void handleSuccess(HttpServletRequest request, HttpServletResponse response,
                               String message, String redirectPage)
            throws ServletException, IOException {
        request.setAttribute("success", message);
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response,
                             String message, String redirectPage)
            throws ServletException, IOException {
        request.setAttribute("error", message);
        // Repopulate form fields
        request.setAttribute("username", request.getParameter("username"));
        request.setAttribute("email", request.getParameter("email"));
        request.setAttribute("phoneNumber", request.getParameter("phoneNumber"));
        request.setAttribute("address", request.getParameter("address"));
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }
}