<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Registration</title>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
   <style>
       
      * {
        box-sizing: border-box;
        font-family: "Segoe UI", sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        background-color: #e8e4d8; /* Primary background */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      .container {
        width: 900px;
        max-height: 95vh;
        background-color: #f1ede4;
        display: flex;
        border-radius: 40px;
        overflow: hidden;
        box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
      }

      .form-section {
        
        flex: 1;
        padding: 40px 50px;
        background-color: #f1ede4;
      }

      .form-section h2 {
        font-size: 32px;
        margin-bottom: 25px;
        color: #5d8a4d; /* Primary */
      }

      .input-group {
        position: relative;
        margin-bottom: 18px;
      }

      .input-group input {
        width: 100%;
        padding: 12px 45px 12px 15px;
        font-size: 16px;
        border: none;
        background-color: #f5f5f5;
        border-radius: 10px;
        outline: none;
      }

      .input-group i {
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #696969;
      }

      .photo-upload {
        margin-bottom: 18px;
      }

      .photo-upload-container {
        border: 2px dashed #d0d0d0;
        border-radius: 10px;
        padding: 15px;
        text-align: center;
        background-color: #f5f5f5;
        transition: all 0.3s ease;
        cursor: pointer;
        position: relative;
      }

      .photo-upload-container:hover {
        border-color: #5d8a4d;
        background-color: #f0f5f0;
      }

      .photo-upload-container.dragover {
        border-color: #5d8a4d;
        background-color: #f0f5f0;
      }

      #photo-input {
        display: none;
      }

      .photo-placeholder {
        width: 50px;
        height: 50px;
        background: #e0e0e0;
        border-radius: 50%;
        margin: 0 auto 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        color: #999;
        transition: all 0.3s ease;
      }

      .photo-preview {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
        margin: 0 auto 8px;
        display: none;
      }

      .photo-upload-text {
        color: #666;
        font-size: 12px;
        margin-bottom: 5px;
      }

      .photo-upload-hint {
        color: #999;
        font-size: 10px;
      }

      .checkbox-group {
        display: flex;
        align-items: center;
        font-size: 14px;
        margin-bottom: 20px;
        color: #333;
      }

      .checkbox-group input {
        margin-right: 10px;
      }

      .form-section button {
        width: 100%;
        padding: 15px;
        font-size: 16px;
        font-weight: bold;
        background-color: #2e7d32; /* Accent */
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
      }

      .form-section button:hover {
        background-color: #c4b184;
      }

      .side-panel {
        flex: 1;
        background-color: #a8d8a0; /* Primary */
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 40px;
        border-top-left-radius: 150px;
        border-bottom-left-radius: 150px;
        position: relative;
      }

      .side-panel h2 {
        font-size: 32px;
        margin-bottom: 10px;
      }

      .side-panel p {
        font-size: 16px;
        margin-bottom: 20px;
      }

      .side-panel a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        font-size: 18px;
        padding: 12px 30px;
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 25px;
        transition: all 0.3s ease;
      }

      .side-panel a:hover {
        background-color: rgba(255, 255, 255, 0.2);
        border-color: rgba(255, 255, 255, 0.5);
        text-decoration: none;
      }
@media (max-width: 768px) {
        .container {
          flex-direction: column;
          height: auto;
          border-radius: 0;
          width: 95%;
        }

        .form-section {
          padding: 30px 25px;
        }

        .side-panel {
          border-radius: 0;
          padding: 30px 25px;
        }




      }
    </style>

   
  
</head>
<body>
  <div class="container">
    <div class="form-section">
      <a href="home.jsp" class="circular-back-btn">
        <i class="fas fa-arrow-left"></i>
      </a>

      <h2>Registration</h2>
      <form
        action="register"
        method="POST"
        enctype="multipart/form-data"
        id="registration-form"
      >
        <div class="input-group">
          <input
            type="text"
            name="username"
            placeholder="Username"
            value="${username != null ? username : ''}"
            required
          />
          <i class="fas fa-user"></i>
        </div>
        <div class="input-group">
          <input
            type="tel"
            name="phoneNumber"
            placeholder="Phone"
            value="${phoneNumber != null ? phoneNumber : ''}"
            required
          />
          <i class="fas fa-phone"></i>
        </div>
        <div class="input-group">
          <input
            type="email"
            name="email"
            placeholder="Email"
            value="${email != null ? email : ''}"
            required
          />
          <i class="fas fa-envelope"></i>
        </div>
        <div class="input-group">
          <input
            type="text"
            name="address"
            placeholder="Address"
            value="${address != null ? address : ''}"
            required
          />
          <i class="fas fa-map-marker-alt"></i>
        </div>
        <div class="photo-upload">
          <div
            class="photo-upload-container"
            onclick="document.getElementById('photo-input').click()"
          >
            <div class="photo-placeholder" id="photo-placeholder">
              <i class="fas fa-camera"></i>
            </div>
            <img
              class="photo-preview"
              id="photo-preview"
              alt="Profile Preview"
            />
            <div class="photo-upload-text">Upload Profile Photo</div>
            <div class="photo-upload-hint">
              Click to browse or drag & drop
            </div>
            <input
              type="file"
              id="photo-input"
              name="userPhoto"
              accept="image/*"
            />
          </div>
        </div>
        <div class="input-group">
          <input
            type="password"
            name="password"
            placeholder="Password"
            required
          />
          <i class="fas fa-lock"></i>
        </div>
        <div class="checkbox-group">
          <input type="checkbox" id="agree" name="agree" required />
          <label for="agree"
            >I agree to the Terms & Conditions and Privacy Policy.</label
          >
        </div>
        <button type="submit">Register</button>
      </form>

      <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
      </c:if>
      <c:if test="${not empty success}">
        <p style="color:green">${success}</p>
      </c:if>
    </div>

    <div class="side-panel">
      <h2>Welcome back!</h2>
      <p>Already have an account?</p>
      <a href="login.jsp">Login</a>
    </div>
  </div>

  <script>
    const photoInput = document.getElementById("photo-input");
    const photoPreview = document.getElementById("photo-preview");
    const photoPlaceholder = document.getElementById("photo-placeholder");
    const uploadContainer = document.querySelector(".photo-upload-container");

    photoInput.addEventListener("change", handlePhotoUpload);

    uploadContainer.addEventListener("dragover", (e) => {
      e.preventDefault();
      uploadContainer.classList.add("dragover");
    });

    uploadContainer.addEventListener("dragleave", () => {
      uploadContainer.classList.remove("dragover");
    });

    uploadContainer.addEventListener("drop", (e) => {
      e.preventDefault();
      uploadContainer.classList.remove("dragover");

      const files = e.dataTransfer.files;
      if (files.length > 0 && files[0].type.startsWith("image/")) {
        photoInput.files = files;
        handlePhotoUpload({ target: { files: files } });
      }
    });

    function handlePhotoUpload(event) {
      const file = event.target.files[0];

      if (file && file.type.startsWith("image/")) {
        const reader = new FileReader();

        reader.onload = function (e) {
          photoPreview.src = e.target.result;
          photoPreview.style.display = "block";
          photoPlaceholder.style.display = "none";
        };

        reader.readAsDataURL(file);
      }
    }
  </script>
</body>
</html>
 
   