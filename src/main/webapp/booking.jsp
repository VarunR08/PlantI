
<%@page import="java.util.Iterator"%>
<%@page import="model.Cart"%>
<%@page import="model.Registration"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
    <link rel="stylesheet" href="path/to/your/styles.css">
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

        h2 {
            color: #444;
            font-size: 1.8em;
            margin-bottom: 10px;
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
            height: auto;
            border-radius: 8px;
            margin-right: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .cart-details {
            flex-grow: 1;
        }

        .cart-name {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 5px;
        }

        .cart-cost {
            font-size: 1em;
            color: #f9d04e;
        }

        .cost {
            font-size: 1.5em;
            font-weight: bold;
            margin: 20px 0;
        }

        .btn {
            background-color: #f9e55e;
            color: #333;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #f9d04e;
        }

        select.selectpicker {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #f9d04e;
            border-radius: 5px;
            background-color: #fff;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        select.selectpicker:focus {
            border-color: #f9e55e;
            outline: none;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 2px solid #f9d04e;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="text"]:focus {
            border-color: #f9e55e;
            outline: none;
        }
        .cart-details {
    display: flex;
    flex-direction: column;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fafafa;
    transition: background 0.3s;
}

.cart-details:hover {
    background-color: #f0f0f0;
}

.cart-name {
    font-size: 1.4em;
    color: #333;
    margin-bottom: 5px;
}

.cart-quantity {
    font-size: 1.2em;
    color: #555;
    margin-bottom: 5px;
}

.cart-cost {
    font-size: 1.2em;
    color: #f9d04e;
    font-weight: bold;
}
        
    </style>
</head>
<body>
    <div class="header">
        <div class="container">
            <%@include file="Header.jsp"%>
        </div>
    </div>

    <% if (session.getAttribute("uname") != null) { %>
        <div class="container-xl">
            <h2>Booking Form</h2>
            <div style="font-size:20px">Buyer Name: <%= session.getAttribute("uname") %></div>
            <br>
            <form action="order" method="POST">
            
                <%
                String productId = request.getParameter("p_id");
                Registration s1 = new Registration(session);
                int tcost = 0;
                List<Cart> cartItems = s1.getcartinfo();

                if (!cartItems.isEmpty()) {
                	
                	/*   for (Cart item : cartItems) {
                        tcost += item.getC_cost(); */
                        
                        Iterator<Cart> itr=cartItems.iterator();
                        
                        while(itr.hasNext()){
                        	
                        Cart item=itr.next();
                        tcost+=item.getC_cost()*item.getQuantity();
                %>
                        <div class="cart-item">
                            <img src="<%=item.getC_img() %>" class="cart-image" alt="<%=item.getC_name() %>">
                            <div class="cart-details">
                                <label class="cart-name">Product Name: <%=item.getC_name() %></label>
                                <label class="cart-quantity">Quantity : <%=item.getQuantity() %></label>
                                <label class="cart-cost">Product Cost: &#8377; <%=item.getC_cost() %></label>
                            </div>
                        </div>
                        <hr>
                <%
                    }
                } else {
                %>
                    <p>No items in cart or selected for purchase.</p>
                <%
                }
                %>

                <div class="cost">
                    Total: &#8377; <%= tcost %>
                </div>
                <br>
                <label for="payment_method">Payment Method:</label>
                <select class="selectpicker" name="payment_method" id="payment_method">
                    <option value="cash">Cash on delivery</option>
                    
                </select>
                <br>
                <h2><u>Delivery Address:</u></h2>
                <input type="text" id="adr" name="address" placeholder="Complete address" required><br>
                <input type="text" id="city" name="city" placeholder="Enter city" required><br>
                <input type="text" id="state" name="state" placeholder="Enter state" required><br><br>
                <input type="submit" name="submit" value="Confirm Order" class="btn" style="background-color: lightgreen"><br>
                <input type="hidden" name="tcost" value="<%= tcost %>">
            </form>
        </div>
        <br><br><br>	
    <% } else { %>
        <p>Please log in to view the booking form.</p>
    <% } %>

    <%@include file="footer.jsp"%>
</body>
</html>
