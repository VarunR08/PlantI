<%@page import="model.User"%>
<%@page import="model.Registration"%>
<%@page import="model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        .container-xl {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .cart-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fafafa;
            transition: background 0.3s;
        }

        .cart-item:hover {
            background-color: #f0f0f0;
        }

        .cart-image {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            margin-right: 20px;
        }

        .cart-details {
            flex-grow: 1;
        }

        .btn-custom {
            background-color: #f9e55e;
            color: #333;
            border: none;
            transition: background 0.3s;
        }

        .btn-custom:hover {
            background-color: #f9d04e;
        }

        .cost {
            font-size: 1.5em;
            font-weight: bold;
            margin: 20px 0;
        }
    </style>
</head>
<body >
<%@include file="Header.jsp"%>
<% Products p = (Products) session.getAttribute("Book"); %> 
 <% if (session.getAttribute("uname") != null) {
                Registration reg = new Registration(session);
                User u = reg.getInfo();%>
       
  
    <div class="header">
        <div class="container">
           
        </div>
    </div>

    <div class="container-xl mt-4">
        <h2 class="text-center">Booking Form</h2>
        <div class="mb-3" style="font-size: 20px;">Buyer Name: <%=u.getName() %></div>
        
        
        <%

                int tcost = 0;

                     if( p!=null){
                        tcost += p.getPrice();
                %>
 
            <div class="cart-item">
                <img src="<%=p.getP_img() %>" class="cart-image" alt="Product Image">
                <div class="cart-details">
                    <p class="cart-name mb-1"><strong>Product Name: </strong> <%=p.getP_name() %></p>
                    <p class="cart-quantity mb-1"><strong>Quantity: </strong> 1</p>
                    <p class="cart-cost"><strong>Product Cost: &#8377;</strong> <%=p.getPrice() %></p>
                </div>
            </div>
            <hr>
            <div class="cost mb-3">
                Total:&#8377;  <%= tcost %>
            </div><%
                     }
                 
                %>
            <div class="mb-3">
            <form action="order" method="POST">
                <label for="payment_method" class="form-label">Payment Method:</label>
                <select class="form-select" name="payment_method" id="payment_method" required>
                    <option value="cash">Cash on Delivery</option>
                </select>
            </div>
            <h2><u>Delivery Address:</u></h2>
            <div class="mb-3">
                <input type="text" id="adr" name="address" class="form-control" placeholder="Complete address" required>
            </div>
            <div class="mb-3">
                <input type="text" id="city" name="city" class="form-control" placeholder="Enter city" required>
            </div>
            <div class="mb-3">
                <input type="text" id="state" name="state" class="form-control" placeholder="Enter state" required>
            </div>
            <input type="hidden" name="tcost" value="<%= tcost %>">
            <input type="hidden" name="pid" value="<%= p.getPid() %>">
            <button type="submit" class="btn btn-custom w-100" style="background-color: lightgreen"><b>Confirm Order</b></button>
            
            <br><br><br>
         
        </form>
    </div>
         <%} %>

    <div class="footer mt-4">
        <div class="container">
            
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
     <%@include file="footer.jsp"%>
</body>
</html>
