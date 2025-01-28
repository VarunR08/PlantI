<!doctype html>
<%@page import="model.Products"%>
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
.cart{
        display: flex;
        }


    </Style>

  </head>
  <body>
   <%@include file="Header.jsp"%>
   
     <% Products p = (Products) session.getAttribute("product"); %> 
     
    <div class= "main-content">
    <div>
        <img class = "img-tag"src="<%=p.getP_img() %>" alt="loading...">
    </div>

    <div>
        <p class = "plant-content"><strong><%=p.getP_name() %></strong></p>
        <strong><p class = "plant-id"><%=p.getPid() %></p></strong>
        <p class="plant-price"> &#8377: <%=p.getPrice() %></p>
        <p class="availability">In Stock</p>
        <p class="delivery-info">Free shipping on orders over &#8377; 1000!</p>

        
        <div class="cart buttons">
                                                             <form action="addtocart" method="post">
    <input type="hidden" name="p_id" value="<%= p.getPid() %>">
    <input type="number" name="qty" value="1" min="1" style="width:80%" >
    <br>

    <button type="submit" class="btn btn-primary" style="margin-top: 5%">Add to Cart</button>
</form>
                              <%-- <form action="register" method="post">
                             
                    <input type="hidden" class="btn btn-primary" name="book" value="<%=p.getPid() %>" > 
                    <input type="submit" class="btn btn-primary" value="Buy Now"  style="margin-top: 45%"> 
                   </form> --%>
                            </div>
        <br>
        <label class="desc"> Description: <%=p.getP_des() %></label>
        
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <%@include file="footer.jsp"%>
  </body>
</html>