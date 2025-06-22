<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PaperCycle - Sustainable Supplies, Smarter Savings</title>
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
  <body class="bg-[#D9D7B8] min-h-screen">
    <!-- Header -->
    <header class="sticky top-0 z-50 bg-[#EAE6D9] shadow-sm">
      <div
        class="container mx-auto px-4 py-3 flex items-center justify-between">
        <div class="flex items-center">
          <a
            href="<%=request.getContextPath()%>/Home.jsp"
            class="text-3xl font-['Pacifico'] text-primary"
            >PaperCycle</a
          >
        </div>
        <nav class="hidden md:flex items-center space-x-6">
          <a
            href="<%=request.getContextPath()%>/Home.jsp"
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
                href="<%=request.getContextPath()%>/product.jsp"
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
            <form
              action="<%=request.getContextPath()%>/SearchServlet"
              method="get">
              <input
                type="text"
                name="query"
                placeholder="Search items..."
                class="search-input w-40 py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20" />
              <div
                class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400">
                <i class="ri-search-line"></i>
              </div>
            </form>
          </div>
          <!-- Login and Signup buttons -->
          <div class="flex gap-4">
            <c:choose>
              <c:when test="${not empty sessionScope.user}">
                <button
                  class="bg-primary text-white px-6 py-2 rounded font-medium hover:bg-primary/90 transition"
                  onclick="window.location.href='<%=request.getContextPath()%>/LogoutServlet'">
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
                  <form
                    action="<%=request.getContextPath()%>/SearchServlet"
                    method="get">
                    <input
                      type="text"
                      name="query"
                      placeholder="Search items..."
                      class="w-full py-2 pl-9 pr-3 rounded-full text-sm border-none bg-gray-100 focus:outline-none focus:ring-2 focus:ring-primary/20" />
                    <div
                      class="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 flex items-center justify-center text-gray-400">
                      <i class="ri-search-line"></i>
                    </div>
                  </form>
                </div>
              </div>
              <nav class="space-y-4">
                <a
                  href="<%=request.getContextPath()%>/Home.jsp"
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
    <!-- Landing Page Hero Section -->
    <section class="relative text-white py-28 overflow-hidden">
      <!-- Background Image -->
      <img
        src="<%=request.getContextPath()%>/images/rrr.jpg"
        alt="Hero Background"
        class="absolute inset-0 w-full h-full object-cover z-0" />
      <!-- Overlay -->
      <div class="absolute inset-0 bg-black opacity-30 z-0"></div>
      <!-- Content -->
      <div class="container mx-auto px-4 relative z-10">
        <div class="max-w-2xl">
          <h1 class="text-4xl md:text-5xl font-bold leading-tight mb-6">
            Give Paper a Second Life 🌿
          </h1>
          <p class="text-lg mb-8">
            Join PaperCycle and be part of a community that reduces waste,
            shares resources, and builds a greener future.
          </p>
          <a
            href="#blog"
            class="inline-block bg-[#F5F5DC] text-primary font-semibold px-6 py-3 rounded-button hover:bg-white transition cursor-pointer"
            >Explore Now</a
          >
        </div>
      </div>
    </section>
    <!-- Blog Section -->
    <section id="blog" class="py-16 bg-[#F1EDE4]">
      <div class="container mx-auto px-4">
        <h2 class="text-3xl font-bold text-center text-primary mb-10">
          Our Blog
        </h2>
        <c:choose>
          <c:when test="${empty requestScope.blogs}">
            <p class="text-center text-gray-600">No blog posts available.</p>
          </c:when>
          <c:otherwise>
            <div class="grid md:grid-cols-3 gap-8">
              <c:forEach var="blog" items="${requestScope.blogs}">
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                  <img
                    src="<%=request.getContextPath()%>/images/${blog.image}"
                    alt="${blog.title}"
                    class="w-full h-48 object-cover" />
                  <div class="p-6">
                    <h3 class="text-xl font-semibold text-[#2e7d32] mb-2">
                      ${blog.title}
                    </h3>
                    <p class="text-gray-700 mb-4">${blog.summary}</p>
                    <a
                      href="<%=request.getContextPath()%>/BlogServlet?id=${blog.id}"
                      class="text-primary hover:underline font-medium"
                      >Read More →</a
                    >
                  </div>
                </div>
              </c:forEach>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </section>
    <!-- Process Section -->
    <section class="py-16 bg-[#E8E4D8]">
      <div class="container mx-auto px-4 text-center">
        <p class="uppercase text-sm text-secondary tracking-widest mb-2">
          How We Work
        </p>
        <h2 class="text-3xl md:text-4xl font-bold text-primary mb-12">
          Process Validated by Experience
        </h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
          <div class="flex flex-col items-center">
            <div
              class="w-14 h-14 rounded-full border-2 border-primary flex items-center justify-center mb-4">
              <i class="ri-arrow-down-line text-2xl text-primary"></i>
            </div>
            <h3 class="text-xl font-semibold text-primary mb-2">Reduce</h3>
            <p class="text-gray-600 text-sm">
              Minimize the amount of paper waste by choosing only what you need
              and printing smarter.
            </p>
          </div>
          <div class="flex flex-col items-center">
            <div
              class="w-14 h-14 rounded-full border-2 border-primary flex items-center justify-center mb-4">
              <i class="ri-loop-left-line text-2xl text-primary"></i>
            </div>
            <h3 class="text-xl font-semibold text-primary mb-2">Reused</h3>
            <p class="text-gray-600 text-sm">
              Share or repurpose used papers and supplies to extend their life
              before disposal.
            </p>
          </div>
          <div class="flex flex-col items-center">
            <div
              class="w-14 h-14 rounded-full border-2 border-primary flex items-center justify-center mb-4">
              <i class="ri-recycle-line text-2xl text-primary"></i>
            </div>
            <h3 class="text-xl font-semibold text-primary mb-2">Recycle</h3>
            <p class="text-gray-600 text-sm">
              Send your paper waste to certified recyclers and reduce landfill
              burden.
            </p>
          </div>
          <div class="flex flex-col items-center">
            <div
              class="w-14 h-14 rounded-full border-2 border-primary flex items-center justify-center mb-4">
              <i class="ri-restart-line text-2xl text-primary"></i>
            </div>
            <h3 class="text-xl font-semibold text-primary mb-2">Recover</h3>
            <p class="text-gray-600 text-sm">
              Reclaim energy and resources from paper waste through recovery
              processes.
            </p>
          </div>
        </div>
      </div>
    </section>
    <!-- Call-to-Action Banner -->
    <section class="py-12 bg-gradient-to-r from-[#E8E4D8]">
      <div
        class="container mx-auto px-4 flex flex-col lg:flex-row items-center justify-between gap-8">
        <div class="w-full lg:w-1/2">
          <img
            src="<%=request.getContextPath()%>/images/reduce.jpg"
            alt="Waste Collection"
            class="rounded-xl shadow-lg" />
        </div>
        <div class="w-full lg:w-1/2 text-white">
          <h3 class="text-2xl font-semibold mb-4">Do you have a question?</h3>
          <p class="mb-6">
            Reach out to us for any queries, partnership opportunities, or
            recycling advice. Let’s create a greener tomorrow!
          </p>
          <a
            href="<%=request.getContextPath()%>/contact.jsp"
            class="inline-block bg-[#F5F5DC] text-primary font-semibold px-6 py-3 rounded-button hover:bg-white transition"
            >Let's Talk</a
          >
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
                ><i class="ri-facebook-fill"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
                ><i class="ri-twitter-x-fill"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-700 rounded-full flex items-center justify-center hover:bg-primary transition"
                ><i class="ri-instagram-line"></i
              ></a>
              <a
                href="#"
                class="w-10 h-10 bg-gray-7 00 rounded-full flex items-center justify-center hover:bg-primary transition"
                ><i class="ri-linkedin-fill"></i
              ></a>
            </div>
          </div>
          <div>
            <h4 class="text-lg font-semibold mb-4">Quick Links</h4>
            <ul class="space-y-2">
              <li>
                <a
                  href="<%=request.getContextPath()%>/product.jsp"
                  class="text-black hover:text-white transition"
                  >Browse Items</a
                >
              </li>
              <li>
                <a
                  href="<%=request.getContextPath()%>/ListItem.jsp"
                  class="text-black hover:text-white transition"
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
                <a
                  href="<%=request.getContextPath()%>/faq.jsp"
                  class="text-black hover:text-white transition"
                  >FAQ</a
                >
              </li>
              <li>
                <a
                  href="<%=request.getContextPath()%>/contact.jsp"
                  class="text-black hover:text-white transition"
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
