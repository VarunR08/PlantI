<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> DSign Up</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"></script>
    <style>
        .one {
            width: 500px;
            box-shadow: 5px solid black;
            border: 3px solid black;
            border-radius: 100px;
            text-align: center;
            position: relative;
            left: 450px;
            padding: 20px;
            background-image: url();
        }

        /* .two {
            position: relative;
        } */

        input {
            height: 40px;
            width: 300px;
            margin-bottom: 15px;
            text-align: center;
            border: none;
            border-radius: 50px;
            outline: none;
        }
        select{
            height: 40px;
            width: 300px;
            margin-bottom: 15px;
            text-align: center;
            border: none;
            border-radius: 50px;
            outline: none;

        }

        .three {
            width: 350px;
            margin: 0 auto;
        }

        body {
            background-image: url("https://static.vecteezy.com/system/resources/thumbnails/007/950/588/small_2x/hands-protecting-trees-world-environment-day-concept-photo.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        /* input {
            border: none;
            border-radius: 50px;
            outline: none;
        } */

        .submit {
            height: 30px;
            width: 150px;
            border: none;
            border-radius: 50px;
            outline: none;
            background-color: rgb(145, 217, 182);
        }
    </style>
</head>
<body>
    <div class="one">
        <form id="signup" method="post" action="register">
            <div class="two">
                <h1>Sign Up</h1>
                
                <% if(request.getAttribute("status") != null) { %>
        <div id="msg"><%= request.getAttribute("status") %></div>
    <% } %>
                
                <div class="three">
                    <h2>Name</h2>
                    <input type="text" name="name" placeholder="Enter your name">
                    <h2>Phone</h2>
                    <input type="text" name="phone" placeholder="Enter your phone">
                    <h2>Email</h2>
                    <input type="text" name="email" placeholder="Enter your Email or Phone">
                    <h2>Address</h2>
                    <input type="text" name="address" placeholder="Enter your Address">
                    <h2>PanCard Details</h2>
                    <input type="text" name="pan" placeholder="Enter your pan Details">
                    <h2>Set Name For Your 'PlanetGreen Store'</h2>
                    <input type="text" name="store" placeholder="Store name">
                   <h2>Categories</h2>
                    <select   name="plantCategory" required>
                      <option value="" disabled selected>Select sub Category</option> 
                      <option value="plants">plants</option>
                      <option value="seeds">seeds</option>
                      <option value="Others">Others</option>
                    </select><br>
                    <h2>Sub-Categories</h2>
                    <select  name="plantsubCategory" required>
                      <option value="" disabled selected>Select sub Category</option> 
                      <option value="plants">plants</option>
                      <option value="seeds">seeds</option>
                      <option value="Others">Others</option>
                    </select>
                    <h2>Enter Your Gst Number</h2>
                    <input type="text" name="gst" placeholder="Enter your Address">
                    <h2>Password</h2>
                    <input type="password" name="password" placeholder="Enter your password">
                    <h2>Confirm Password</h2>
                    <input type="password" name="confirm" placeholder="Confirm password">
                    <br>
                    <button type="submit" class="submit" name="dsubmit">Submit</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        
       
</body>
</html>