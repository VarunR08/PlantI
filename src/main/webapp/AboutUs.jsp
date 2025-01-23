<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <title>About Us</title>
    <style>
       
        body{
            background-image: url('./Images/palntimage.jpg');
            background-repeat: no-repeat;
            background-size: cover;

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

        .ref{
            text-decoration-line: none ;
            color : white
        }
    </style>
</head>
<body>
	<%@include file="Header.jsp"%>
        <h1 class ='plants'>Plants</h1>
        <h6 class = 'content'>Shop where you can buy any plant and we can will deilver you straight way.</h6>
        
        <div class=" button-div">
        <button type="button" class="btn btn-success btn"><a href='#' class ='ref'>Explore Plants</a></button>
        <button type="button" class="btn btn-success btn"><a href='Review.jsp' class ='ref'>Review Us </a></button>
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@include file="footer.jsp"%>
    </body>
</html>