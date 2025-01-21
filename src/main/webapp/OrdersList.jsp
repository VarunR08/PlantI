<%@page import="java.util.Iterator"%>
<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@page import="model.Registration"%>
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

   <%@include file="Header.jsp"%>

<div class="container py-5">
    <h1 class="text-center mb-4">Order Now</h1>
    
     <%   Registration r=new Registration(session);
            List<Products> product=r.getProducts();
            Products p=null;
            Iterator<Products> it=product.listIterator();
            %>
             <div class="row">
            <%while(it.hasNext()){
            	p=it.next();
            	%>
    
    
    

        <!-- Product 3 -->
        <div class="col-md-3 mb-3">
            <div class="product-card">
                <div class="product-image">
                    <img src="<%=p.getP_img() %>" alt="Product Image">
                </div>
                <div class="p-3">
                    <h2 class="product-title"><%=p.getP_name() %></h2>
                    <p class="text-muted"><%=p.getPid() %></p>
                    <p class="product-price"><%=p.getPrice() %></p>
                    <form action="register" method="post">
                   
            <a href="ViewDetails.jsp"> <input type="button" class="btn btn-buy btn-block w-100" style="background: #007bff;color: #fff;" name="pid" value="Buy Now"></a>
                     </form>
                </div>
            </div>   
        </div>
       <%} %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="footer.jsp"%>
</body>
</html>
    