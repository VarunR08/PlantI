<%@page import="model.Registration"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
<style>
    .content-div{
        margin-left: 600px;
        height: 400px;
        width: 500px;    
          
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
   background-color: #f0ebdd;
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

</style>
</head>
  <body>
    
     <%
                Registration reg = new Registration(session);
                User u = reg.getInfo();%>
                
    <div class="user-reviews-section content-div">
        <h5>User Reviews:</h5>
        <div class="review-form mb-3">
            <form action="submitreview" method="post">
                <input type="hidden" name="username" value="<%=u.getName() %>">
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
                <button type="submit" class="btn btn-submit" name="submit">Go Back</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>