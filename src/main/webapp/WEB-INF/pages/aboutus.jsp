<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us - PaperCycle</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
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
      .star {
        cursor: pointer;
      }
    </style>
    <script>
      function rate(stars) {
        const starElems = document.querySelectorAll(".star");
        document.getElementById("rating-input").value = stars;
        starElems.forEach((star, index) => {
          star.classList.toggle("text-yellow-400", index < stars);
          star.classList.toggle("text-gray-300", index >= stars);
        });
      }

      function validateForm(event) {
        event.preventDefault();
        const firstName = document.getElementById("first-name").value.trim();
        const lastName = document.getElementById("last-name").value.trim();
        const email = document.getElementById("email").value.trim();
        const rating = document.getElementById("rating-input").value;
        const message = document.getElementById("message").value.trim();

        if (!firstName || !lastName || !email || !rating || !message) {
          alert("Please fill out all fields and give a rating.");
          return false;
        }

        alert("Thank you for your feedback!");
        event.target.submit();
      }
    </script>
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
      rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Inter:wght@300;400;500;600&display=swap"
      rel="stylesheet" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" />
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
        background-image: url("<%=request.getContextPath()%>/images/hero.jpg");
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
        background-color: #f5f5dc;
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
        background-color: #f5f5dc;
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
  <body class="bg-[#D9D7B8]">
    <!-- Header -->
    <header class="sticky top-0 z-50 bg-[#EAE6D9] shadow-sm">
      <div
        class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center">
          <a
            href="<%=request.getContextPath()%>/home.jsp"
            class="text-3xl font-['Pacifico'] text-primary"
            >PaperCycle</a
          >
        </div>
        <nav class="hidden md:flex items-center space-x-6">
          <a
            href="<%=request.getContextPath()%>/home.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >Home</a
          >
          <div class="relative group">
            <button
              class="flex items-center text-gray-700 hover:text-primary font-medium">
              Browse items
              <div class="w-5 h-5 ml-1 flex items-center justify-center">
                <i class="ri-arrow-down-s-line"></i>
              </div>
            </button>
            <div
              class="absolute left-0 mt-2 w-48 bg-white rounded shadow-lg opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50">
              <a
                href="<%=request.getContextPath()%>/product.jsp"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Paper & Stationery</a
              >
              <a
                href="#"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Office Supplies</a
              >
              <a
                href="<%=request.getContextPath()%>/product.jsp"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Event Materials</a
              >
              <a
                href="<%=request.getContextPath()%>/product.jsp"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >Art Supplies</a
              >
              <a
                href="<%=request.getContextPath()%>/product.jsp"
                class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
                >All Categories</a
              >
            </div>
          </div>
          <a
            href="<%=request.getContextPath()%>/blog.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >Blog</a
          >
          <a
            href="<%=request.getContextPath()%>/Aboutus.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >About us</a
          >
          <a
            href="<%=request.getContextPath()%>/help.jsp"
            class="text-gray-700 hover:text-primary font-medium"
            >Help</a
          >
        </nav>
        <div class="flex items-center space-x-4">
          <div class="relative hidden md:block">
            <input
              type="text"
              placeholder="Search items..."
              class="search-input w-40 py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20" />
            <div
              class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400">
              <i class="ri-search-line"></i>
            </div>
          </div>
          <!-- Login and Signup buttons -->
          <div class="flex gap-4">
            <c:choose>
              <c:when test="${not empty sessionScope.user}">
                <button
                  class="bg-primary text-white px-6 py-2 rounded font-medium hover:bg-primary/90 transition"
                  onclick="window.location.href='<%=request.getContextPath()%>/logout'">
                  Logout
                </button>
              </c:when>
              <c:otherwise>
                <button
                  class="bg-primary text-white px-6 py-2 rounded font-medium hover:bg-primary/90 transition"
                  onclick="window.location.href='<%=request.getContextPath()%>/login.jsp'">
                  Login
                </button>
                <button
                  class="bg-white text-primary border border-primary px-6 py-2 rounded font-medium hover:bg-primary/5 transition"
                  onclick="window.location.href='<%=request.getContextPath()%>/registration.jsp'">
                  Sign Up
                </button>
              </c:otherwise>
            </c:choose>
          </div>
          <div class="relative w-10 h-10 flex items-center justify-center">
            <i
              class="ri-shopping-cart-2-line text-gray-700 hover:text-primary text-xl"></i>
            <span
              class="absolute -top-1 -right-1 bg-primary text-white text-xs w-5 h-5 flex items-center justify-center rounded-full"
              >${sessionScope.cartItems != null ? sessionScope.cartItems.size()
              : 0}</span
            >
          </div>
          <button
            class="md:hidden w-10 h-10 flex items-center justify-center"
            id="mobile-menu-button">
            <i class="ri-menu-line text-xl"></i>
          </button>
        </div>
        <div
          id="mobile-menu"
          class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden">
          <div
            class="absolute right-0 top-0 h-full w-64 bg-white shadow-lg transform transition-transform duration-300 translate-x-full">
            <div class="p-4">
              <div class="flex justify-between items-center mb-6">
                <h3 class="text-lg font-semibold">Menu</h3>
                <button
                  id="close-menu-button"
                  class="w-8 h-8 flex items-center justify-center">
                  <i class="ri-close-line text-xl"></i>
                </button>
              </div>
              <div class="mb-4">
                <div class="relative">
                  <input
                    type="text"
                    placeholder="Search items..."
                    class="w-full py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20" />
                  <div
                    class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400">
                    <i class="ri-search-line"></i>
                  </div>
                </div>
              </div>
              <nav class="space-y-4">
                <a
                  href="<%=request.getContextPath()%>/home.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Home</a
                >
                <a
                  href="<%=request.getContextPath()%>/product.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Browse Items</a
                >
                <a
                  href="<%=request.getContextPath()%>/blog.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Blog</a
                >
                <a
                  href="<%=request.getContextPath()%>/Aboutus.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >About us</a
                >
                <a
                  href="<%=request.getContextPath()%>/help.jsp"
                  class="block text-gray-700 hover:text-primary"
                  >Help</a
                >
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- About Section -->
    <section class="bg-[#F1EDE4] py-16">
      <div class="container mx-auto px-6">
        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div>
            <h2 class="text-4xl font-bold text-[#2E7D32] mb-4">
              About PaperCycle
            </h2>
            <p class="text-gray-700 text-lg leading-relaxed mb-6">
              At PaperCycle, we believe sustainability begins with small, smart
              choices. Our platform empowers communities, institutions, and
              individuals to give a second life to paper, stationery, and event
              materials that would otherwise go to waste.
            </p>
            <a
              href="#team"
              class="inline-block bg-[#5D8A4D] text-white py-3 px-6 rounded-md font-semibold hover:bg-[#4B6F3D] transition"
              >Our Members</a
            >
          </div>
          <div class="grid grid-cols-2 gap-4">
            <img
              src="<%=request.getContextPath()%>/images/rr.jpg"
              alt="Team working"
              class="rounded-lg shadow-md" />
            <img
              src="<%=request.getContextPath()%>/images/reuse1.jpg"
              alt="Recycling process"
              class="rounded-lg shadow-md" />
          </div>
        </div>
      </div>
    </section>
    <!-- Mission Section -->
    <section class="bg-[#E8E4D8] py-16">
      <div
        class="container mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
        <img
          src="<%=request.getContextPath()%>/images/reduce.jpg"
          alt="Our Mission"
          class="rounded-lg shadow-lg" />
        <div>
          <h3 class="text-3xl font-semibold text-[#2E7D32] mb-4">
            Our Mission
          </h3>
          <p class="text-gray-700 text-lg leading-relaxed">
            Our mission is to reduce paper waste by fostering a culture of
            reuse. We strive to create a platform that connects people with
            surplus resources to those who need them—keeping materials out of
            landfills and in productive use.
          </p>
        </div>
      </div>
    </section>
    <!-- Value Section -->
    <section class="bg-[#F1EDE4] py-16">
      <div
        class="container mx-auto px-6 grid md:grid-cols-2 gap-12 items-center">
        <div>
          <h3 class="text-3xl font-semibold text-[#2E7D32] mb-4">Our Value</h3>
          <p class="text-gray-700 text-lg leading-relaxed">
            We value community-driven sustainability. Through transparency,
            collaboration, and technology, PaperCycle is redefining how we think
            about waste, one sheet of paper at a time.
          </p>
        </div>
        <img
          src="<%=request.getContextPath()%>/images/re.webp"
          alt="Our Value"
          class="rounded-lg shadow-lg" />
      </div>
    </section>
    <!-- Team Section -->
    <section id="team" class="bg-[#A8D8A0] py-16">
      <div class="container mx-auto px-6 text-center">
        <h2 class="text-4xl font-bold text-[#2E7D32] mb-12">Meet Our Team</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-xl hover:-translate-y-1 transition">
            <img
              src="<%=request.getContextPath()%>/images/admin.jpg"
              alt="Team Member 1"
              class="w-24 h-24 mx-auto rounded-full mb-4" />
            <h4 class="text-xl font-semibold">Anisha Thapa</h4>
            <p class="text-gray-600">Co-Founder</p>
          </div>
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-xl hover:-translate-y-1 transition">
            <img
              src="<%=request.getContextPath()%>/images/swikriti.jpg"
              alt="Team Member 2"
              class="w-24 h-24 mx-auto rounded-full mb-4" />
            <h4 class="text-xl font-semibold">Ravi Karki</h4>
            <p class="text-gray-600">Technical Lead</p>
          </div>
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-xl hover:-translate-y-1 transition">
            <img
              src="<%=request.getContextPath()%>/images/sneha.jpg"
              alt="Team Member 3"
              class="w-24 h-24 mx-auto rounded-full mb-4" />
            <h4 class="text-xl font-semibold">Meena Basnet</h4>
            <p class="text-gray-600">Operations Manager</p>
          </div>
          <div
            class="bg-white p-6 rounded-lg shadow-md hover:shadow-xl hover:-translate-y-1 transition">
            <img
              src="<%=request.getContextPath()%>/images/Niharika's.jpg"
              alt="Team Member 4"
              class="w-24 h-24 mx-auto rounded-full mb-4" />
            <h4 class="text-xl font-semibold">Suman Rai</h4>
            <p class="text-gray-600">Sustainability Advisor</p>
          </div>
        </div>
      </div>
    </section>
    <!-- Feedback Form Section -->
    <section class="bg-[#E8E4D8] py-20">
      <div class="container mx-auto px-6 max-w-3xl">
        <h2 class="text-3xl font-bold text-center text-[#2E7D32] mb-10">
          We Value Your Feedback
        </h2>
        <form
          action="<%=request.getContextPath()%>/FeedbackServlet"
          method="post"
          onsubmit="validateForm(event)"
          class="bg-white p-10 rounded-xl shadow-xl space-y-6">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input
              id="first-name"
              name="firstName"
              type="text"
              placeholder="First Name"
              class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#5D8A4D]" />
            <input
              id="last-name"
              name="lastName"
              type="text"
              placeholder="Last Name"
              class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#5D8A4D]" />
          </div>
          <input
            id="email"
            name="email"
            type="email"
            placeholder="Email Address"
            class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#5D8A4D]" />
          <div class="flex items-center gap-2">
            <label class="text-gray-700">Rate Us:</label>
            <div class="flex space-x-1">
              <span class="star text-gray-300 text-xl" onclick="rate(1)"
                >★</span
              >
              <span class="star text-gray-300 text-xl" onclick="rate(2)"
                >★</span
              >
              <span class="star text-gray-300 text-xl" onclick="rate(3)"
                >★</span
              >
              <span class="star text-gray-300 text-xl" onclick="rate(4)"
                >★</span
              >
              <span class="star text-gray-300 text-xl" onclick="rate(5)"
                >★</span
              >
            </div>
            <input type="hidden" id="rating-input" name="rating" value="" />
          </div>
          <textarea
            id="message"
            name="message"
            rows="5"
            placeholder="Share your thoughts with us..."
            class="w-full px-5 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#5D8A4D]"></textarea>
          <div class="text-center">
            <button
              type="submit"
              class="bg-[#5D8A4D] text-white px-8 py-3 rounded-lg font-medium hover:bg-[#4B6F3D] transition">
              Send Feedback
            </button>
          </div>
        </form>
      </div>
    </section>
    <!-- Testimonials Section -->
    <section class="bg-[#F1EDE4] py-16">
      <div class="container mx-auto px-6 text-center">
        <h2 class="text-3xl font-semibold text-[#2E7D32] mb-6">
          Why People Love PaperCycle
        </h2>
        <p class="text-gray-700 mb-12 max-w-xl mx-auto">
          From students to institutions, our users share how PaperCycle has
          helped them save costs while contributing to a greener planet.
        </p>
        <div class="grid md:grid-cols-2 gap-8">
          <div
            class="bg-white p-6 rounded-lg shadow-md flex flex-col items-center">
            <img
              src="<%=request.getContextPath()%>/images/sneha.jpg"
              alt="User 1"
              class="w-16 h-16 rounded-full mb-4" />
            <p class="text-gray-600 italic mb-4">
              "PaperCycle helped us find affordable event materials and reduce
              waste on campus. We love the mission!"
            </p>
            <h4 class="font-semibold text-[#2E7D32]">
              - Aayusha Shrestha, Student
            </h4>
          </div>
          <div
            class="bg-white p-6 rounded-lg shadow-md flex flex-col items-center">
            <img
              src="<%=request.getContextPath()%>/images/admin.jpg"
              alt="User 2"
              class="w-16 h-16 rounded-full mb-4" />
            <p class="text-gray-600 italic mb-4">
              "A smart way to declutter our office. Listing unused stationery
              was easy and rewarding."
            </p>
            <h4 class="font-semibold text-[#2E7D32]">
              - Bishal Gurung, Office Admin
            </h4>
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
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition">
                <i class="ri-facebook-fill"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition">
                <i class="ri-twitter-x-fill"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition">
                <i class="ri-instagram-line"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition">
                <i class="ri-linkedin-fill"></i
              ></a>
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
          class="pt-8 border-t border-gray-700 flex flex-col md:flex-row justify-between items-center">
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
            carousel.scrollBy({ left: -scrollAmount, behavior: "smooth" });
          });
          nextBtn.addEventListener("click", function () {
            carousel.scrollBy({ left: scrollAmount, behavior: "smooth" });
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
          const duration = 2000;
          const step = Math.ceil(target / (duration / 16));
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
