<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Profile</title>
    <style>
      :root {
        --light-beige: #f1ede4;
        --medium-beige: #e8e4d8;
        --dark-beige: #d9d7b8;
        --mint-green: #a8d8a0;
        --deep-green: #5d8a4d;
      }

      body {
        font-family: "Segoe UI", sans-serif;
        background-color: var(--light-beige);
        margin: 0;
        padding: 40px 20px;
        display: flex;
        justify-content: center;
      }

      .profile-container {
        background: var(--medium-beige);
        padding: 1.5rem 2rem;
        border-radius: 20px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        max-width: 780px;
        width: 100%;
      }

      .profile-heading {
        text-align: center;
        font-size: 1.8rem;
        color: var(--deep-green);
        font-weight: bold;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        margin-bottom: 2rem;
      }

      .profile-body {
        display: flex;
        flex-wrap: wrap;
        gap: 2rem;
        justify-content: space-between;
        align-items: start;
      }

      .profile-left {
        flex: 1 1 180px;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .profile-picture label {
        cursor: pointer;
        width: 140px;
        height: 140px;
        border-radius: 50%;
        background-color: var(--dark-beige);
        border: 2px dashed var(--deep-green);
        display: flex;
        justify-content: center;
        align-items: center;
        color: var(--deep-green);
        font-size: 13px;
        text-align: center;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
      }

      .profile-picture label:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
      }

      .profile-picture input {
        display: none;
      }

      .profile-picture img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .profile-right {
        flex: 2 1 320px;
      }

      .form-group {
        margin-bottom: 1rem;
      }

      label {
        display: block;
        margin-bottom: 0.4rem;
        font-weight: 600;
        color: #333;
      }

      input[type="text"],
      input[type="email"],
      input[type="tel"] {
        width: 100%;
        max-width: 300px;
        padding: 10px 12px;
        border: 1px solid var(--dark-beige);
        border-radius: 8px;
        background-color: var(--light-beige);
        font-size: 0.95rem;
        transition: all 0.3s;
      }

      input[type="text"]:hover,
      input[type="email"]:hover,
      input[type="tel"]:hover {
        border-color: var(--mint-green);
        box-shadow: 0 0 8px rgba(88, 160, 80, 0.2);
      }

      .save-button {
        margin-top: 1.5rem;
        width: 100%;
        max-width: 300px;
        padding: 12px;
        background-color: var(--deep-green);
        color: #fff;
        border: none;
        border-radius: 10px;
        font-size: 1.05rem;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s;
      }

      .save-button:hover {
        background-color: #47723a;
        transform: translateY(-2px);
      }

      @media (max-width: 768px) {
        .profile-body {
          flex-direction: column;
          align-items: center;
        }

        .profile-right {
          width: 100%;
          text-align: center;
        }

        .save-button {
          width: 100%;
        }
      }
    </style>
  </head>
  <body>
    <div class="profile-container">
      <div class="profile-heading">User Profile</div>

      <div class="profile-body">
        <!-- Profile Image Upload -->
        <div class="profile-left">
          <div class="profile-picture">
            <label for="upload-photo">
              <span>Upload<br />Photo</span>
              <input
                type="file"
                id="upload-photo"
                accept="image/*"
                onchange="loadImage(event)" />
              <img id="preview" style="display: none" />
            </label>
          </div>
        </div>

        <!-- Profile Input Fields -->
        <div class="profile-right">
          <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" placeholder="Your name" />
          </div>

          <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" placeholder="Your address" />
          </div>

          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" placeholder="Your phone number" />
          </div>

          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Your email" />
          </div>

          <button class="save-button">Save Changes</button>
        </div>
      </div>
    </div>

    <script>
      const loadImage = (event) => {
        const preview = document.getElementById("preview");
        preview.src = URL.createObjectURL(event.target.files[0]);
        preview.style.display = "block";
        preview.onload = () => URL.revokeObjectURL(preview.src);
      };
    </script>
  </body>
</html>
