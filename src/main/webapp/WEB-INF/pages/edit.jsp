<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Edit Item - Admin Dashboard</title>
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

      .edit-container {
        background-color: var(--medium-beige);
        padding: 2rem;
        border-radius: 20px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        max-width: 850px;
        width: 100%;
      }

      .back-arrow {
        display: inline-block;
        color: var(--deep-green);
        font-weight: 600;
        font-size: 1rem;
        margin-bottom: 1rem;
        text-decoration: none;
        transition: color 0.3s, transform 0.3s;
      }

      .back-arrow:hover {
        color: #3f6d36;
        transform: translateX(-4px);
      }

      .edit-heading {
        text-align: center;
        font-size: 2rem;
        font-weight: bold;
        color: var(--deep-green);
        margin-bottom: 2rem;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15);
      }

      .form-grid {
        display: grid;
        grid-template-columns: 1fr 2fr;
        gap: 2rem;
        align-items: start;
      }

      .image-section {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        align-items: center;
      }

      .current-image {
        width: 200px;
        height: 200px;
        border-radius: 10px;
        background-color: var(--dark-beige);
        overflow: hidden;
        border: 2px solid var(--deep-green);
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .current-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .form-fields {
        display: flex;
        flex-direction: column;
        gap: 1.2rem;
      }

      .form-group label {
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
        color: #333;
      }

      .form-group input,
      .form-group select,
      .form-group textarea {
        width: 100%;
        padding: 10px 14px;
        border: 1px solid var(--dark-beige);
        border-radius: 10px;
        background-color: var(--light-beige);
        font-size: 1rem;
        transition: border 0.3s, box-shadow 0.3s;
      }

      .form-group input:hover,
      .form-group textarea:hover,
      .form-group select:hover {
        border-color: var(--mint-green);
        box-shadow: 0 0 8px rgba(88, 160, 80, 0.2);
      }

      .save-button {
        margin-top: 2rem;
        padding: 14px;
        background-color: var(--deep-green);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 1.1rem;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        width: 100%;
        max-width: 300px;
      }

      .save-button:hover {
        background-color: #47723a;
        transform: translateY(-2px);
      }

      @media (max-width: 768px) {
        .form-grid {
          grid-template-columns: 1fr;
          text-align: center;
        }

        .save-button {
          margin: 2rem auto 0;
        }
      }
    </style>
  </head>
  <body>
    <div class="edit-container">
      <!-- Back to Product View -->
      <a href="view.html" class="back-arrow"> &#8592; Back to Products view </a>

      <!-- Page Heading -->
      <div class="edit-heading">Edit Item</div>

      <!-- Form Section -->
      <form method="POST" enctype="multipart/form-data">
        <div class="form-grid">
          <!-- Left: Image Section -->
          <div class="image-section">
            <div class="form-group">
              <label>Current Image</label>
              <div class="current-image">
                <img src="example-item.jpg" alt="Current Item Image" />
              </div>
            </div>

            <div class="form-group">
              <label for="newImage">New Image</label>
              <input
                type="file"
                id="newImage"
                name="newImage"
                accept="image/*" />
            </div>
          </div>

          <!-- Right: Editable Fields -->
          <div class="form-fields">
            <div class="form-group">
              <label for="title">Item Title</label>
              <input
                type="text"
                id="title"
                name="title"
                value="Handmade Notebook" />
            </div>

            <div class="form-group">
              <label for="category">Category</label>
              <select id="category" name="category">
                <option>Thrifted Artcraft</option>
                <option selected>Notebook</option>
                <option>Textbook</option>
                <option>Other</option>
              </select>
            </div>

            <div class="form-group">
              <label for="description">Description</label>
              <textarea id="description" name="description" rows="3">
Eco-friendly recycled notebook, perfect for school.</textarea
              >
            </div>

            <div class="form-group">
              <label for="price">Price (NPR)</label>
              <input type="number" id="price" name="price" value="150" />
            </div>
          </div>
        </div>

        <button type="submit" class="save-button">Save Changes</button>
      </form>
    </div>
  </body>
</html>
