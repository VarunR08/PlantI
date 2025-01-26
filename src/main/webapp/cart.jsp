 <%@page import="java.awt.event.ItemEvent"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff4500;
            font-weight: bold;
        }

        .total-cost {
            font-size: 26px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
            border-top: 2px solid #ff4500;
            padding-top: 10px;
        }

        .checkout-button {
            margin-top: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<%@include file="Header.jsp" %>
    <div class="container">
        <%
            ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList");
            int tcost = 0;

            if (cartList != null && !cartList.isEmpty()) {
        %>
            <h2>Your Cart</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Cost (&#8377;)</th>
                        <th>Quantity</th>
                        <th>Total (&#8377;)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Cart item : cartList) {
                            int itemTotalCost = item.getC_cost() * item.getQuantity();
                            tcost += itemTotalCost;
                    %>
                    <tr>
                        <td>
                            <img src="<%= item.getC_img() %>" alt="<%= item.getC_name() %>" 
                                 style="height: 80px; width: auto; border-radius: 10px;">
                        </td>
                        <td><%= item.getC_name() %></td>
                        <td>&#8377;<%= item.getC_cost() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td>&#8377;<%= itemTotalCost %></td>
                        <td>
                            <form action="removefromcart" method="post" style="display:inline;">
                                <input type="hidden" name="cid" value="<%= item.getC_id() %>"/>
                                <button type="submit" name="delete" class="btn btn-danger">
                                    <i class="fas fa-trash"></i> Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                   <% } %>
                </tbody>
            </table> 
            <div class="total-cost">Total: &#8377;<%= tcost %></div>
            <div class="checkout-button">
                 
                 <a href="booking.jsp" class="btn btn-primary">Proceed to Checkout</a>
          
                  <!-- <form action="register" method="post">
                             
                    <input type="hidden" class="btn btn-primary" name="book" value="1" > 
                    <input type="submit" class="btn btn-primary" value="Buy Now"  > 
                   </form> --> 
                <a href="dashboard.jsp" class="btn btn-primary" style="margin-left: 40px">Back</a>
            </div>
            
        <%		
            } else {
        %>
            <h2>Your cart is empty.</h2>
        <%
            }
        %>
    </div>
</body>
</html> 





