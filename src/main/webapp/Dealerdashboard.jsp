<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PlantI</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- header -->
    
<header class="bg-dark py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1 class="text-white">PlantI</h1>
            <nav>
                <a href="#" class="text-white text-decoration-none mx-2">Orders</a>
                <a href="Manage.jsp" class="text-white text-decoration-none mx-2">Manage Plants</a>
                <a href="#" class="text-white text-decoration-none mx-2">Customer Feedback</a>
                <a href="AddProduct.jsp" class="text-white text-decoration-none mx-2">Add Product</a>
                <a class="text-white text-decoration-none mx-2" href="register?logout=yes">Log Out</a>
              
            </nav>
        </div>
    </header>
      <!-- Main Content -->
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          
        </div>

        <!-- Stats Cards -->
        <div class="row mb-4">
          <div class="col-md-3">
            <div class="card mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Plants</h5>
                <p class="card-text">150</p>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card  mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Orders</h5>
                <p class="card-text">320</p>
              </div>
            </div>
          </div>
          
          <div class="col-md-3">
            <div class="card  mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Revenue</h5>
                <p class="card-text">&#8377 12,450</p>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Orders Table -->
        <h2>Recent Orders</h2>
        <div class="table-responsive">
          <table class="table table-striped table-sm">
            <thead>
              <tr>
               <th>Customer Name</th>
                 <th>Product Name</th>
                 <th> Product Image</th>
                  <th>Product Cost</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Apple</td>
                <td>no image</td>
                <td>900</td>
                <td>2025-01-27</td>
              </tr>

            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>