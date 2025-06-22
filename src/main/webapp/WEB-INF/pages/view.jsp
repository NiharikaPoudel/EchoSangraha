<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PaperCycle - View Items</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      body {
        background-color: #d9d7b8;
        font-family: "Inter", sans-serif;
      }
    </style>
  </head>
  <body class="p-8">
    <div class="max-w-7xl mx-auto bg-[#F1EDE4] p-6 rounded-xl shadow-md">
      <h1 class="text-3xl font-semibold text-[#5D8A4D] mb-6">
        Available Recycled Items
      </h1>

      <div class="overflow-x-auto">
        <table class="w-full text-sm text-left text-gray-700">
          <thead class="bg-[#E8E4D8] text-[#5D8A4D] uppercase text-sm">
            <tr>
              <th class="px-4 py-3">#</th>
              <th class="px-4 py-3">Image</th>
              <th class="px-4 py-3">Item</th>
              <th class="px-4 py-3">Category</th>
              <th class="px-4 py-3">Details</th>
              <th class="px-4 py-3">Price</th>
              <th class="px-4 py-3">Status</th>
              <th class="px-4 py-3 text-center">Actions</th>
            </tr>
          </thead>
          <tbody class="bg-white">
            <tr class="border-b">
              <td class="px-4 py-3">1</td>
              <td class="px-4 py-3">
                <img
                  src="https://via.placeholder.com/80x60?text=Paper"
                  class="rounded-md border" />
              </td>
              <td class="px-4 py-3">A4 One-sided Paper</td>
              <td class="px-4 py-3">Paper</td>
              <td class="px-4 py-3">100 sheets</td>
              <td class="px-4 py-3">Rs. 20</td>
              <td class="px-4 py-3 text-green-600 font-semibold">Available</td>
              <td class="px-4 py-3 text-center">
                <button
                  class="bg-[#A8D8A0] hover:bg-[#5D8A4D] text-white px-3 py-1 rounded-md">
                  Edit
                </button>
                <button
                  class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md ml-2">
                  Delete
                </button>
              </td>
            </tr>
            <tr class="border-b">
              <td class="px-4 py-3">2</td>
              <td class="px-4 py-3">
                <img
                  src="https://via.placeholder.com/80x60?text=Pen"
                  class="rounded-md border" />
              </td>
              <td class="px-4 py-3">Used Pens (Refillable)</td>
              <td class="px-4 py-3">Stationery</td>
              <td class="px-4 py-3">Set of 10</td>
              <td class="px-4 py-3">Rs. 15</td>
              <td class="px-4 py-3 text-yellow-600 font-semibold">Booked</td>
              <td class="px-4 py-3 text-center">
                <a href="edit.html">
                  <button
                    class="bg-[#A8D8A0] hover:bg-[#5D8A4D] text-white px-3 py-1 rounded-md">
                    Edit
                  </button>
                </a>

                <button
                  class="bg-red-500 hover:bg-red-600 text-white px-3 py-1 rounded-md ml-2">
                  Delete
                </button>
              </td>
            </tr>
            <!-- Add more rows as needed -->
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>
