<%@page import="model.User"%>
<%@page import="model.Reviews"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>Document</title>
    <style>
        *{
            padding-bottom: 20px;
        }
        /* body{
            background-image: url('palntimage.jpg');
            background-repeat: no-repeat;
            background-size: auto;
            height: 600px;
            width: 1000px;

        } */

        .image{
           background-image: url('./Images/palntimage.jpg');
            background-repeat: no-repeat;
            background-size: contain;
            height: 800px;
        }
        .plants{
            padding-left : 150px;
            color: #77B254;
            font-size: 250px;
        }

        .content{
            padding-left : 180px;
            padding-top: 1px;
            color: #77B254;
        }

        .button-div{
            margin-left: 300px;
        }
        .btn{
            background-color: #77B254;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;
        }

       .user-review {
    border-bottom: 1px solid #dee2e6;
    padding: 12px 0;
}

.rating {
    color: #ffc107;
}

@media (max-width: 768px) {
    .product-card {
        flex-direction: column;
    }
}

h6 {
    color: #856404;
    margin-top: 20px;
    font-weight: bold;
}

.pet-care-tips, .breed-information, .nutrition-guidelines, .training-resources, .pet-health, .adoption-resources {
    background-color: #ffeeba;
    border-radius: 8px;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.pet-care-tips ul, .training-resources ul {
    list-style-type: none;
    padding: 0;
}

.pet-care-tips a, .training-resources a {
    color: #856404;
    text-decoration: underline;
}

.pet-care-tips a:hover, .training-resources a:hover {
    text-decoration: none;
}

.user-reviews-section {
   
    border-radius: 10px;
    padding: 20px;
    margin-top: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
}

.user-reviews-section h6 {
    color: #5d4b28;
    margin-bottom: 15px;
    font-weight: bold;
}

.review-form {
    display: flex;
    flex-direction: column;
}

.review-form textarea {
    height: 120px;
    border-radius: 8px;
    border: 1px solid #ccc;
    padding: 12px;
    font-size: 1rem;
    resize: none;
    margin-bottom: 12px;
    transition: border-color 0.3s;
}

.review-form textarea:focus {
    border-color: #ffca28;
    outline: none;
}

.btn-submit {
    background-color: #ffca28;
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 12px 20px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn-submit:hover {
    background-color: #fbc02d;
}

.emoji-rating {
    display: flex;
    
    cursor: pointer;
}

.emoji-rating input[type="radio"] {
    display: none; /* Hide the radio buttons */
}

.emoji-rating .emoji {
    font-size: 30px; /* Increase the size of the stars */
    transition: transform 0.2s; /* Add a hover effect */
}

.emoji-rating .emoji:hover {
    transform: scale(1.2); /* Slightly enlarge on hover */
}

.emoji-rating input[type="radio"]:checked + label {
    color: gold; /* Change color for the selected star */
}

.quantity-select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 2px solid #f9d04e;
    border-radius: 5px;
    background-color: #fff;
    font-size: 1em;
    transition: border-color 0.3s;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
}

.quantity-select:focus {
    border-color: #f9e55e;
    outline: none;
}

.quantity-select::after {
    content: '▼';
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    pointer-events: none;
}

@media (max-width: 768px) {
    .quantity-select {
        font-size: 0.9em;
    }
}

label {
    font-size: 1.2em;
    color: #333;
    margin-bottom: 5px;
    display: block;
}
 .ref{
            text-decoration-line: none ;
            color : white
        }

       

    </style>
</head>
<body>
<%@include file="Header.jsp"%>
    <div class = "image">
        <h1 class ='plants'>Plants</h1>
        <h6 class = 'content'>Shop where you can buy any plant and we can will deilver you straight way.</h6>
        
        <div class=" button-div">
        <button type="button" class="btn btn-success btn"><a href='#' class ='ref'>Explore Plants</a></button>
</div>
</div>
<%
	Registration reg = new Registration(session);
	User u =reg.getInfo();
%>
<div class="user-reviews-section">
    <strong>User Reviews:</strong>
    <div class="review-form mb-3">
        <form action="submitreview" method="post">
            
            <input type="hidden" name="username" value=<%=u.getName() %>>
            <div class="emoji-rating">
                <input type="radio" id="emoji5" name="rating" value="1" />
                <label for="emoji5" class="emoji" onclick="setRating(1)">&#11088;</label>
                
                <input type="radio" id="emoji4" name="rating" value="2" />
                <label for="emoji4" class="emoji" onclick="setRating(2)">&#11088;</label>
                
                <input type="radio" id="emoji3" name="rating" value="3" />
                <label for="emoji3" class="emoji" onclick="setRating(3)">&#11088;</label>
                
                <input type="radio" id="emoji2" name="rating" value="4" />
                <label for="emoji2" class="emoji" onclick="setRating(4)">&#11088;</label>
                
                <input type="radio" id="emoji1" name="rating" value="5" />
                <label for="emoji1" class="emoji" onclick="setRating(5)">&#11088;</label>
            </div>

            <textarea name="review" placeholder="Write your review here..." required></textarea>
            <button type="submit" class="btn btn-submit" name="submit">Submit Review</button>
            <button type="submit" class="btn btn-submit" name="submit"><a href='dashboard.jsp' class ='ref'>Go Back</a></button>
        </form>
    </div>
</div>

<% 
    Registration reg1 = new Registration(session);
       User us =reg.getInfo();
    ArrayList<Reviews> al1 = reg1.getreviewinfo(us.getName());
    Iterator<Reviews> itr2 = al1.iterator();
    while(itr2.hasNext()) {
        Reviews rev = itr2.next();
%>
    <div class="user-review">
        <strong><%= rev.getUname() %></strong>
        
       <%--  <p class="rating">
            <% 
                int rating =(Integer.parseInt(rev.getRating()));
                for (int i = 1; i <= 5; i++) {
                    if (i <= rating) { %>
                        <i class="fas fa-star"></i> 
                    <% } else { %>
                        <i class="far fa-star"></i>
                    <% }
                }
            %>
        </p> --%>
        
        <p><%= rev.getReview() %></p>
    </div>
<% 
    } 
%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@include file="footer.jsp"%>
    </body>
</html>