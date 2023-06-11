<%-- 
    Document   : userProfile
    Created on : Jun 5, 2023, 10:36:58 AM
    Author     : VICTUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>
        <!-- Link Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <!-- Link Icons -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <!-- Link CSS -->
        <link rel="stylesheet" href="UI/css/style.css">
        <link rel="stylesheet" href="UI/css/userProfile.css">
    </head>

    <body>
        <c:set var="redirect" value="UserProfileController"/>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg" id="navbar">
            <div class="container-fluid">
                <!-- Navbar Logo -->
                <a class="navbar-brand col-lg-3" href="DisplayMarketItemsController">
                    <img src="UI/image/newLogo.png" alt="siteLogo" width="100px">
                </a>
                <!-- Navbar Toggler Button -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler"
                        aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Navbar Toggler -->
                <div class="collapse navbar-collapse col-lg-9" id="navbarToggler">
                    <!-- Navbar Item Box -->
                    <div class="navbar-item-box col-lg-8">
                        <div class="row nopadding">
                            <!-- Trade Button -->
                            <div class="col-lg-3 navbar-item nopadding">
                                <a href="">
                                    <i class="material-icons navbar-item-icon">compare_arrows</i>
                                </a>
                                <h5>Trade</h5>
                            </div>
                            <!-- Sell Button -->
                            <div class="col-lg-3 navbar-item nopadding">
                                <a href="">
                                    <i class="material-icons navbar-item-icon">sell</i>
                                </a>
                                <h5>Sell</h5>
                            </div>
                            <!-- Buy Button -->
                            <div class="col-lg-3 navbar-item nopadding">
                                <a href="BuyPageController">
                                    <i class="material-icons navbar-item-icon">shopping_cart</i>
                                </a>
                                <h5>Buy</h5>
                            </div>
                            <!-- Auction Button -->
                            <div class="col-lg-3 navbar-item nopadding">
                                <a href="">
                                    <i class="material-icons navbar-item-icon">gavel</i>
                                </a>
                                <h5>Auction</h5>
                            </div>
                        </div>
                    </div>
                    <!-- Navbar User  -->
                    <%--<c:out value="${pageContext.request.requestURI}"/>--%>
                    <div class="col-lg-4 nopadding navbar-user">
                        <div class="row nopadding">
                            <!-- User Notification -->
                            <div class="col-lg-3 navbar-user-notifi dropdown">
                                <c:if test="${(sessionScope.user != null)}">  
                                    <c:choose>
                                        <c:when test="${(requestScope.notificationList == null)}">
                                            <a class="btn" type="button" href="GetNotificationController?redirect=${redirect}">
                                                <i class="material-icons navbar-item-icon">notifications</i>
                                            </a>
                                        </c:when>
                                        <c:when test="${(requestScope.notificationList.size() eq 0) }">
                                            <!-- Dropdown toggler -->
                                            <a class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                               aria-expanded="false">
                                                <i class="material-icons navbar-item-icon">notifications</i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">You have 0 new notification </a>
                                            </div>
                                        </c:when>    
                                        <c:otherwise>
                                            <!-- Dropdown toggler -->
                                            <a class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                               aria-expanded="false">
                                                <i class="material-icons navbar-item-icon">notifications</i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <c:forEach var="notification" items="${requestScope.notificationList}">
                                                    <a class="dropdown-item" href="#">${notification.noti_content}</a>
                                                </c:forEach>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </div>
                            <!-- User Balance -->
                            <div class="col-lg-6 navbar-user-balance nopadding">
                                <c:if test="${(sessionScope.user != null)}" >  
                                    <!-- Balance amount -->
                                    <div class="navbar-user-balance-text">
                                        <h5>Your balance</h5>
                                        <h5>$ ${sessionScope.user.money}</h5>
                                    </div>
                                    <!-- Topup button -->
                                    <div class="navbar-user-balance-topup rounded-circle">
                                        <i class="material-icons navbar-item-icon">add</i>
                                    </div>
                                </c:if>
                            </div>
                            <!-- User Profile -->
                            <c:choose>
                                <c:when test="${sessionScope.user != null}">
                                    <div class="col-lg-3 navbar-user-profile dropdown">
                                        <!-- Dropdown toggler -->
                                        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                                aria-expanded="false">
                                            <img class="img-fluid rounded-circle" src="UI/image/user_profile.jpg" alt="">
                                        </button>
                                        <!-- Dropdown menu -->
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="UserProfileController">User Profile</a>
                                            <a class="dropdown-item" href="#">Transaction History</a>
                                            <div class="dropdown-divider"></div>
                                            <a id="logout" class="dropdown-item" href="LogOutController">Log out</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-lg-3 navbar-user-profile dropdown">
                                        <!-- Dropdown toggler -->
                                        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                                aria-expanded="false">
                                            <img class="img-fluid rounded-circle" src="UI/image/user_profile1.jpg" alt="">
                                        </button>
                                        <!-- Dropdown menu -->
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a class="dropdown-item" href="signup.jsp?request_id=1">Sign Up</a>
                                            <a class="dropdown-item" href="login.jsp">Log In</a>
                                            <div class="dropdown-divider"></div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
        </nav>

        <div class="container-fluid main-content">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-lg-3 sidebar">
                    <div class="container">
                        <!-- Sidebar Category -->
                        <details class="sidebar-category">
                            <summary>User Profile</summary>
                            <ul class="nopadding">
                                <a href="UserProfileController">
                                    <li>Profile</li>
                                </a>
                                <a href="topUpRequest.jsp">
                                    <li>Top up</li>
                                </a>
                                <a href="ChangePassword.jsp">
                                    <li>Change Password</li>
                                </a>
                                <c:if test="${(sessionScope.user != null) && (sessionScope.user.role_id eq 2)}">  
                                    <a href="GetPaymentRequestController">
                                        <li>Process top up request</li>
                                    </a>
                                    <a href="sendAdminNotification.jsp">
                                        <li>Send notification to all users</li>
                                    </a>
                                </c:if> 
                            </ul>
                        </details>
                        <!-- Sidebar Category -->
                        <details class="sidebar-category">
                            <summary>History</summary>
                        </details>
                    </div>
                </div>
                <!-- User Info -->
                <div class="col-lg-6 user-information">
                    <div class="container">
                        <form id="edit-user-profile">
                            <div class="row mb-3">
                                <label for="username" class="col-sm-3 col-form-label">User Name:</label>
                                <div class="col-sm-7">
                                    <input type="text" value="${sessionScope.user.username}" class="form-control" readonly="">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="email" class="col-sm-3 col-form-label">Email:</label>
                                <div class="col-sm-7">
                                    <input type="text"  value="${sessionScope.userInfo.email}" class="form-control" id="email" readonly>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="dob" class="col-sm-3 col-form-label">Date of Birth:</label>
                                <div class="col-sm-7">
                                    <input type="date" value="${sessionScope.userInfo.dob}" class="form-control" id="dob" readonly="">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="gender" class="col-sm-3 col-form-label">Gender:</label>
                                <div class="col-sm-7">
                                    <input type="text" value="${sessionScope.userInfo.gender}" class="form-control" id="dob" readonly="">
                                </div>
                            </div>
                        </form>
                        <div class="form-message">${requestScope.mess3}</div>
                    </div>
                </div>
                <!-- User PFP -->
                <div class="col-lg-3 user-pfp">
                    <div class="container">
                        <img class="img-fluid rounded-circle" src="image/user_profile.jpg" alt="">
                        <div class="row mb-3 user-information">
                            <label for="dob" class="col-form-label">Associated Game Account</label>
                            <label for="dob" class="col-form-label">Username:</label>
                            <input type="text" value="${sessionScope.game_acc.username}" class="form-control" id="dob" readonly="">
                            <div class="mt-4 summit-button nopadding">
                                <a style=" text-decoration: none" href="loginGameAccount.jsp?request_id=2">
                                    <i class="material-icons navbar-item-icon">link</i>
                                    <label style="display: inline;">Change linked game account</label>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Link Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
        </script>
    </body>

</html>