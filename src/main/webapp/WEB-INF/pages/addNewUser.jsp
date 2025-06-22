<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add New User</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #d4c5a9 0%, #b8a082 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
      }

      .form-container {
        background: rgba(255, 255, 255, 0.95);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        max-width: 500px;
        width: 100%;
      }

      .form-title {
        color: #6b8e23;
        font-size: 2rem;
        font-weight: bold;
        text-align: center;
        margin-bottom: 30px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-label {
        display: block;
        color: #2c3e50;
        font-weight: 600;
        margin-bottom: 8px;
        font-size: 1rem;
      }

      .form-input {
        width: 100%;
        padding: 12px 16px;
        border: 2px solid #e0e0e0;
        border-radius: 10px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: rgba(255, 255, 255, 0.9);
      }

      .form-input:focus {
        outline: none;
        border-color: #6b8e23;
        box-shadow: 0 0 0 3px rgba(107, 142, 35, 0.2);
        transform: translateY(-2px);
      }

      .form-textarea {
        resize: vertical;
        min-height: 80px;
        font-family: inherit;
      }

      .photo-upload-container {
        border: 2px dashed #ccc;
        border-radius: 12px;
        padding: 30px 20px;
        text-align: center;
        background: #f9f9f9;
        transition: all 0.3s ease;
        cursor: pointer;
      }

      .photo-upload-container:hover {
        border-color: #999;
        background: #f5f5f5;
      }

      .photo-upload-container.dragover {
        background: #f0f8ff;
        border-color: #4a90e2;
      }

      .camera-icon {
        width: 60px;
        height: 60px;
        background: #ccc;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px;
        transition: all 0.3s ease;
        position: relative;
      }

      .camera-icon::before {
        content: "";
        width: 24px;
        height: 18px;
        background: #666;
        border-radius: 3px;
        position: relative;
        display: block;
        margin: 0 auto;
      }

      .camera-icon::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 12px;
        height: 12px;
        border: 2px solid #666;
        border-radius: 50%;
        background: transparent;
      }

      .photo-upload-container:hover .camera-icon {
        background: #bbb;
      }

      .upload-title {
        color: #8b4513;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 5px;
      }

      .upload-subtitle {
        color: #6b7280;
        font-size: 14px;
        font-weight: normal;
      }

      .file-input {
        display: none;
      }

      .upload-button {
        background: #6b8e23;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 0.9rem;
        transition: all 0.3s ease;
      }

      .upload-button:hover {
        background: #5a7a1f;
        transform: translateY(-1px);
      }

      .preview-image {
        max-width: 120px;
        max-height: 120px;
        border-radius: 10px;
        margin-top: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .remove-image {
        background: #e74c3c;
        color: white;
        border: none;
        padding: 4px 8px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 0.8rem;
        margin-top: 8px;
        transition: all 0.3s ease;
      }

      .remove-image:hover {
        background: #c0392b;
      }

      .submit-button {
        width: 100%;
        background: linear-gradient(135deg, #6b8e23 0%, #8fbc8f 100%);
        color: white;
        border: none;
        padding: 15px;
        border-radius: 12px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
      }

      .submit-button:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(107, 142, 35, 0.3);
      }

      .submit-button:active {
        transform: translateY(-1px);
      }

      .back-link {
        display: block;
        text-align: center;
        color: #6b8e23;
        text-decoration: none;
        margin-top: 20px;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .back-link:hover {
        color: #5a7a1f;
        transform: translateY(-1px);
      }

      .back-link::before {
        content: "← ";
      }

      .error-message {
        color: #e74c3c;
        font-size: 0.9rem;
        margin-top: 5px;
        display: block;
      }

      @media (max-width: 480px) {
        .form-container {
          padding: 25px;
          margin: 10px;
        }

        .form-title {
          font-size: 1.6rem;
        }
      }
    </style>
  </head>
  <body>
    <div class="form-container">
      <h1 class="form-title">Add New User</h1>

      <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
      </c:if>

      <form
        id="userForm"
        action="<%=request.getContextPath()%>/AddUserServlet"
        method="post"
        enctype="multipart/form-data">
        <div class="form-group">
          <label for="username" class="form-label">Username:</label>
          <input
            type="text"
            id="username"
            name="username"
            class="form-input"
            value="${param.username != null ? param.username : ''}"
            required />
          <c:if test="${not empty errors.username}">
            <span class="error-message">${errors.username}</span>
          </c:if>
        </div>

        <div class="form-group">
          <label for="email" class="form-label">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            class="form-input"
            value="${param.email != null ? param.email : ''}"
            required />
          <c:if test="${not empty errors.email}">
            <span class="error-message">${errors.email}</span>
          </c:if>
        </div>

        <div class="form-group">
          <label for="phone" class="form-label">Phone Number:</label>
          <input
            type="tel"
            id="phone"
            name="phone"
            class="form-input"
            value="${param.phone != null ? param.phone : ''}"
            required />
          <c:if test="${not empty errors.phone}">
            <span class="error-message">${errors.phone}</span>
          </c:if>
        </div>

        <div class="form-group">
          <label class="form-label">Upload Photo:</label>
          <div
            class="photo-upload-container"
            id="photoUpload"
            onclick="document.getElementById('photoInput').click()">
            <div class="camera-icon"></div>
            <div class="upload-title">Upload Profile Photo</div>
            <div class="upload-subtitle">Click to browse or drag & drop</div>
            <input
              type="file"
              id="photoInput"
              name="photo"
              class="file-input"
              accept="image/*" />
            <div id="imagePreview"></div>
          </div>
          <c:if test="${not empty errors.photo}">
            <span class="error-message">${errors.photo}</span>
          </c:if>
        </div>

        <div class="form-group">
          <label for="address" class="form-label">Address:</label>
          <input
            type="text"
            id="address"
            name="address"
            class="form-input"
            placeholder="Enter your address..."
            value="${param.address != null ? param.address : ''}"
            required />
          <c:if test="${not empty errors.address}">
            <span class="error-message">${errors.address}</span>
          </c:if>
        </div>

        <div class="form-group">
          <label for="password" class="form-label">Password:</label>
          <input
            type="password"
            id="password"
            name="password"
            class="form-input"
            required />
          <c:if test="${not empty errors.password}">
            <span class="error-message">${errors.password}</span>
          </c:if>
        </div>

        <button type="submit" class="submit-button">Add User</button>
      </form>

      <a href="<%=request.getContextPath()%>/UserList.jsp" class="back-link"
        >Back to User List</a
      >
    </div>

    <script>
      // Photo upload functionality
      const photoUpload = document.getElementById("photoUpload");
      const photoInput = document.getElementById("photoInput");
      const imagePreview = document.getElementById("imagePreview");

      // Handle file input change
      photoInput.addEventListener("change", handleFileSelect);

      // Handle drag and drop
      photoUpload.addEventListener("dragover", (e) => {
        e.preventDefault();
        photoUpload.classList.add("dragover");
      });

      photoUpload.addEventListener("dragleave", () => {
        photoUpload.classList.remove("dragover");
      });

      photoUpload.addEventListener("drop", (e) => {
        e.preventDefault();
        photoUpload.classList.remove("dragover");

        const files = e.dataTransfer.files;
        if (files.length > 0 && files[0].type.startsWith("image/")) {
          handleFile(files[0]);
        }
      });

      function handleFileSelect(e) {
        const file = e.target.files[0];
        if (file) {
          handleFile(file);
        }
      }

      function handleFile(file) {
        if (file.type.startsWith("image/")) {
          const reader = new FileReader();
          reader.onload = (e) => {
            displayImagePreview(e.target.result, file.name);
          };
          reader.readAsDataURL(file);
        } else {
          alert("Please select a valid image file.");
        }
      }

      function displayImagePreview(src, fileName) {
        imagePreview.innerHTML = `
                <div style="margin-top: 15px;">
                    <img src="${src}" alt="Preview" class="preview-image">
                    <div style="margin-top: 8px; font-size: 0.9rem; color: #666;">${fileName}</div>
                    <button type="button" class="remove-image" onclick="removeImage()">Remove</button>
                </div>
            `;
      }

      function removeImage() {
        imagePreview.innerHTML = "";
        photoInput.value = "";
      }

      // Form submission
      document.getElementById("userForm").addEventListener("submit", (e) => {
        // Client-side validation
        const username = document.getElementById("username").value.trim();
        const email = document.getElementById("email").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const address = document.getElementById("address").value.trim();
        const password = document.getElementById("password").value.trim();

        if (!username || !email || !phone || !address || !password) {
          e.preventDefault();
          alert("Please fill out all required fields.");
          return;
        }

        // Form will submit to servlet if validation passes
      });

      // Add smooth animations on load
      window.addEventListener("load", () => {
        document.querySelector(".form-container").style.opacity = "0";
        document.querySelector(".form-container").style.transform =
          "translateY(30px)";

        setTimeout(() => {
          document.querySelector(".form-container").style.transition =
            "all 0.6s ease";
          document.querySelector(".form-container").style.opacity = "1";
          document.querySelector(".form-container").style.transform =
            "translateY(0)";
        }, 100);
      });
    </script>
  </body>
</html>
