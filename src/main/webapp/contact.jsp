<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us | Plant Store</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.success{
		color:white;
		background-color: green; 
		text-align: center;
		height: 40px;
		width: 350px;
		margin-left: 600px;
	}
	
	.failure{
		color:white;
		background-color: red; 
		text-align: center;
		height: 40px;
		width: 350px;
		margin-left: 600px;
	}

</style>
</head>
<body>

<% String status = (String)request.getAttribute("status");
	if(status!=null){
%>

	<h3 class = "success"><%=status %></h3>
<%} %>

<% String failure = (String)request.getAttribute("fail");
	if(failure!=null){
%>

	<h3 class = "failure"><%=status %></h3>
<%} %>
        
  <header class="bg-success text-white text-center py-4">
    <h1 class="text-white">PlantI</h1>
            <nav>
                <a href="Home.jsp" class="text-white text-decoration-none mx-2">Home</a>
                <a href="History.jsp" class="text-white text-decoration-none mx-2">About Our History</a>
                 <a href="login.jsp" class="text-white text-decoration-none mx-2">Login</a>
            </nav>
  </header>

  <div class="container my-5">
    <div class="row">
      <!-- Contact Information -->
      <div class="col-md-6 mb-4">
        <h2>Get in Touch</h2>
        <p>Have questions about our plants or need advice? Reach out to us anytime!</p>
        <ul class="list-unstyled">
          <li><strong> Phone:</strong> +91-968-545-3333</li>
          <li><strong> Email:</strong> plantisite.in / plantsforlife@gmail.com</li>
          <li><strong> Address:</strong> #765, 8th Cross Rd, Govindaraja Nagar Ward, MC Layout, Vijayanagar,   Bengaluru, Karnataka </li>
        </ul>
        <p><strong> Business Hours:</strong></p>
        <ul class="list-unstyled">
          <li>Monday - Friday: 9 AM - 6 PM</li>
          <li>Saturday: 10 AM - 4 PM</li>
          <li>Sunday: Closed</li>
        </ul>
        <p><strong> Follow Us:</strong></p>
        <a href="#" class="btn btn-outline-success btn-sm me-2">Instagram</a>
        <a href="#" class="btn btn-outline-success btn-sm me-2">Facebook</a>
        <a href="#" class="btn btn-outline-success btn-sm">Pinterest</a>
      </div>

      <!-- Contact Form -->
      <div class="col-md-6">
        <h2>Send Us a Message</h2>
        <form action= "contact" method = "post">
          <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name = "name" class="form-control" id="name" placeholder="Enter your name">
          </div>
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name = "email" class="form-control" id="email" placeholder="Enter your email">
          </div>
          <div class="mb-3">
            <label for="message" class="form-label">Message</label>
            <textarea class="form-control" name = "message" id="message" rows="5" placeholder="Write your message"></textarea>
          </div>
          <button type="submit" name = "submit" class="btn btn-success w-100">Submit</button>
        </form>
      </div>
    </div>
  </div>

  <footer class="bg-success text-white text-center py-3">
    <p class="mb-0">&copy; 2025 Plant Store. All Rights Reserved.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>