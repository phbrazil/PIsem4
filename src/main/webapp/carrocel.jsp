<%@page import="orbis.model.pacote.tbPacote"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="orbis.DAO.pacote.listarPacotes"%>
<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <title>Carrocel</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--script type="text/javascript" 
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script-->

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>


    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        * {box-sizing: border-box;}

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        /* Add a background color when the inputs get focus */
        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        button:hover {
            opacity:1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
            float: left;
            width: 50%;
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: #474e5d;
            padding-top: 50px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 100%; /* Could be more or less, depending on screen size */
        }

        /* Style the horizontal ruler */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* The Close Button (x) */
        .close {
            position: absolute;
            right: 35px;
            top: 15px;
            font-size: 40px;
            font-weight: bold;
            color: #f1f1f1;
        }

        .close:hover,
        .close:focus {
            color: #f44336;
            cursor: pointer;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
        }
    </style>

        <div id="demo" class="carousel slide col-10 align-middle" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>
            <form  name = "destinobusca"  id = "destinobusca" action="${pageContext.request.contextPath}/pacote" method="GET">
                <!-- The slideshow -->
                <div class="carousel-inner" style='width: 80%; height: 80%'>
                    <div class="carousel-item active">

                        <a href="#"><img src="img/destino1.jpg" alt="Porto Seguro" ></a>
                        <input type ='hidden' name ='destino' value='1'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino2.JPG" alt="Angra dos Reis" ></a>
                        <input type ='hidden' name ='destino' value='2'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino3.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino4.jpg" alt="Capitólio"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino5.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino6.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino7.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino8.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino9.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                    <div class="carousel-item">
                        <a href="#"><img src="img/destino10.jpg" alt="São Tomé das Letras"></a>
                        <input type ='hidden' name ='destino' value='3'>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
        </div>

</html>
