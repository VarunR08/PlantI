<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 
    <Style>
        .img-tag{
            width: 500px;
            height: 450px;
            margin-left: 150px;
            margin-top: 80px;
        }

        .main-content{
            display: flex;
        }

        .plant-content{
            margin-top: 100px;
            margin-left: 50px;
            font-size: x-large;
            font-style: oblique;
        }

        .plant-id{
            margin-left: 80px;
            font-size: large;
        }
        
        .plant-price{
            margin-left: 80px;
            font-size: xx-large;
        }
        .availability{
            margin-left: 120px;
        }

        .delivery-info{
            margin-left: 120px;
        }

        .button-container {
    display: flex;
    justify-content: center;
    margin: 20px 0; 
}


.buttons,.desc{
    
     padding-left: 125px;
}


    </Style>

  </head>
  <body>
   <%@include file="Header.jsp"%>
    <div class= "main-content">
    <div>
        <img class = "img-tag"src="https://getorganics.in/cdn/shop/files/10_987abbcf-3e21-4327-9bc3-0b93f35d4dee.png?v=1722706258&width=713" alt="loading...">
    </div>

    <div>
        <p class = "plant-content"><strong>Broken Heart (Monstera adansonii) - Small</strong></p>
        <strong><p class = "plant-id">ID: 68897</p></strong>
        <p class="plant-price"> &#8377: 10000.00</p>
        <p class="availability">In Stock</p>
        <p class="delivery-info">Free shipping on orders over &#8377; 1000!</p>
            <div class="buttons">
                <a href="#"><button class="btn btn-primary" type="submit">Add to Cart</button></a>
                <a href="#"><button class="btn btn-primary" type="submit">Buy Now</button></a>
        </div>
        <br>
        <label class="desc"> Description:</label>
        
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <%@include file="footer.jsp"%>
  </body>
</html>