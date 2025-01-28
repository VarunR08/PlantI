<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <head>
       <title>TODO supply a title</title>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width">
       <script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <style>
           .error{
               color:red;
           }

.main{
 background: url('https://i.pinimg.com/736x/bf/c6/ba/bfc6ba9f683ff1628dc87f0d05d21faa.jpg') no-repeat center center/cover;
            color: white;
            padding: 150px 0;
            text-align: center;
}

           #msg
           {
               background: green;
               color:black;
               border: 1px solid green;
               width:24%;
               font-weight: bold;
               font-size: 25px;
               padding: 5px;
           }

.form{
 width: 600px;
    height: 700px;
    background: linear-gradient(to top,rgba(0,0,0,0.8)50%,rgba(0,0,0,0.8)50%);
       border-radius: 10px;
   
}
.form h1{

  
}

.form input{
    width:280px;
    height: 35px;
    background:transparent;
    position:relative;
    right:80px;

    color: white;
  
    
    font-family: sans-serif;
}

.form input:focus{
    outline: none;
}
::placeholder{
    color: white;
    font-family: Arial;
}



       </style>
   </head>
   <body >
           <header class="bg-dark py-3">
        <div class="container d-flex justify-content-between align-items-center">
            <h1 class="text-white">PlantI</h1>
            <nav>
                <a href="Home.jsp" class="text-white text-decoration-none mx-2">Home</a>
                <a href="contact.jsp" class="text-white text-decoration-none mx-2">Contact</a>
                <a href="History.jsp" class="text-white text-decoration-none mx-2">About Our History</a>
                 <a href="login.jsp" class="text-white text-decoration-none mx-2">Login</a>
            </nav>
        </div>
    </header>
       <script>
           jQuery.validator.addMethod("checkemail", function(value, element) {
               return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
           }, "Please enter the email format as abc@gmail.com");

           jQuery(document).ready(function($) {
               $("#signup").validate({
                   rules: {
                	   name: {
                           required: true
                       },
                	   phone: {
                           required: true,
                           minlength: 10,
                           maxlength: 10,
                           digits: true
                       },
                       address:{
                    	   required:true
                       }
                       email: {
                           required: true,
                           checkemail: true
                       },
                       password: {
                           required: true,
                           
                       },
                       cpass: {
                           required: true,
                          
                           equalTo: "#password"
                       }
                   },
                   messages: {
                	   name: {
                           required: "Please enter your name"
                       },
                	   phone: {
                           required: "Please enter your phone number",
                           minlength: "Your phone number must be exactly 10 digits",
                           maxlength: "Your phone number must be exactly 10 digits",
                           digits: "Please enter a valid phone number"
                       },
                       address: {
                           required: "Please enter your address"
                       },
                       email: {
                           required: "Please enter the email.",
                       },
                       password: {
                           required: "Please enter your password",
                          
                       },
                       cpass: {
                           required: "Please confirm your password",
                           equalTo: "Passwords do not match"
                       }
                   },
                   submitHandler: function(form) {
                       form.submit();
                   }
                   }
               });
           });



       </script>
      
<div class="main">
   <center>

       <% if (request.getAttribute("status") != null) {%>
       <div id="msg">  <%= request.getAttribute("status")%></div>
       <%}%>

       <form method="POST" id="signup" action="register" class="form">
           <font color="white" size="4">
           <h1> Sign up  </h1>
           </font>
           <br>
           <div class="container ">
            <div class="form-group col-md-4">
                <label >Name</label>
                <input type="text" class="form-control"  placeholder="Enter your name" name="name">
            </div>
            <div class="form-group col-md-4">
                <label >phone</label>
                <input type="text" class="form-control"  placeholder="Enter your phone number" name="phone">
            </div>
            <div class="form-group col-md-4">
                <label >Adderss</label>
                <input type="text" class="form-control"  placeholder="Enter your address" name="address">
            </div>
               <div class="form-group col-md-4">
                   <label >Email address</label>
                   <input type="email" class="form-control" placeholder="Enter email"  name="email">
               </div>
               <div class="form-group col-md-4">
                   <label >Password</label>
                   <input type="password" class="form-control"  placeholder="Enter Password" name="password">
               </div>
               <div class="form-group col-md-4">
                <label >conform-Password</label>
                <input type="password" class="form-control"  placeholder="Enter re- Password" name="cpass">
            </div>
               <button type="submit" class="btn btn-primary" name="csignup">Submit</button>
               <div style="text-align: center;  margin-top: 15px;">
                   <a href="forgot.jsp" style="color: white; ">Forgot password?</a> / <a href="changePass.jsp" style="color: white; ">Reset Password</a>
               </div>
           </div>
       </form>

   </center>
</div>
   <%@include file="footer.jsp"%>
</body>
</html>