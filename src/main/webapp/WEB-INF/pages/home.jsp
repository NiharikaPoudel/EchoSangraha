<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Home Page</title>
  <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: { primary: "#2E7D32", secondary: "#1976D2" },
            borderRadius: {
              none: "0px",
              sm: "4px",
              DEFAULT: "8px",
              md: "12px",
              lg: "16px",
              xl: "20px",
              "2xl": "24px",
              "3xl": "32px",
              full: "9999px",
              button: "8px",
            },
          },
        },
      };
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Inter:wght@300;400;500;600&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css"
    />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
   <style>
      :where([class^="ri-"])::before {
        content: "\f3c2";
      }
      body {
        font-family: "Inter", sans-serif;
      }
      h1,
      h2,
      h3,
      h4,
      h5,
      h6 {
        font-family: "Poppins", sans-serif;
      }
      .hero-section {
        background-image: url("images/hero.jpg");
        background-size: cover;
        background-position: center right;
      }
      .counter-value {
        transition: all 0.5s ease;
      }
      .search-input:focus {
        width: 300px;
      }
      .search-input {
        transition: width 0.3s ease-in-out;
      }
      .category-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
          0 4px 6px -2px rgba(0, 0, 0, 0.05);
      }
      .category-card {
        transition: all 0.3s ease;
      }
      .listing-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
          0 4px 6px -2px rgba(0, 0, 0, 0.05);
      }
      .listing-card {
        transition: all 0.3s ease;
      }
      .custom-switch {
        position: relative;
        display: inline-block;
        width: 46px;
        height: 24px;
      }
      .custom-switch input {
        opacity: 0;
        width: 0;
        height: 0;
      }
      .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #f5f5dc; /* Beige color */
        transition: 0.4s;
        border-radius: 24px;
      }

      .slider:before {
        position: absolute;
        content: "";
        height: 18px;
        width: 18px;
        left: 3px;
        bottom: 3px;
        background-color: #f5f5dc; /* Beige color */
        transition: 0.4s;
        border-radius: 50%;
      }
      input:checked + .slider {
        background-color: #2e7d32;
      }
      input:checked + .slider:before {
        transform: translateX(22px);
      }
   </style>
   
