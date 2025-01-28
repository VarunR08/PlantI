<%@page import="java.util.Iterator"%>
<%@page import="model.Contact"%>
<%@page import="java.util.List"%>
<%@page import="model.Registration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Reviews</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background: #f8f9fa;
        }
        .review-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }
        .profile-img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            border: 3px solid #007bff;
            object-fit: cover;
        }
        .stars {
            color: gold;
            font-size: 18px;
        }
        .name {
            background: #e9ecef;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            font-weight: bold;
        }
        .vertical-text {
            writing-mode: vertical-rl;
            text-orientation: mixed;
            font-weight: bold;
            color: #555;
            font-size: 14px;
        }
        .highlights {
            background: #dee2e6;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%@include file="Dhead.jsp"%>
<div class="container mt-4">
    <h2 class="text-center"><strong>CUSTOMER</strong> <span style="color: green">FEEDBACK</span></h2>
    <hr>
    
    <%Registration reg=new Registration(session);
           List<Contact> cl=reg.feedback();   
           Iterator<Contact> itr=cl.iterator(); %>
           <div class="row">
        <%  while(itr.hasNext()){
        	   Contact c=itr.next();
          
    %>
    
    
    
        <!-- Review Cards -->
        <div class="col-md-6">
            <div class="review-card">
                
                <img src="https://th.bing.com/th/id/OIP._WHx86w5kRhUDHj3xeohkgHaHa?pid=ImgDet&w=184&h=184&c=7&dpr=1.3" class="profile-img" alt="User" style="height: 150px; width: 150px" >
                <div>
                <h6>Feedback - <%=c.getId() %></h6>
                    <p> <%=c.getMessage() %></p>
                    <div class="name"><%=c.getName() %> : [<%=c.getEmail() %>]</div>
                </div>
            </div>
           
        </div>

          <%} %>

        
    </div>

   

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
