<%@page import="model.Cart"%>
<%@page import="model.Products"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PlantI</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
      background-color: #e9f5e9;
      background-image: url("https://images.unsplash.com/photo-1616088410192-d1b123712994?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
    }
button a {
  text-decoration: none;
  color: black;
  
}
button {
	background-color: #58eabc;
	border: none;
	border-radius: 5px;
}

</style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- header -->
<%@include file="Dhead.jsp"%>
      <!-- Main Content -->
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          
        </div>

        <!-- Stats Cards -->
        
        
         <%
                            Registration reg = new Registration(session);
                            int totalorders=0;
                            double totalcost=0;
                            List<Order> ar = reg.totalorders();
                            Iterator<Order> itr = ar.iterator();
                            while (itr.hasNext()) {
                            	Order o= itr.next();
                            	totalorders++;
                            	totalcost+=o.getc_cost();
                            }%>
                            <% 
                            int totalproducts=0;
                            List<Products> pr=reg.get_all_productinfo();
                            Iterator<Products> itr1 = pr.iterator();
                            while(itr1.hasNext()){
                            	Products p=itr1.next();
                            	totalproducts++;
                            }
                            %>
                           
        
        
        
        
        <div class="row mb-4">
        <div class="col-md-3">
            <div class="card mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Plants</h5>
                <p class="card-text"><%=totalproducts %></p>
                <button ><a href="Manage.jsp" style="">View Plants</a></button>
              </div>
            </div>
          </div> 
 
          <div class="col-md-3">
            <div class="card  mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Orders</h5>
                <p class="card-text"><%=totalorders %></p>
                <button ><a href="TotalOrders.jsp" style="">View Orders</a></button>
              </div>
            </div>
          </div>
          
          <div class="col-md-3">
            <div class="card  mb-3">
              <div class="card-body">
                <h5 class="card-title">Total Revenue</h5>
                <p class="card-text">&#8377; <%=totalcost %> </p>
                <button ><a href="Feedback.jsp" style="">Check Feedbacks</a></button>
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
               <th>Customer Id</th>
                 <th>Customer Name</th>
                 <th>Product Name</th>
                  <th>Product Cost</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
            
         <% List <Order> ol=reg.getToporders(); 
                            Iterator<Order> itr2 = ar.iterator();
                            while (itr.hasNext()) {
                                Order o= itr2.next();
                                int c_id=Integer.parseInt(o.getc_id());
                                List<Cart> cr=reg.getcartToporders(c_id);
                                Iterator<Cart> itr3 = cr.iterator();
                                while (itr1.hasNext()){
                                	Cart c=itr3.next();
                            %>
              <tr>
              <td><%=o.getc_id() %></td>
                <td><%=o.getUname() %></td>
                <td><%=c.getC_name() %></td>
                <td><%=o.getc_cost() %></td>
                <td><%=o.getDate() %></td>
              </tr>
             
<%}} %>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>