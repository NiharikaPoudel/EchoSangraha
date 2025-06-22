<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PaperCycle Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              primary: "#2e7d32",
              beige: "#f5f5dc",
              soft: "#D9D7B8",
              light: "#EAE6D9",
              cream: "#F1EDE4",
              dusty: "#E8E4D8",
              greenish: "#A8D8A0",
              darkgreen: "#5D8A4D",
            },
          },
        },
      };
    </script>
    <!-- Chart.js for Line Graph -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Pikaday for Calendar -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css" />
    <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
      rel="stylesheet" />
    <style>
      body {
        font-family: "Inter", sans-serif;
      }
    </style>
  </head>
  <body class="bg-dusty min-h-screen">
    <div class="flex">
      <!-- Sidebar -->
      <aside class="w-64 bg-darkgreen text-white min-h-screen p-6 space-y-6">
        <h2 class="text-2xl font-bold">PaperCycle</h2>
        <nav class="space-y-4">
          <a
            href="<%=request.getContextPath()%>/AdminDashboard.jsp"
            class="block hover:text-greenish"
            >Dashboard</a
          >
          <a
            href="<%=request.getContextPath()%>/UserManagement.jsp"
            class="block hover:text-greenish"
            >User Management</a
          >
          <a
            href="<%=request.getContextPath()%>/Listings.jsp"
            class="block hover:text-greenish"
            >Listings</a
          >
          <a
            href="<%=request.getContextPath()%>/Payments.jsp"
            class="block hover:text-greenish"
            >Payments</a
          >
          <a
            href="<%=request.getContextPath()%>/Reports.jsp"
            class="block hover:text-greenish"
            >Reports</a
          >
          <c:if test="${not empty sessionScope.admin}">
            <a
              href="<%=request.getContextPath()%>/LogoutServlet"
              class="block hover:text-greenish"
              >Logout</a
            >
          </c:if>
        </nav>
      </aside>
      <!-- Main Dashboard -->
      <main class="flex-1 p-8">
        <!-- Header with Search and Profile -->
        <header
          class="flex flex-col md:flex-row justify-between items-center mb-6 gap-4">
          <!-- Title + Search -->
          <div
            class="flex flex-col md:flex-row items-start md:items-center gap-4 w-full md:w-2/3">
            <h1 class="text-3xl font-semibold text-primary">Admin Dashboard</h1>
            <form
              action="<%=request.getContextPath()%>/AdminSearchServlet"
              method="get"
              class="flex items-center w-full md:w-auto">
              <input
                type="text"
                name="query"
                placeholder="Search..."
                class="border border-gray-300 rounded-l px-4 py-2 w-full md:w-64 focus:outline-none" />
              <button
                type="submit"
                class="bg-primary text-white px-4 py-2 rounded-r hover:bg-darkgreen">
                Search
              </button>
            </form>
          </div>
          <!-- Profile Box -->
          <div
            class="bg-light px-4 py-2 rounded shadow flex items-center gap-3">
            <img
              src="<%=request.getContextPath()%>/images/${sessionScope.admin.profileImage != null ? sessionScope.admin.profileImage : 'admin.jpg'}"
              alt="Profile Image"
              class="w-10 h-10 rounded-full border-2 border-primary" />
            <div class="text-left">
              <p class="text-sm text-gray-600">Admin</p>
              <p class="font-bold text-darkgreen">
                ${sessionScope.admin.name != null ? sessionScope.admin.name :
                'Sneha Sapkota'}
              </p>
            </div>
          </div>
        </header>
        <!-- Stats Cards with Hover -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
          <div
            class="bg-light p-4 rounded shadow text-center hover:bg-greenish hover:text-white transition duration-200">
            <h3 class="text-sm text-gray-500 group-hover:text-white">
              Total Users
            </h3>
            <p class="text-xl font-semibold">
              ${requestScope.stats.totalUsers != null ?
              requestScope.stats.totalUsers : 120}
            </p>
          </div>
          <div
            class="bg-light p-4 rounded shadow text-center hover:bg-greenish hover:text-white transition duration-200">
            <h3 class="text-sm text-gray-500">New Listings</h3>
            <p class="text-xl font-semibold">
              ${requestScope.stats.newListings != null ?
              requestScope.stats.newListings : 45}
            </p>
          </div>
          <div
            class="bg-light p-4 rounded shadow text-center hover:bg-greenish hover:text-white transition duration-200">
            <h3 class="text-sm text-gray-500">Revenue This Month</h3>
            <p class="text-xl font-semibold">
              <fmt:formatNumber
                value="${requestScope.stats.revenue != null ? requestScope.stats.revenue : 75000}"
                type="currency"
                currencySymbol="Rs. " />
            </p>
          </div>
          <div
            class="bg-light p-4 rounded shadow text-center hover:bg-greenish hover:text-white transition duration-200">
            <h3 class="text-sm text-gray-500">Pending Approvals</h3>
            <p class="text-xl font-semibold">
              ${requestScope.stats.pendingApprovals != null ?
              requestScope.stats.pendingApprovals : 12}
            </p>
          </div>
        </div>
        <!-- Welcome Message -->
        <div class="bg-cream p-6 rounded shadow mb-6">
          <h2 class="text-xl font-bold text-primary">
            Welcome to Admin Panel!
          </h2>
          <p class="text-gray-700">
            Manage listings, users, and reports from one place.
          </p>
        </div>
        <!-- Line Graph and Calendar Side-by-Side -->
        <div class="flex flex-col lg:flex-row gap-6 mb-6">
          <!-- Line Graph -->
          <div class="bg-white p-6 rounded shadow w-full lg:w-2/3">
            <h3 class="text-lg font-semibold mb-4">Monthly Revenue Trend</h3>
            chartjs { "type": "line", "data": { "labels": ["Jan", "Feb",
            "Mar", "Apr", "May", "Jun"], "datasets": [ { "label": "Revenue
            (Rs.)", "data": ${requestScope.revenueData != null ?
            requestScope.revenueData : '[15000, 20000, 25000, 22000, 30000,
            35000]'}, "borderColor": "#2e7d32", "backgroundColor": "rgba(46,
            125, 50, 0.1)", "fill": true, "tension": 0.4 } ] }, "options": {
            "responsive": true, "scales": { "y": { "beginAtZero": true } } } }
            
          </div>
          <!-- Calendar -->
          <div class="bg-white p-6 rounded shadow w-full lg:w-1/3">
            <h3 class="text-lg font-semibold mb-4">Calendar</h3>
            <input
              type="text"
              id="datepicker"
              name="date"
              class="border border-gray-300 rounded px-3 py-2 w-full"
              placeholder="Select a date" />
          </div>
        </div>
        <!-- Table -->
        <div class="bg-white p-6 rounded shadow mb-6">
          <h3 class="text-lg font-semibold mb-4">Recent Users</h3>
          <table class="w-full text-left text-sm">
            <thead>
              <tr class="bg-dusty">
                <th class="p-2">User ID</th>
                <th class="p-2">Username</th>
                <th class="p-2">Email</th>
                <th class="p-2">Phone</th>
                <th class="p-2">Actions</th>
              </tr>
            </thead>
            <tbody>
              <c:choose>
                <c:when test="${empty requestScope.recentUsers}">
                  <tr>
                    <td colspan="5" class="p-2 text-center text-gray-600">
                      No recent users found.
                    </td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <c:forEach var="user" items="${requestScope.recentUsers}">
                    <tr>
                      <td class="p-2">${user.id}</td>
                      <td class="p-2">${user.username}</td>
                      <td class="p-2">${user.email}</td>
                      <td class="p-2">${user.phone}</td>
                      <td class="p-2">
                        <a
                          href="<%=request.getContextPath()%>/UserDetailsServlet?id=${user.id}"
                          class="text-primary"
                          >View</a
                        >
                      </td>
                    </tr>
                  </c:forEach>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
      </main>
    </div>
    <!-- Calendar Script -->
    <script>
      new Pikaday({
        field: document.getElementById("datepicker"),
        format: "YYYY-MM-DD",
      });
    </script>
  </body>
</html>
