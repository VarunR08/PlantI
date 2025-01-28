<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Products"%>
<%@page import="model.Registration"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            transition: 0.3s ease-in-out;
        }
        .product-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }
        .product-image img {
            width: 100%;
            height: 150px;
        }
        .product-title {
            font-size: 1.25rem;
            font-weight: bold;
            margin: 8px 0;
        }
        .product-price {
            font-size: 1.2rem;
            color: #28a745;
            font-weight: 600;
        }
        .btn-buy {
            background: #007bff;
            color: #fff;
            transition: 0.2s ease-in-out;
        }
        .btn-buy:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

   <%@include file="Dhead.jsp"%>

<div class="container py-5">
    
    
<%
            Registration reg = new Registration(session);
            List<Products> al = reg.get_all_productinfo();
            Iterator<Products> itr=al.iterator();
            %>
            <div class="row">
          <%  while(itr.hasNext()){
            	Products p=itr.next();
            
        %>
             


        <!-- Products -->
       
                <div class="col-md-3 mb-3">
            <div class="product-card">
                <div class="product-image">
                    <img src="<%=p.getP_img() %>" alt="Product Image">
                </div>
                <div class="p-3">
                    <h2 class="product-title"> Product Name : <%=p.getP_name() %></h2>
                    <p class="text-muted"> Product Id : <%=p.getPid() %></p>
                    <p class="product-price">Product Price : &#8377;<%=p.getPrice() %></p>
               
                    <form action="updateProduct" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%= p.getPid() %>" />
                            <input type="tel" name="p_cost" value="<%= p.getPrice() %>" required />
                            <button type="submit" class="btn" style="background: green;color: #fff; margin-top: 10%">Update</button>
                        </form>
                     <form action="deleteProduct" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%=p.getPid() %>" />
                            <button type="submit" class="btn" style="background: green;color: #fff; margin-top: 10%">Delete</button>
                        </form> 
                        
                </div>
            </div>   
        </div>
        <%
                }
           
        %>   
      
       
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="footer.jsp"%>
</body>
</html>
    


