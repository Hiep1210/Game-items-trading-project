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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Link CSS -->
        <link rel="stylesheet" href="UI/css/userProfile.css">
        <link rel="stylesheet" href="UI/css/style.css">
        <link rel="stylesheet" href="UI/css/styleInput.css">
        <link rel="stylesheet" href="UI/css/styleItemBox.css">
        <link rel="stylesheet" href="UI/css/styleSell.css">
        <script src="UI/js/formValidate.js"></script>
    </head>

    <body>
        <c:set var="redirect" value="createAution.jsp"/>
        <%@include file="navbar.jsp" %>
        <c:if test ="${sessionScope.user != null}">

            <div class="container-fluid main-content">
                <div class="row">
                    <div class="container-fluid w-75">
                        <h1 class="text-white fw-bold">Create Auction:</h1>
                        <!-- Tool bar -->
                        <div class="row mt-2">
                            <!-- Search Bar -->
                            <div class="col-lg-3 search-bar form">
                                <div class="form-group">
                                    <i class="fa-solid fa-magnifying-glass pt-3 ps-3"></i>
                                    <input oninput="filterByType()" id="search-input" class="form-control ps-5" type="text" placeholder="Search...">
                                </div>
                            </div>
                            <!-- Filter By Type -->
                            <div class="col-lg-1 filter-type">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger">Type</button>
                                    <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="visually-hidden">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li class="dropdown-item"><input type="checkbox" name="knife" value="knife" checked>Knife</li>
                                        <li class="dropdown-item"><input type="checkbox" name="pistol" value="pistol" checked>Pistol</li>
                                        <li class="dropdown-item"><input type="checkbox" name="rifle" value="rifle" checked>Rifle</li>
                                        <li class="dropdown-item"><input type="checkbox" name="smg" value="smgs" checked>SMGs</li>
                                        <li class="dropdown-item"><input type="checkbox" name="heavy" value="heavy" checked>Heavy</li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li class="dropdown-item" style="color: rgb(87, 242, 135)" id="select-all">Select All</li>
                                        <li class="dropdown-item" style="color: rgb(218, 100, 123)" id="reset-all">Reset</li>
                                        <li class="dropdown-item" style="color: rgb(128, 108, 245)" onclick="filterByType()">Save Filter</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Sort by Rarity -->
                            <div class="col-lg-2">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger" id="rarity-sort">Rarity</button>
                                    <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="visually-hidden">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li class="dropdown-item" onclick="filterByType('asc', this)">Rarest First</li>
                                        <li class="dropdown-item" onclick="filterByType('desc', this)">Common First</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Item List -->
                        <div class="row" id="list-content">
                            <c:forEach var ="sellList" items="${requestScope.sellList}">
                                <!-- Item Card -->
                                <div class="col-lg-2 item-card mt-2 mb-2" id="item-card" data-bs-toggle="offcanvas" href="#offcanvas${sellList.trimedSkinName}">
                                    <div class="card rarity-${sellList.gameItems.rarity.toLowerCase()}" data-bs-toggle = "dropdown" aria-expanded="false">
                                        <img src="UI/image/${sellList.gameItems.img}.png" alt ="displayfailed" class="card-img-top">
                                        <div class="card-body">
                                            <p class="item-full-name">${sellList.gameItems.type} | ${sellList.gameItems.itemName} ${sellList.gameItems.skinName}</p>
                                            <a href="#" class="btn item-card-button">
                                                <i class="fa-solid fa-gavel"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Item Details -->
                                <div class="offcanvas offcanvas-start item-details" data-bs-theme="dark" tabindex="-1" id="offcanvas${sellList.trimedSkinName}"
                                     aria-labelledby="offcanvas${sellList.gameItems.img}">
                                    <div class="offcanvas-header">
                                        <h5 class="offcanvas-title" id="offcanvas">
                                            ${sellList.gameItems.type} | ${sellList.gameItems.itemName} ${sellList.gameItems.skinName}
                                        </h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="offcanvas-body">
                                        <img class="img-fluid" src="UI/image/${sellList.gameItems.img}.png" alt="">
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="sell-info-select-name">Exterior:</p>
                                            <select name="exterior" class="form-control w-50">
                                                <option value="Factory New">Factory New</option>
                                                <option value="Minimal Wear">Minimal Wear</option>
                                                <option value="Field-Tested">Field-Tested</option>
                                                <option value="Well-Worn">Well-Worn</option>
                                                <option value="Battle-Scarred">Battle-Scarred</option>
                                            </select>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="sell-info-select-name">Rarity:</p>
                                            <h5>${sellList.gameItems.rarity}</h5>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mt-2">
                                            <p class="sell-info-select-name" required >Auction duration:</p>
                                            <input class="mb-3" type="radio" name ="sellTime" value="1">
                                            <label class="mb-3">1 Day</label>
                                            <input class="mb-3" type="radio" name ="sellTime" value="2">
                                            <label class="mb-3">2 Day</label>
                                            <input class="mb-3" type="radio" name ="sellTime" value="3">
                                            <label class="mb-3">3 Day</label>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="sell-info-select-name">Starting price:</p>
                                            <div class="form-group w-50">
                                                <input class="form-control" type="number" step="0.01" min="0.01" max="10000" id="lowestBid" name="price" class="form-control"  placeholder="Insert starting bid" required>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="sell-info-select-name">Bid step: %</p>
                                            <div class="form-group w-50">
                                                <input class="form-control" type="number" step="1" min="5" max="20" value="10" id="bidIncrement" name="bidIncrement" class="form-control"  placeholder="Insert bid step" required>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between mt-2">
                                            <p class="sell-info-select-name">Game Account:</p>
                                            <div class="form-group w-50">
                                                <input class="form-control" type="text" name ="gameAccount" placeholder="G.Account Name"required="" >
                                            </div>
                                        </div>
                                        <c:if test="${sessionScope.user != null}">
                                            <div class="summit-button mt-2">
                                                <button class="btn item-card-button" onclick="addToSellList(event)">
                                                    Create Auction
                                                </button>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>    
                        </div>
                        <div>
                            <button onclick="loadMore()" class="btn btn-danger" id="load-button">Load More</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test ="${sessionScope.user == null}">
            <h3>Please log in to use this feature!</h3>
        </c:if>
        <!-- Link Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
        </script>

        <script>
            function getAmount() {
                return document.getElementsByClassName("item-card").length;
            }

            function loadMore() {
                var amount = getAmount();
                console.log(amount);
                $.ajax({
                    url: "/In_Game_Items_Trading/load",
                    type: 'GET',
                    data: {
                        exist: amount
                    },
                    success: function (data) {
                        var row = document.getElementById("list-content");
                        row.innerHTML += data;
                        updateButtons();
                        if (data.length === 0) {
                            document.getElementById("load-button").style.display = "none";
                        }
                    }
                });
            }
        </script>

        <!-- Script for filter -->
        <script>
            // Create an empty array to store the checked values
            var checkedValues = ['knife', 'pistol', 'rifle', 'smgs', 'heavy'];
            var selectAllButton = document.getElementById('select-all');
            var resetButton = document.getElementById('reset-all');
            // Get all the checkbox elements on the page
            var checkboxes = document.querySelectorAll('input[type="checkbox"]');
            // Add event listener to each checkbox
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    // Check if the checkbox is checked
                    if (this.checked) {
                        // Push the value into the array
                        checkedValues.push(this.value);
                    } else {
                        // Remove the value from the array if unchecked
                        var index = checkedValues.indexOf(this.value);
                        if (index !== -1) {
                            checkedValues.splice(index, 1);
                        }
                    }
                    // Log the updated array
                    console.log(checkedValues);
                });
            });
            selectAllButton.addEventListener('click', function () {
                checkedValues = [];
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = true;
                    checkedValues.push(checkbox.value);
                });
                console.log(checkedValues);
            });
            resetButton.addEventListener('click', function () {
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = false;
                });
                checkedValues = [];
                console.log(checkedValues);
            });
            function filterByType(order) {
                var searchName = document.getElementById("search-input").value;
                console.log(searchName);
                $.ajax({
                    url: "/In_Game_Items_Trading/filterAuction",
                    type: "GET",
                    //use when passing array
                    traditional: true,
                    data: {
                        types: checkedValues,
                        txt: searchName,
                        order: order
                    },
                    success: function (data) {
                        var row = document.getElementById("list-content");
                        row.innerHTML = data;
                        document.getElementById("load-button").style.display = "none";
                    },
                    error: function () {
                        console.log('Error occurred during AJAX request');
                    }
                });
            }
        </script>
        <!-- Script for add to sell list -->
        <script>
            function getUserSellItemsAmount() {
                localStorage.setItem("userSellItemsAmount", `${requestScope.userSellItemsAmount}`);
            }
            window.addEventListener('load', getUserSellItemsAmount());

            // Retrieve the sell list state from local storage
            var userSellItemsAmount = localStorage.getItem("userSellItemsAmount") || 0;

            function addToSellList(event) {
                var clickedButton = event.target;
                var parentContainer = clickedButton.closest('.item-details');

                if (parentContainer) {
                    var exteriorElement = parentContainer.querySelector('select[name="exterior"]');
                    var sellTimeElement = parentContainer.querySelector('input[name="sellTime"]:checked');
                    var priceElement = parentContainer.querySelector('input[name="price"]');
                    var gameAccountElement = parentContainer.querySelector('input[name="gameAccount"]');
                    var bidIncrementElement = parentContainer.querySelector('input[name="bidIncrement"]');
                    var imageElement = parentContainer.querySelector('img');

                    // Check if all necessary elements exist
                    if (exteriorElement && sellTimeElement && priceElement && gameAccountElement && imageElement) {
                        var exterior = exteriorElement.value;
                        var sellTime = sellTimeElement.value;
                        var price = priceElement.value;
                        var gameAccount = gameAccountElement.value;
                        var bidIncrement = bidIncrementElement.value;

                        // Get the image name
                        var skinName = imageElement.getAttribute('src');
                        skinName = skinName.split('/').pop().split('.')[0];

                        // Perform further actions with the input values
                        console.log("Exterior: " + exterior);
                        console.log("Sell Time: " + sellTime);
                        console.log("Price: " + price);
                        console.log("Game Account: " + gameAccount);
                        console.log("Skin Name: " + skinName);
                        console.log("Bid Increment: " + bidIncrement);

                        // Create data object to send to the backend
                        var data = {
                            exterior: exterior,
                            sellTime: sellTime,
                            gameAccount: gameAccount,
                            price: price,
                            skinName: skinName,
                            bidIncrement: bidIncrement
                        };

                        $.ajax({
                            url: '/In_Game_Items_Trading/InsertAuctionController',
                            type: 'POST',
                            data: data,
                            success: function (data) {
                                var row = document.getElementById("sell-list-content");
                                row.innerHTML = data + row.innerHTML;
                                userSellItemsAmount++;
                                if (userSellItemsAmount >= 5) {
                                    userSellItemsAmount = 5;
                                }
                                // Update the sell list length in local storage
                                localStorage.setItem("userSellItemsAmount", userSellItemsAmount);

                                updateButtons();
                            },
                            error: function () {
                                console.log('Error occurred during AJAX request');
                            }
                        });

                    } else {
                        console.log("Error: Required elements not found in the parent container.");
                    }
                } else {
                    console.log("Error: Parent container not found for the clicked button.");
                }
            }

            // Update the buttons based on the sell list state
            function updateButtons() {
                var buttons = document.querySelectorAll(".summit-button .item-card-button");
                for (var i = 0; i < buttons.length; i++) {
                    var button = buttons[i];
                    if (userSellItemsAmount < 5) {
                        button.innerText = "Create Auction";
                        button.setAttribute("onclick", "addToSellList(event)");
                    } else {
                        button.innerText = "Auction created limit reached!";
                        button.removeAttribute("onclick");
                    }
                }
            }

            // Call the updateButtons function when the page loads
            window.addEventListener('load', updateButtons);
        </script>
    </body>

</html>



