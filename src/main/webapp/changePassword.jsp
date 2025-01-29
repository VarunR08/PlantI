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
 <style type="text/css">
 .main{
 background: url('https://i.pinimg.com/736x/bf/c6/ba/bfc6ba9f683ff1628dc87f0d05d21faa.jpg') no-repeat center center/cover;
            padding: 150px 0;
            
 }
 .form{
 width: 450px;
    height: 400px;
    background: linear-gradient(to top,rgba(0,0,0,0.8)50%,rgba(0,0,0,0.8)50%);
       border-radius: 10px;
   
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
                <a href="Signup.jsp" class="text-white text-decoration-none mx-2">SignUp</a>

            </nav>
        </div>
    </header>
   
       <script>
           jQuery.validator.addMethod("checkemail", function(value, element) {
               return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
           }, "Please enter the email format as abc@gmail.com");

           jQuery(document).ready(function($) {
               $("#reset").validate({
                   rules: {
                       email: {
                           required: true,
                           checkemail: true
                       },
                       pw: {
                           required: true,
                           minlength: 6
                       },
                       cpw: {
                           required: true,
                           minlength: 6,
                           equalTo: "#pw"
                       },
                   },
                   messages: {
                       email: {
                           required: "Please enter the email.",
                       },
                       pw: {
                           required: "Please enter the password.",
                           minlength: "Please enter the password greater than or equal to 6.",
                       },
                   }
               });
           });



       </script>
       <style>
           .error{
               color:red;
           }
/*            .button{
               padding: 5px;
               width: 6%;
               background: cornflowerblue;
               color: white;
           }*/

          /*  #msg
           {
               background: green;
               color:black;
               border: 1px solid green;
               width:24%;
               font-weight: bold;
               font-size: 25px;
               padding: 5px;
           } */
/*            td input{
               display:block;
           }*/
       </style>
<div class="main">
   <center>

       <% if (request.getAttribute("status") != null) {%>
       <div id="msg">  <%= request.getAttribute("status")%></div>
       <%}%>

       <form method="POST"  action="changePass" class="form">
           <font color="white" size="4">
           <h2 > Reset Password </h2>
           </font>
           <br>
           <div class="container ">
               <div class="form-group col-md-4">
                <font color="white" size="3">
                   <label >Email address</label>
                   </font>
                   <input type="email" class="form-control" placeholder="Enter email"  name="email">
               </div>
               <div class="form-group col-md-4">
                <font color="white" size="3">
                   <label >Old Password</label>
                   </font>
                   <input type="password" class="form-control" id="pw" placeholder="Old  Password" name="opw">
               </div>
               <div class="form-group col-md-4">
                <font color="white" size="3">
                   <label >New Password</label>
                   </font>
                   <input type="password" class="form-control"  placeholder="Enter New Password" name="npw">
               </div>
               <button type="submit" class="btn btn-success" name="submit">Submit</button>
               <div style="text-align: center; margin-top: 15px;">
                  <!-- <a href="login.jsp">Login</a> -->
               </div>
           </div>
       </form>

   </center>
</div>
   <%@include file="footer.jsp"%>
</body>
</html>