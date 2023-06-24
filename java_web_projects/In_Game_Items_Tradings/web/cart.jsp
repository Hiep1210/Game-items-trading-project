<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Buy Page</title>
        <!-- Link Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!-- Link Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Link Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Link CSS -->
        <link rel="stylesheet" href="UI/css/style.css">
        <link rel="stylesheet" href="UI/css/styleBuy.css">
    </head>

    <body>
        <c:set var="redirect" value="BuyPageController"/>
        <%@include file="navbar.jsp" %>
        <!-- Main Content -->
        <div class="container">
            <h1 id="cart-size">Your Cart Item(s): ${requestScope.clist.size()} items!</h1>
            <c:if test="${requestScope.message != null}">
                <h2>${requestScope.message}</h2>
            </c:if>
            <c:set var="total" value="0"/>
            <c:forEach var ="cartlist" items="${requestScope.clist}">
                <c:set var="total" value="${cartlist.price + total}"/>
                <div class="item-card mt-2 mb-2 " id="cart-card" data-bs-toggle="offcanvas" href="#offcanvas${market_items.id}">
                    <div class="card" >
                        <img src="UI/image/${cartlist.getImg()}.png" alt ="displayfailed" class="card-img-top" >
                        <div class="card-body row">
                            <h5 class="card-title item-card-price ps-1">$ ${cartlist.price}</h5>
                            <h5 class="card-title item-card-price ps-1">Buy from ${cartlist.price}</h5>
                            <div class="col-lg-6">
                                <form action="ProcessCartController" method="post" onsubmit="return confirm('Are you sure you want to buy only this item from cart? ')">
                                    <input type="text" name="cartId" value="${cartlist.id}" hidden=""/>
                                    <button type="submit" class="btn item-card-button ">
                                        <h5 class="card-title item-card-price ps-1">Buy</h5>
                                    </button>
                                    <input type="text" name="gameAccountName" placeholder="Game account name ..."required="">
                                </form><!-- comment -->
                            </div>
                            <div class="col-lg-6">
                                <form action="DeleteCartController" method="post" onsubmit="return confirm('Are you sure you want to remove this item from cart? ')">
                                    <input type="text" name="id" value="${cartlist.id}" hidden=""/>
                                    <button type="submit"  class="btn item-card-button ">
                                        <h5 class="card-title item-card-price ps-1">Remove</h5>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${requestScope.clist !=null}">
                <h2 style="color: wheat; text-align: right;">The total amount in your cart: ${total} $</h2>
                <form action="ProcessCartController" method="post" onsubmit="return confirm('Are you sure you want to buy all item(s) from cart? ')">
                    <input type="text"  placeholder="Game acount name..."name="gameAccountName" required="">    
                    <button type="submit" class="btn item-card-button ">
                        <h5 class="card-title item-card-price ps-1">Buy All</h5>
                    </button>
                </form>
            </c:if>
        </div>

        <!-- Link Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
        </script>

    </body>

</html>
