<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javaee.bitlab.db.models.Task" %>
<%@ page import="com.javaee.bitlab.db.models.Item" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>bitlab shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
          crossorigin="anonymous">
    <style>
        body {
            padding: 0;
        }

        .navbar {
            display: flex;
            padding: 20px;
            justify-content: space-around;
            background-color: rgba(211, 225, 211, 0.57);
            color: #000000;
        }

        a {
            text-decoration: none;
            color: #000000;
        }

        .navbuttons {
            margin-left: 10px;
        }

        .items {
            padding-left: 80px;
            padding-right: 80px;
            padding-top: 30px;
            display: grid;
            grid-template-columns: 33% 33% 34%;
            column-gap: 10px;
            row-gap: 25px;
        }

    </style>
</head>
<body>
<div class="navbar">
    <div>
        <strong>BITLAB SHOP</strong>
    </div>
    <div>
        <a class="navbuttons" href="/">Top Sales</a>
        <a class="navbuttons" href="/">New Sales</a>
        <a class="navbuttons" href="/">By Category</a>
        <a class="navbuttons" href="/login">Sign In</a>
    </div>
</div>
<div class="container" style="margin-top: 60px">
    <%
        ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");
    %>
    <div class="content">
        <div class="main-text">
            <center>
                <div><h1>Welcome TO BITLAB SHOP</h1></div>
                <div><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p></div>
            </center>
        </div>
        <div class="main-items">
            <div class="items">
                <% for (Item item : items) {%>
                <div class="card bg-light mb-3"
                     style="max-width: 18rem;box-shadow: 2px 2px 2px 2px rgba(0.6, 0.6, 0.6, 0.6);">
                    <div class="card-header">
                        <center><h2><%out.print(item.getName());%></h2></center>
                    </div>
                    <div class="card-body">
                        <center>
                            <h3 class="card-title"><%out.print(item.getPrice());%>$</h3>
                            <div><%out.print(item.getDescription());%></div>
                        </center>
                        <button class="btn btn-success" style="width: 16rem;margin-top: 10px">detail</button>
                    </div>
                </div>
                <%}%>
            </div>

        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>