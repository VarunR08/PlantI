<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login </title>
    <style>
        .one {
        
            width: 500px;
            box-shadow: 5px solid black;
            border: 3px solid black;
            border-radius: 50px;
            text-align: center;
            position: relative;
            top: 100px;
            left: 450px;
            padding: 20px; /* Add padding to creatse space within the box */
            background-image: url();
        }

        .two {
            position: relative;
        }

        input {
            height: 40px; /* Reduce input height */
            width: 300px;
            margin-bottom: 15px;
            text-align: center;
        }

        .three {
            width: 350px;
            margin: 0 auto;
        }
         body{
         background-image: url("https://static.vecteezy.com/system/resources/thumbnails/007/950/588/small_2x/hands-protecting-trees-world-environment-day-concept-photo.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        } 
        input{
             border: none; 
             border-radius: 50px;
             outline: none;
        }
        .submit{
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
        <form>
            <div class="two">
                <h1>Login </h1>
                <% if (request.getAttribute("status") != null) {%>
       <div id="msg">  <%= request.getAttribute("status")%></div>
       <%}%>
                <div class="three">
                    
                    
                    <h2>Email</h2>
                    <input type="email" name="email" placeholder="Enter your Email">
                    <h2>Password</h2>
                    <input type="password" name="password" placeholder="Enter your password">
                    
                    <button class="submit" name="dlsubmit">Submit</button>
                </div>
            </div>
        </form>
        
    </div>
    <div class="img">
        
    </div>

</body>
</html>