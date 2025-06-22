<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PaperCycle Admin Dashboard</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
          sans-serif;
        background-color: #f5f5f5;
        display: flex;
        min-height: 100vh;
      }

      .sidebar {
        width: 250px;
        background-color: #6b8e52;
        color: white;
        padding: 20px;
        position: fixed;
        height: 100vh;
        overflow-y: auto;
      }

      .logo {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 40px;
        color: white;
      }

      .nav-item {
        padding: 12px 0;
        cursor: pointer;
        border-radius: 5px;
        padding-left: 15px;
        margin-bottom: 5px;
        transition: background-color 0.2s;
      }

      .nav-item:hover {
        background-color: rgba(255, 255, 255, 0.1);
      }

      .nav-item.active {
        background-color: rgba(255, 255, 255, 0.2);
      }

      .main-content {
        margin-left: 250px;
        flex: 1;
        background-color: #f5f5f5;
      }

      .header {
        background-color: #e8e0d6;
        padding: 20px 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #ddd;
      }

      .header-left {
        display: flex;
        align-items: center;
        gap: 20px;
      }

      .admin-title {
        font-size: 28px;
        font-weight: bold;
        color: #6b8e52;
      }

      .search-container {
        display: flex;
        align-items: center;
        gap: 0;
      }

      .search-input {
        padding: 10px 15px;
        border: 1px solid #ccc;
        border-radius: 5px 0 0 5px;
        font-size: 14px;
        outline: none;
        width: 300px;
      }

      .search-button {
        padding: 10px 20px;
        background-color: #6b8e52;
        color: white;
        border: none;
        border-radius: 0 5px 5px 0;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
      }

      .search-button:hover {
        background-color: #5a7a44;
      }

      .header-right {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .admin-profile {
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .admin-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #6b8e52;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: bold;
        font-size: 16px;
      }

      .admin-info {
        text-align: right;
      }

      .admin-role {
        font-size: 12px;
        color: #666;
        font-weight: normal;
      }

      .admin-name {
        font-size: 14px;
        color: #6b8e52;
        font-weight: bold;
      }

      .content-area {
        padding: 30px;
      }

      .page-title {
        font-size: 24px;
        color: #6b8e52;
        margin-bottom: 20px;
        font-weight: bold;
      }

      .user-management-controls {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
      }

      .search-users {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 300px;
        font-size: 14px;
      }

      .add-user-btn {
        background-color: #6b8e52;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
      }

      .add-user-btn:hover {
        background-color: #5a7a44;
      }

      .user-table {
        width: 100%;
        background-color: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      .table-header {
        background-color: #f8f9fa;
        padding: 15px;
        display: grid;
        grid-template-columns: 1fr 1.5fr 2fr 1.5fr 1fr;
        gap: 20px;
        font-weight: bold;
        color: #333;
        border-bottom: 1px solid #eee;
      }

      .no-users {
        padding: 40px;
        text-align: center;
        color: #999;
        font-size: 16px;
      }
    </style>
  </head>
  <body>
    <div class="sidebar">
      <div class="logo">PaperCycle</div>
      <div class="nav-item">Dashboard</div>
      <div class="nav-item active">User Management</div>
      <div class="nav-item">Listings</div>
      <div class="nav-item">Payments</div>
      <div class="nav-item">Reports</div>
      <div class="nav-item">Logout</div>
    </div>

    <div class="main-content">
        <div class="header">
            <div class="header-left">
                <div class="admin-title">Usermanagement </div>
                <div class="search-container">
                    <input type="text" class="search-input" placeholder="Search...">
                    <button class="search-button">Search</button>
                </div>
            </div>
            <div class="header-right">
                <div class="admin-profile">
                    <div class="admin-avatar">
                        <img src="://.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face" alt="Admin Avatar">
                    </div>
                    <div class="admin-info">
                        <div class="admin-role">Admin</div>
                        <div class="admin-name">Sneha Sapkota</div>
                    </div>
                </div>
            </div>
        </div>

      <div class="content-area">

          <button class="add-user-btn">+ Add User</button>
        </div>

        <div class="user-table">
          <div class="table-header">
            <div>User ID</div>
            <div>Username</div>
            <div>Email</div>
            <div>Phone Number</div>
            <div>Actions</div>
          </div>
          <div class="no-users">No users found</div>
        </div>
      </div>
    </div>

    <script>
      // Add some basic interactivity
      document
        .querySelector(".search-button")
        .addEventListener("click", function () {
          const searchTerm = document.querySelector(".search-input").value;
          if (searchTerm) {
            alert("Searching for: " + searchTerm);
          }
        });

      document
        .querySelector(".search-input")
        .addEventListener("keypress", function (e) {
          if (e.key === "Enter") {
            document.querySelector(".search-button").click();
          }
        });

      document
        .querySelector(".add-user-btn")
        .addEventListener("click", function () {
          alert("Add User functionality would be implemented here");
        });

      // Navigation functionality
      document.querySelectorAll(".nav-item").forEach((item) => {
        item.addEventListener("click", function () {
          document
            .querySelectorAll(".nav-item")
            .forEach((nav) => nav.classList.remove("active"));
          this.classList.add("active");
        });
      });
    </script>
  </body>
</html>