</head>
<body class="bg-[#D9D7B8] min-h-screen">
    <!-- Header -->
    <header class="sticky top-0 z-50 bg-[#EAE6D9] shadow-sm">
      <div
        class="container mx-auto px-4 py-3 flex items-center justify-between"
      >
        <div class="flex items-center">
          <a href="#" class="text-3xl font-['Pacifico'] text-primary"
            >EcoSangraha</a
          >
        </div>

        <nav class="hidden md:flex items-center space-x-6">
          <a
            href="home.html"
            class="text-gray-700 hover:text-primary font-medium"
            >Home</a
          >
          <div class="relative group">
            <button
              class="flex items-center text-gray-700 hover:text-primary font-medium"
            >
              Browse items
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-down-s-line"></i>
              </div>
            </button>
            <div
              class="absolute left-0 mt-2 w-48 bg-white rounded shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50"
            >
              <a
                href="product.html"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Paper & Stationery</a
              >
              <a
                href="#"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Office Supplies</a
              >
              <a
                href="product.html"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Event Materials</a
              >
              <a
                href="product.html"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Art Supplies</a
              >
              <a
                href="product.html"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >All Categories</a
              >
            </div>
          </div>
          <a
            href="blog.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >Blog</a
          >
          <a
            href="Aboutus.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >About us
          </a>
          <a
            href="help.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >Help</a
          >
        </nav>
        <div class="flex items-center space-x-4">
          <div class="relative hidden md:block">
            <input
              type="text"
              placeholder="Search items..."
              class="search-input w-40 py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20"
            />
            <div
              class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400"
            >
              <i class="ri-search-line"></i>
            </div>
          </div>
          <!-- Login and Signup buttons -->
          <div class="flex gap-4">
            <button
              class="bg-primary text-white px-6 py-2 rounded font-medium hover:bg-primary/90 transition"
              onclick="window.location.href='login.jsp'"
            >
              Login
            </button>

            <button
              class="bg-white text-primary border border-primary px-6 py-2 rounded font-medium hover:bg-primary/5 transition"
              onclick="window.location.href='registration.jsp'"
            >
              Sign Up
            </button>
          </div>
          <!-- Admin Icon (opens admin.html on click) -->
          <div
            class="w-10 h-10 flex items-center justify-center cursor-pointer"
            onclick="window.location.href='admin.jsp'"
          >
            <i
              class="ri-shield-user-line text-gray-700 hover:text-primary text-xl"
            ></i>
          </div>

          <button
            class="md:hidden w-10 h-10 flex items-center justify-center"
            id="mobile-menu-button"
          >
            <i class="ri-menu-line text-xl"></i>
          </button>
        </div>
        <div
          id="mobile-menu"
          class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden"
        >
          <div
            class="absolute right-0 top-0 h-full w-64 bg-white shadow-lg transform transition-transform duration-300 translate-x-full"
          >
            <div class="p-4">
              <div class="flex justify-between items-center mb-6">
                <h3 class="text-lg font-semibold">Menu</h3>
                <button
                  id="close-menu-button"
                  class="w-8 h-8 flex items-center justify-center"
                >
                  <i class="ri-close-line text-xl"></i>
                </button>
              </div>
              <div class="mb-4">
                <div class="relative">
                  <input
                    type="text"
                    placeholder="Search items..."
                    class="w-full py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20"
                  />
                  <div
                    class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400"
                  >
                    <i class="ri-search-line"></i>
                  </div>
                </div>
              </div>
              <nav class="space-y-4">
                <a
                  href="home.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Home
                </a>
                <a
                  href="product .jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Browse Items</a
                >
                <a
                  href="blog.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Blog</a
                >
                <a
                  href="Aboutus.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >About us</a
                >
                <a
                  href="help.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Help</a
                >
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- Hero Section -->
    <section class="hero-section relative py-20">
      <div class="container mx-auto px-4 w-full">
        <div class="max-w-xl">
          <h1 class="text-4xl md:text-5xl font-bold text-gray-800 mb-4">
            Sustainable Supplies, Smarter Savings
          </h1>
          <p class="text-lg text-gray-600 mb-8">
            Connect with your community to buy and sell reusable materials at
            minimal cost. Reduce waste while making resources more affordable.
          </p>
          <div class="flex flex-wrap gap-4">
            <button
              class="bg-primary text-white px-6 py-3 rounded-button font-medium hover:bg-primary/90 transition flex items-center !rounded-button whitespace-nowrap"
              onclick="window.location.href='product.html'"
            >
              <div class="w-5 h-5 mr-2 flex items-center justify-center">
                <i class="ri-search-line"></i>
              </div>
              Find Items Now
            </button>
            <button
              class="bg-white text-primary border-2 border-primary px-6 py-3 rounded-button font-medium hover:bg-primary/5 transition flex items-center !rounded-button whitespace-nowrap"
            >
              <div class="w-5 h-5 mr-2 flex items-center justify-center">
                <i class="ri-upload-2-line"></i>
              </div>
              List Your Surplus
            </button>
          </div>
        </div>
      </div>
    </section>
    <!-- Featured Categories -->
    <section class="py-16 bg-[#E8E4D8]">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">Browse by Category</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-primary/10 rounded-full flex items-center justify-center"
            >
              <i class="ri-file-paper-2-line text-primary text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Paper & Stationery</h3>
            <p class="text-gray-600 mb-4">
              Notebooks, paper, folders, and more
            </p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-secondary/10 rounded-full flex items-center justify-center"
            >
              <i class="ri-pencil-ruler-2-line text-secondary text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Office Supplies</h3>
            <p class="text-gray-600 mb-4">
              Pens, markers, staplers, and organizers
            </p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-orange-100 rounded-full flex items-center justify-center"
            >
              <i class="ri-calendar-event-line text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Event Materials</h3>
            <p class="text-gray-600 mb-4">
              Banners, signs, and promotional items
            </p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-purple-100 rounded-full flex items-center justify-center"
            >
              <i class="ri-palette-line text-purple-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Art Supplies</h3>
            <p class="text-gray-600 mb-4">
              Paints, brushes, canvases, and more
            </p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-pink-100 rounded-full flex items-center justify-center"
            >
              <i class="ri-book-open-line text-pink-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Textbooks</h3>
            <p class="text-gray-600 mb-4">Used textbooks for various courses</p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
          <div
            class="category-card bg-white p-6 rounded-lg shadow-sm flex flex-col items-center text-center"
          >
            <div
              class="w-16 h-16 mb-4 bg-teal-100 rounded-full flex items-center justify-center"
            >
              <i class="ri-archive-line text-teal-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold mb-2">Storage & Organization</h3>
            <p class="text-gray-600 mb-4">
              Bins, folders, and organizational tools
            </p>
            <a
              href="product.jsp"
              class="text-primary font-medium flex items-center"
            >
              Browse
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-right-line"></i>
              </div>
            </a>
          </div>
        </div>
      </div>
    </section>
    <!-- Recent Listings -->
    <section class="py-16 bg-[#F1EDE4]">
      <div class="container mx-auto px-4">
        <div class="flex justify-between items-center mb-8">
          <h2 class="text-3xl font-bold">Recent Listings</h2>
          <a href="#" class="text-primary font-medium flex items-center">
            View All
            <div class="w-5 h-5 ml-1 flex items-center justify-center">
              <i class="ri-arrow-right-line"></i>
            </div>
          </a>
        </div>
        <div class="relative">
          <div
            class="flex overflow-x-auto pb-6 space-x-6 no-scrollbar"
            id="listings-carousel"
          >
            <div
              class="listing-card flex-shrink-0 w-64 bg-white rounded-lg shadow-sm overflow-hidden mx-2"
            >
              <div class="h-40 bg-gray-200 relative">
                <img
                  src="images/notebooks-binders.jpg"
                  alt="Notebooks and Binders"
                  class="w-full h-full object-cover object-top"
                />
                <div
                  class="absolute top-2 right-2 bg-primary text-white text-xs px-2 py-1 rounded"
                >
                  New
                </div>
              </div>

              <div class="p-4">
                <h3 class="font-semibold text-gray-800 mb-1">
                  Assorted Notebooks & Binders
                </h3>
                <div class="flex justify-between items-center mb-2">
                  <span class="text-primary font-bold">$12.50</span>
                  <span class="text-sm text-gray-500">Posted 2 days ago</span>
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <div class="w-4 h-4 mr-1 flex items-center justify-center">
                    <i class="ri-building-2-line"></i>
                  </div>
                  Islington College
                </div>
              </div>
            </div>
            <div
              class="listing-card flex-shrink-0 w-64 bg-white rounded-lg shadow-sm overflow-hidden"
            >
              <div class="h-40 bg-gray-200 relative">
                <img
                  src="images/markers-pens.jpg"
                  alt="Markers and Pens"
                  class="w-full h-full object-cover object-top"
                />
              </div>
              <div class="p-4">
                <h3 class="font-semibold text-gray-800 mb-1">
                  Premium Markers & Pens Set
                </h3>
                <div class="flex justify-between items-center mb-2">
                  <span class="text-primary font-bold">$8.75</span>
                  <span class="text-sm text-gray-500">Posted 1 week ago</span>
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <div class="w-4 h-4 mr-1 flex items-center justify-center">
                    <i class="ri-building-2-line"></i>
                  </div>
                  Berkeley College
                </div>
              </div>
            </div>
            <div
              class="listing-card flex-shrink-0 w-64 bg-white rounded-lg shadow-sm overflow-hidden"
            >
              <div class="h-40 bg-gray-200 relative">
                <img
                  src="images/file-organizers.jpg"
                  alt="File Organizers"
                  class="w-full h-full object-cover object-top"
                />
                <div
                  class="absolute top-2 right-2 bg-orange-500 text-white text-xs px-2 py-1 rounded"
                >
                  Popular
                </div>
              </div>
              <div class="p-4">
                <h3 class="font-semibold text-gray-800 mb-1">
                  File Organizers Bundle
                </h3>
                <div class="flex justify-between items-center mb-2">
                  <span class="text-primary font-bold">$15.00</span>
                  <span class="text-sm text-gray-500">Posted 3 days ago</span>
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <div class="w-4 h-4 mr-1 flex items-center justify-center">
                    <i class="ri-building-2-line"></i>
                  </div>
                  UCLA Administration
                </div>
              </div>
            </div>
            <div
              class="listing-card flex-shrink-0 w-64 bg-white rounded-lg shadow-sm overflow-hidden"
            >
              <div class="h-40 bg-gray-200 relative">
                <img
                  src="images/art-supplies.jpg"
                  alt="Art Supplies"
                  class="w-full h-full object-cover object-top"
                />
              </div>
              <div class="p-4">
                <h3 class="font-semibold text-gray-800 mb-1">
                  Art Supplies Collection
                </h3>
                <div class="flex justify-between items-center mb-2">
                  <span class="text-primary font-bold">$22.99</span>
                  <span class="text-sm text-gray-500">Posted 5 days ago</span>
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <div class="w-4 h-4 mr-1 flex items-center justify-center">
                    <i class="ri-building-2-line"></i>
                  </div>
                  Columbia Art Department
                </div>
              </div>
            </div>
            <div
              class="listing-card flex-shrink-0 w-64 bg-white rounded-lg shadow-sm overflow-hidden"
            >
              <div class="h-40 bg-gray-200 relative">
                <img
                  src="images/textbooks.jpg"
                  alt="Textbooks"
                  class="w-full h-full object-cover object-top"
                />
                <div
                  class="absolute top-2 right-2 bg-secondary text-white text-xs px-2 py-1 rounded"
                >
                  Best Value
                </div>
              </div>
              <div class="p-4">
                <h3 class="font-semibold text-gray-800 mb-1">
                  Engineering Textbooks Set
                </h3>
                <div class="flex justify-between items-center mb-2">
                  <span class="text-primary font-bold">$45.00</span>
                  <span class="text-sm text-gray-500">Posted 1 day ago</span>
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <div class="w-4 h-4 mr-1 flex items-center justify-center">
                    <i class="ri-building-2-line"></i>
                  </div>
                  MIT Engineering Dept
                </div>
              </div>
            </div>
          </div>
          <button
            class="absolute left-0 top-1/2 transform -translate-y-1/2 -ml-4 w-10 h-10 bg-white rounded-full shadow-md flex items-center justify-center text-gray-600 hover:text-primary z-10"
            id="prev-btn"
          >
            <i class="ri-arrow-left-s-line text-xl"></i>
          </button>
          <button
            class="absolute right-0 top-1/2 transform -translate-y-1/2 -mr-4 w-10 h-10 bg-white rounded-full shadow-md flex items-center justify-center text-gray-600 hover:text-primary z-10"
            id="next-btn"
          >
            <i class="ri-arrow-right-s-line text-xl"></i>
          </button>
        </div>
      </div>
    </section>
    <!-- Impact Section -->
    <section class="py-16 bg-[#E8E4D8]">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-4">Our Impact</h2>
        <p class="text-gray-600 text-center max-w-2xl mx-auto mb-12">
          Together, we're making a difference by extending the lifecycle of
          educational and office materials.
        </p>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="bg-white p-8 rounded-lg shadow-sm text-center">
            <div
              class="w-16 h-16 mx-auto mb-4 bg-primary/10 rounded-full flex items-center justify-center"
            >
              <i class="ri-recycle-line text-primary text-2xl"></i>
            </div>
            <h3 class="text-4xl font-bold text-gray-800 mb-2">
              <span class="counter-value" data-target="12500">0</span> kg
            </h3>
            <p class="text-gray-600">Waste Saved</p>
          </div>
          <div class="bg-white p-8 rounded-lg shadow-sm text-center">
            <div
              class="w-16 h-16 mx-auto mb-4 bg-secondary/10 rounded-full flex items-center justify-center"
            >
              <i class="ri-team-line text-secondary text-2xl"></i>
            </div>
            <h3 class="text-4xl font-bold text-gray-800 mb-2">
              <span class="counter-value" data-target="248">0</span>+
            </h3>
            <p class="text-gray-600">Active Partners</p>
          </div>
          <div class="bg-white p-8 rounded-lg shadow-sm text-center">
            <div
              class="w-16 h-16 mx-auto mb-4 bg-orange-100 rounded-full flex items-center justify-center"
            >
              <i class="ri-box-3-line text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-4xl font-bold text-gray-800 mb-2">
              <span class="counter-value" data-target="34750">0</span>
            </h3>
            <p class="text-gray-600">Items Rehomed</p>
          </div>
        </div>
      </div>
    </section>
    <!-- How It Works -->
    <section class="py-16 bg-[#F1EDE4]">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">How It Works</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="relative">
            <div
              class="bg-white p-6 rounded-lg shadow-sm text-center relative z-10"
            >
              <div
                class="w-12 h-12 mx-auto mb-4 bg-primary text-white rounded-full flex items-center justify-center font-bold text-xl"
              >
                1
              </div>
              <h3 class="text-xl font-semibold mb-3">List</h3>
              <p class="text-gray-600">
                Institutions and individuals list surplus materials they no
                longer need.
              </p>
            </div>
            <div
              class="hidden md:block absolute top-1/2 left-full w-full h-1 bg-gray-200 -z-10 transform -translate-y-1/2"
            ></div>
          </div>
          <div class="relative">
            <div
              class="bg-white p-6 rounded-lg shadow-sm text-center relative z-10"
            >
              <div
                class="w-12 h-12 mx-auto mb-4 bg-secondary text-white rounded-full flex items-center justify-center font-bold text-xl"
              >
                2
              </div>
              <h3 class="text-xl font-semibold mb-3">Discover</h3>
              <p class="text-gray-600">
                Browse and find affordable materials that meet your needs.
              </p>
            </div>
            <div
              class="hidden md:block absolute top-1/2 left-full w-full h-1 bg-gray-200 -z-10 transform -translate-y-1/2"
            ></div>
          </div>
          <div>
            <div
              class="bg-white p-6 rounded-lg shadow-sm text-center relative z-10"
            >
              <div
                class="w-12 h-12 mx-auto mb-4 bg-orange-500 text-white rounded-full flex items-center justify-center font-bold text-xl"
              >
                3
              </div>
              <h3 class="text-xl font-semibold mb-3">Reuse</h3>
              <p class="text-gray-600">
                Give materials a second life while saving money and reducing
                waste.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonials -->
    <section class="py-16 bg-[#A8D8A0]">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center mb-12">
          What Our Community Says
        </h2>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div class="bg-white p-6 rounded-lg shadow-sm">
            <div class="flex items-center mb-4">
              <div class="text-yellow-400 flex">
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
              </div>
            </div>
            <p class="text-gray-600 mb-6">
              "As a student on a tight budget, PaperCycle has been a
              game-changer. I've saved over $200 on supplies this semester
              alone, and it feels great knowing I'm helping reduce waste."
            </p>
            <div class="flex items-center">
              <div
                class="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center mr-3"
              >
                <i class="ri-user-line text-gray-500"></i>
              </div>
              <div>
                <h4 class="font-medium">Emma Rodriguez</h4>
                <p class="text-sm text-gray-500">Graduate Student, NYU</p>
              </div>
            </div>
          </div>
          <div class="bg-white p-6 rounded-lg shadow-sm">
            <div class="flex items-center mb-4">
              <div class="text-yellow-400 flex">
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
              </div>
            </div>
            <p class="text-gray-600 mb-6">
              "Our department had boxes of supplies gathering dust after events.
              Now we list them on PaperCycle and know they're going to people
              who will use them. It's efficient and aligns with our
              sustainability goals."
            </p>
            <div class="flex items-center">
              <div
                class="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center mr-3"
              >
                <i class="ri-user-line text-gray-500"></i>
              </div>
              <div>
                <h4 class="font-medium">Dr. James Wilson</h4>
                <p class="text-sm text-gray-500">Department Chair, UC Davis</p>
              </div>
            </div>
          </div>
          <div class="bg-white p-6 rounded-lg shadow-sm">
            <div class="flex items-center mb-4">
              <div class="text-yellow-400 flex">
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-fill"></i>
                <i class="ri-star-half-fill"></i>
              </div>
            </div>
            <p class="text-gray-600 mb-6">
              "I run a small community art program, and PaperCycle has been
              essential for sourcing affordable materials. The platform is easy
              to use, and I've connected with local institutions I never would
              have otherwise."
            </p>
            <div class="flex items-center">
              <div
                class="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center mr-3"
              >
                <i class="ri-user-line text-gray-500"></i>
              </div>
              <div>
                <h4 class="font-medium">Sarah Chen</h4>
                <p class="text-sm text-gray-500">Community Arts Director</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- CTA Section -->
    <section class="py-16 bg-[#E8E4D8]">
      <div class="container mx-auto px-4 text-center">
        <h2 class="text-3xl font-bold mb-4">
          Ready to Join the Circular Economy?
        </h2>
        <p class="text-gray-600 max-w-2xl mx-auto mb-8">
          Whether you're looking to find affordable supplies or give your
          surplus materials a second life, PaperCycle makes it easy and
          sustainable.
        </p>
        <div class="flex flex-wrap justify-center gap-4">
          <button
            class="bg-primary text-white px-6 py-3 rounded-button font-medium hover:bg-primary/90 transition whitespace-nowrap"
          >
            Get Started Now
          </button>
          <!-- Your original button with onclick added -->
          <button
            class="bg-white text-primary border-2 border-primary px-6 py-3 rounded-button font-medium hover:bg-primary/5 transition whitespace-nowrap"
            onclick="window.location.href='blog.html'"
          >
            Learn More
          </button>
        </div>
      </div>
    </section>
    <!-- Newsletter -->
    <section class="py-16 bg-[#F1EDE4]">
      <div class="container mx-auto px-4">
        <div class="max-w-3xl mx-auto bg-gray-50 p-8 rounded-lg shadow-sm">
          <div class="text-center mb-6">
            <h2 class="text-2xl font-bold mb-2">Stay Updated</h2>
            <p class="text-gray-600">
              Subscribe to our newsletter for the latest listings and
              sustainability tips.
            </p>
          </div>
          <form class="flex flex-col sm:flex-row gap-3">
            <input
              type="email"
              placeholder="Your email address"
              class="flex-grow px-4 py-3 rounded-button text-sm border-none focus:outline-none focus:ring-2 focus:ring-primary/20"
            />
            <button
              type="submit"
              class="bg-primary text-white px-6 py-3 rounded-button font-medium hover:bg-primary/90 transition whitespace-nowrap"
            >
              Subscribe
            </button>
          </form>
          <div class="mt-4 flex items-center justify-center">
            <label class="custom-switch mr-2">
              <input type="checkbox" checked />
              <span class="slider"></span>
            </label>
            <span class="text-sm text-gray-600"
              >I agree to receive updates and marketing emails</span
            >
          </div>
        </div>
      </div>
    </section>
    <!-- Footer -->
    <footer class="bg-[#5D8A4D] text-white pt-16 pb-8">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-12">
          <div>
            <h3 class="text-xl font-['Pacifico'] mb-4">PaperCycle</h3>
            <p class="text-gray-400 mb-4">
              Connecting communities through sustainable resource sharing.
            </p>
            <div class="flex space-x-4">
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
              >
                <i class="ri-facebook-fill"></i>
              </a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
              >
                <i class="ri-twitter-x-fill"></i>
              </a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
              >
                <i class="ri-instagram-line"></i>
              </a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
              >
                <i class="ri-linkedin-fill"></i>
              </a>
            </div>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
            <ul class="space-y-2">
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Browse Items</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >List an Item</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >For Institutions</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Sustainability Report</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Partner With Us</a
                >
              </li>
            </ul>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Help & Support</h4>
            <ul class="space-y-2">
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >FAQ</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Contact Us</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Shipping Information</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Return Policy</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Safety Tips</a
                >
              </li>
            </ul>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Legal</h4>
            <ul class="space-y-2">
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Terms of Service</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Privacy Policy</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Cookie Policy</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Accessibility</a
                >
              </li>
              <li>
                <a href="#" class="text-black hover:text-white transition"
                  >Community Guidelines</a
                >
              </li>
            </ul>
          </div>
        </div>
        <div
          class="pt-8 border-t border-gray-700 flex flex-col md:flex-row justify-between items-center"
        >
          <p class="text-dark-blue text-sm mb-4 md:mb-0">
            © 2025 PaperCycle. All rights reserved.
          </p>

          <div class="flex space-x-4">
            <div class="w-8 h-8 flex items-center justify-center">
              <i class="ri-visa-line text-dark-blue"></i>
            </div>
            <div class="w-8 h-8 flex items-center justify-center">
              <i class="ri-mastercard-line text-yellow-400"></i>
            </div>
            <div class="w-8 h-8 flex items-center justify-center">
              <i class="ri-paypal-line text-orange-500"></i>
            </div>
            <div class="w-8 h-8 flex items-center justify-center">
              <i class="ri-apple-fill text-white"></i>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <script id="carousel-script">
      document.addEventListener("DOMContentLoaded", function () {
        const carousel = document.getElementById("listings-carousel");
        const prevBtn = document.getElementById("prev-btn");
        const nextBtn = document.getElementById("next-btn");
        if (carousel && prevBtn && nextBtn) {
          const scrollAmount = 300;
          prevBtn.addEventListener("click", function () {
            carousel.scrollBy({
              left: -scrollAmount,
              behavior: "smooth",
            });
          });
          nextBtn.addEventListener("click", function () {
            carousel.scrollBy({
              left: scrollAmount,
              behavior: "smooth",
            });
          });
        }
      });
    </script>
    <script id="mobile-menu-script">
      document.addEventListener("DOMContentLoaded", function () {
        const mobileMenuButton = document.getElementById("mobile-menu-button");
        const closeMenuButton = document.getElementById("close-menu-button");
        const mobileMenu = document.getElementById("mobile-menu");
        const mobileMenuContent = mobileMenu.querySelector("div");
        function openMenu() {
          mobileMenu.classList.remove("hidden");
          setTimeout(() => {
            mobileMenuContent.classList.remove("translate-x-full");
          }, 10);
        }
        function closeMenu() {
          mobileMenuContent.classList.add("translate-x-full");
          setTimeout(() => {
            mobileMenu.classList.add("hidden");
          }, 300);
        }
        mobileMenuButton.addEventListener("click", openMenu);
        closeMenuButton.addEventListener("click", closeMenu);
        mobileMenu.addEventListener("click", function (e) {
          if (e.target === mobileMenu) {
            closeMenu();
          }
        });
      });
    </script>
    <script id="counter-script">
      document.addEventListener("DOMContentLoaded", function () {
        const counters = document.querySelectorAll(".counter-value");
        counters.forEach((counter) => {
          const target = parseInt(counter.getAttribute("data-target"));
          const duration = 2000; // milliseconds
          const step = Math.ceil(target / (duration / 16)); // 60fps
          let current = 0;
          const updateCounter = () => {
            current += step;
            if (current >= target) {
              counter.textContent = target.toLocaleString();
            } else {
              counter.textContent = current.toLocaleString();
              requestAnimationFrame(updateCounter);
            }
          };
          const observer = new IntersectionObserver(
            (entries) => {
              entries.forEach((entry) => {
                if (entry.isIntersecting) {
                  updateCounter();
                  observer.unobserve(entry.target);
                }
              });
            },
            { threshold: 0.5 }
          );
          observer.observe(counter);
        });
      });
    </script>
  </body>
</html>
