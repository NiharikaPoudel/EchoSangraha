<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login Page</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
  <style>
      * {
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
        margin: 0;
        padding: 0;
      }

      body {
        background-color: #e8e4d8;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      .container {
        width: 900px;
        height: 550px;
        display: flex;
        background-color: #f1ede4;
        border-radius: 40px;
        overflow: hidden;
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        position: relative;
      }

      .left-panel {
        width: 50%;
        background-color: #a8d8a0;
        color: #ffffff;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 40px;
        text-align: center;
        position: relative;
        overflow: hidden;
        border-top-right-radius: 150px;
        border-bottom-right-radius: 150px;
      }

      .left-panel h2 {
        font-size: 36px;
        margin-bottom: 10px;
        position: relative;
        z-index: 2;
      }

      .left-panel p {
        font-size: 16px;
        margin-bottom: 20px;
        position: relative;
        z-index: 2;
      }

      .left-panel a {
        color: #ffffff;
        font-size: 18px;
        font-weight: bold;
        text-decoration: none;
        position: relative;
        z-index: 2;
        padding: 12px 30px;
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 25px;
        transition: all 0.3s ease;
      }

      .left-panel a:hover {
        background-color: rgba(255, 255, 255, 0.2);
        border-color: rgba(255, 255, 255, 0.5);
        text-decoration: none;
      }

      .home-button {
        position: absolute;
        top: 20px;
        left: 20px;
        background: rgba(255, 255, 255, 0.2);
        border: none;
        color: white;
        font-size: 18px;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        cursor: pointer;
        transition: all 0.3s ease;
        z-index: 3;
      }

      .home-button:hover {
        background: rgba(255, 255, 255, 0.3);
      }

      .right-panel {
        width: 50%;
        padding: 60px 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
      }

      .right-panel h2 {
        font-size: 30px;
        margin-bottom: 30px;
        color: #5d8a4d;
      }

      .input-group {
        position: relative;
        margin-bottom: 20px;
      }

      .input-group input {
        width: 100%;
        padding: 15px 45px 15px 15px;
        font-size: 16px;
        border: none;
        background-color: #f5f5f5;
        border-radius: 10px;
        outline: none;
        color: #5d8a4d;
      }

      .input-group input::placeholder {
        color: #696969;
      }

      .input-group i {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #696969;
      }

      /* Remember Me Checkbox Styles */
      .remember-forgot {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        font-size: 14px;
      }

      .remember-me {
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .remember-me input[type="checkbox"] {
        width: auto;
        margin: 0;
        accent-color: #5d8a4d;
      }

      .remember-me label {
        color: #5d8a4d;
        cursor: pointer;
        user-select: none;
      }

      .forgot a {
        color: #696969;
        text-decoration: none;
      }

      .forgot a:hover {
        text-decoration: underline;
      }

      .right-panel button {
        width: 100%;
        padding: 15px;
        font-size: 16px;
        font-weight: bold;
        background-color: #2e7d32;
        color: #ffffff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      .right-panel button:hover {
        background-color: #c4b184;
      }

      /* Error/Success Message Styles */
      .message {
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
        font-size: 14px;
      }

      .error-message {
        background-color: #ffebee;
        color: #c62828;
        border: 1px solid #ffcdd2;
      }

      .success-message {
        background-color: #e8f5e8;
        color: #2e7d32;
        border: 1px solid #c8e6c9;
      }

      @media (max-width: 768px) {
        .container {
          flex-direction: column;
          height: auto;
          width: 95%;
          border-radius: 20px;
        }

        .left-panel,
        .right-panel {
          width: 100%;
          padding: 30px;
        }

        .left-panel {
          border-radius: 0;
        }

        .remember-forgot {
          flex-direction: column;
          align-items: flex-start;
          gap: 10px;
        }
      }
    </style>
</head>
<body>
  <div class="container">
    <!-- Left Panel -->
    <div class="left-panel">
      <!-- Back Button -->
      <button class="home-button" onclick="window.location.href='${pageContext.request.contextPath}/home'">
        ←
      </button>
      <h2>Hello, Welcome!</h2>
      <p>Don't have an account?</p>
      <a href="${pageContext.request.contextPath}/register">Register</a>
    </div>

    <!-- Right Panel Login Form -->
    <div class="right-panel">
      <h2>Login</h2>

      <!-- Show error if exists -->
      <c:if test="${not empty error}">
        <div class="message error-message">${error}</div>
      </c:if>

      <!-- Show success if exists -->
      <c:if test="${not empty success}">
        <div class="message success-message">${success}</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/login" method="POST">
        <div class="input-group">
          <input 
            type="text" 
            name="username" 
            placeholder="Username" 
            value="${rememberedUsername != null ? rememberedUsername : (username != null ? username : '')}"
            required 
          />
          <i class="fas fa-user"></i>
        </div>
        
        <div class="input-group">
          <input 
            type="password" 
            name="password" 
            placeholder="Password" 
            value="${rememberedPassword != null ? rememberedPassword : ''}"
            required 
          />
          <i class="fas fa-lock"></i>
        </div>
        
        <!-- Remember Me and Forgot Password Row -->
        <div class="remember-forgot">
          <div class="remember-me">
            <input 
              type="checkbox" 
              id="rememberMe" 
              name="rememberMe" 
              ${rememberMeChecked ? 'checked' : ''}
            />
            <label for="rememberMe">Remember Me</label>
          </div>
          <div class="forgot">
            <a href="#">Forgot Password?</a>
          </div>
        </div>
        
        <button type="submit">Login</button>
      </form>
    </div>
  </div>

  <script>
    // Debug: Check if form values are pre-filled
    window.onload = function() {
      const username = document.querySelector('input[name="username"]').value;
      const password = document.querySelector('input[name="password"]').value;
      const rememberMe = document.querySelector('input[name="rememberMe"]').checked;
      
      console.log('Form loaded with:');
      console.log('Username:', username);
      console.log('Password:', password ? '***filled***' : 'empty');
      console.log('Remember Me:', rememberMe);
    };
  </script>
</body>
</html>