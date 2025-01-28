<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Plant Product</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #e9f5e9;
    }
    .form-container {
      max-width: 600px;
      margin: 50px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .btn-submit {
      background-color: #28a745;
      border: none;
    }
    .btn-submit:hover {
      background-color: #218838;
    }
    .header {
      color: #2d6a4f;
    }
  </style>
</head>
<body>
<header class="bg-dark py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1 class="text-white">PlantI</h1>
            <nav>
                <a href="#" class="text-white text-decoration-none mx-2">Dashboard</a>
                <a href="#" class="text-white text-decoration-none mx-2">Orders</a>
                <a href="Manage.jsp" class="text-white text-decoration-none mx-2">Manage Plants</a>
                <a href="#" class="text-white text-decoration-none mx-2">Customer Feedback</a>
                <a href="AddProduct.jsp" class="text-white text-decoration-none mx-2">Add Product</a>
                <a class="text-white text-decoration-none mx-2" href="register?logout=yes">Log Out</a>   
            </nav>
        </div>
    </header>
 <% if (request.getAttribute("status") != null) {%>
       <div id="msg">  <%= request.getAttribute("status")%></div>
       <%}%>
  <div class="container">
    <div class="form-container">
      <h2 class="text-center mb-4 header">Add New Plant</h2>
      <form action="register" method="post">
              <div class="mb-3">
          <label for="plantName" class="form-label">Plant Name</label>
          <input type="text" class="form-control" id="plantName" placeholder="Enter Plant Name" name="pname" required>
        </div>
        <div class="mb-3">
          <label for="plantUrl" class="form-label">Image URL</label>
          <input type="url" class="form-control" id="plantUrl" placeholder="Enter Image URL" name="url" required>
        </div>
        <div class="mb-3">
          <label for="plantCategory" class="form-label">Plant Category</label>
          <select class="form-select" id="plantCategory" name="plantCategory" required>
             <option value="" disabled selected>Select Category</option> 
            <option value="Fruits">Fruits</option>
            <option value="vegetables">vegetables</option>
            <option value="Others">Others</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="plantsubCategory" class="form-label">Plant sub Category</label>
          <select class="form-select" id="plantCategory" name="plantsubCategory" required>
            <option value="" disabled selected>Select sub Category</option> 
            <option value="plants">plants</option>
            <option value="seeds">seeds</option>
            <option value="Others">Others</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="plantDescription" class="form-label">Description</label>
          <textarea class="form-control" id="plantDescription" rows="3" placeholder="Enter Plant Description" name="desp"></textarea>
        </div>
        <div class="mb-3">
          <label for="plantPrice" class="form-label">Price</label>
          <input type="tel" class="form-control" id="plantPrice" placeholder="Enter the Price " name="price">
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-success btn-submit" name="addproduct">Add Product</button>
        </div>
      </form>
    </div>
  </div>
  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <%@include file="footer.jsp"%>
</body>
</html>
    