<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Products"%>
<%@page import="model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plant Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .filter-section {
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .product-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .product-card img {
            border-bottom: 1px solid #eee;
            height: 200px;
            width: 100%;  
        }

        .price {
            font-weight: bold;
            color: #28a745;
        }

        .details-section {
            padding: 15px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .discount-banner {
            background-color: #28a745;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }

        .discount-banner button {
            background-color: white;
            color: #28a745;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
        }
        .cart{
        display: flex;
        }
        
    </style>
</head>
<body>
<%@include file="Header.jsp"%>
    <div class="container my-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <div class="filter-section">
                <form method="post" action="register" >
                    <h5>Filter</h5>
                    <hr>
                    <h6>Categories</h6>
                    <div>
                        <input type="checkbox" id="Fruits" checked> Fruits<br>
                        <input type="checkbox" id="Vegetables"> Vegetables<br>
                        <input type="checkbox" id="others"> Others<br>
                    </div><br>
                    <h6> Sub-Categories</h6> <div>
                    <input type="checkbox" id="plants" checked> plants<br>
                        <input type="checkbox" id="seeds"> Seeds<br>
                        <input type="checkbox" id="others"> Others<br>
                    </div>
                    

                    <h6 class="mt-3">Price range</h6>
                    <div>
                        <input type="tel" class="form-control mb-2" placeholder="Min" min="0">
                        <input type="tel" class="form-control" placeholder="Max" min="0">
                    </div>
                    <button class="btn btn-success btn-sm mt-2">Set Filter</button>

</form>
                </div>

            </div>

            <!-- Main Content --> 
            <div class="col-md-9">
                <div class="row mb-3">
                    <div class="col">
                        <h5>Shop now</h5> 
                    </div>
                    <div class="col text-end">
                         <form action="register" method="POST">
                      <div class="form-group">
            <input type="text" name="productname" class="form-control" placeholder="search for products" required>
        </div>
        <br>
        <button type="submit" class="btn" name="submit1" style="border:1px solid green; background-color: lightgreen">Search</button>
    </form>
                    </div>
                </div>


<% 
    List<Products> products = (List<Products>) session.getAttribute("products");
%>

<div class="row">
    <% 
        if (products != null && !products.isEmpty()) {
            for (Products p : products) {
    %>
<div class="col-md-4">
        <div class="card product-card">
            <img src="<%= p.getP_img() %>" class="card-img-top" alt="<%= p.getP_name() %>">
            <div class="card-body">
                <h6 class="card-title"><%= p.getP_name() %></h6>
                <p class="price">RS : <%= p.getPrice() %></p>
                 <div class="cart">
                               <form action="register" method="post">
                                <button class="btn btn-primary btn-sm" style="margin-right: 20px">Add to cart</button>
                               </form>
                              <form action="register" method="post">
                             
                    <input type="hidden" class="btn btn-primary btn-sm" name="pid" value="<%=p.getPid() %>" > 
                    <input type="submit" class="btn btn-primary btn-sm" value="view Details" > 
                   
                   <%-- <input type="hidden"  name="userid" value="<%=p.getPid()%>"/>
                                   <input type="submit" class="btn btn-primary btn-sm" value="View Details" /> --%>
                            </form></div>
            </div>
        </div>
    </div>
    <% 
            }
        } else { 
    %>
    <div class="col-12">
        <p>No products found for your search.</p>
    </div>
    <% 
        }
    %>
</div>



  <%   Registration r=new Registration(session);
            List<Products> product=r.getProducts();
            Products p=null;
            Iterator<Products> it=product.listIterator();
            %>
             <div class="row">
            <%while(it.hasNext()){
            	p=it.next();
            	%>
               
                    <!-- Product Card 1 -->
                    <div class="col-md-4">
                        <div class="card product-card">
                            <img src="  <%=p.getP_img() %>" class="card-img-top" alt="Monstera">
                            <div class="card-body">
                                <h6 class="card-title"><%=p.getP_name() %></h6>
                               
                                <p class="price">RS : <%=p.getPrice() %></p>
                                
                                <div class="cart">
                               <form action="register" method="post">
                                <button class="btn btn-primary btn-sm" style="margin-right: 20px">Add to cart</button>
                               </form>
                              <form action="register" method="post">
                             
                    <input type="hidden" class="btn btn-primary btn-sm" name="pid" value="<%=p.getPid() %>" > 
                    <input type="submit" class="btn btn-primary btn-sm" value="view Details" > 
                   
                   <%-- <input type="hidden"  name="userid" value="<%=p.getPid()%>"/>
                                   <input type="submit" class="btn btn-primary btn-sm" value="View Details" /> --%>
                            </form></div>
                            </div>
                        </div>
                    </div>
                    
                <%} %> 

                   

                    
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <%@include file="footer.jsp"%>
</body>
</html>