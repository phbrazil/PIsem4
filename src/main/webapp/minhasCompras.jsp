<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="orbis.DAO.pacote.listarImagens"%>
<%@page import="orbis.model.venda.tbVenda"%>
<%@page import="orbis.model.pacote.tbPacote"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="orbis.DAO.pacote.listarPacotes"%>
<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String userAgent = request.getHeader("user-agent");

    HttpSession sessao = request.getSession();

    Integer idUser = (Integer) sessao.getAttribute("idcliente");
    String nomeUser = (String) sessao.getAttribute("nomeUser");
    Integer idgrupo = (Integer) (sessao.getAttribute("idgrupo"));

    boolean mobile = false;
    if (userAgent.toUpperCase().contains("IPHONE") || userAgent.toUpperCase().contains("ANDROID")
            || userAgent.toUpperCase().contains("MOBILE")) {
        mobile = true;
    } else {
        mobile = false;

    }
    sessao.setAttribute("mobile", mobile);

%>

<head>
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/site.webmanifest">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">

    <title>Orbis Eu Vou</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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




    <script>
        // Get the modal
        var modal = document.getElementById('id01');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

<body style="background: #dcdee4">

    <%@include  file="navbarTest.jsp"%>

    <form  name = "pacote"  id = "buscar" action="${pageContext.request.contextPath}/pacote" method="POST">


        <div align='center' >

            <div class="py-5 mt-5 text-center">
                <h2 class="text-muted">Minhas Compras</h2>
            </div>

            <div class="row">

                <%
                    listarImagens listarImagens = new listarImagens();

                    List<tbVenda> vendas = (List<tbVenda>) request.getAttribute("minhasCompras");
                    List<tbPacote> pacotes = (List<tbPacote>) request.getAttribute("pacotes");

                    List<tbImagens> imagens;

                    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                            new Locale("pt", "BR"));

                    if (pacotes.size() > 0) {

                        //for (Iterator iterator = pacotes.iterator(); iterator.hasNext();) {
                        for (int i = 0; i < pacotes.size(); i++) {
                            tbVenda venda = (tbVenda) vendas.get(i);
                            imagens = listarImagens.listar(venda.getIdpacote());


                %>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div id="carouselExampleControls<%=i%>" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <%for (int j = 0; j < imagens.size(); j++) {
                                    String action = "";
                            %>

                            <%if (j == 0) {
                                    action = "active";

                                } else {
                                    action = "";
                                }
                            %>
                            <div id='slide<%=j%>' class="carousel-item <%=action%>">
                                <a href="pacote?destino=<%=venda.getIdpacote()%>" ><img class="card-img-top" style='width: 350px; height: 200px' src="<%=pacotes.get(i).getImagePath() + imagens.get(j).getNomeImagem()%>" alt="destino"></a>
                                <input type ='hidden' name ='destino' value="<%=venda.getIdpacote()%>">
                            </div>
                            <%}%>

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls<%=i%>" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls<%=i%>" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="pacote?destino=<%=venda.getIdpacote()%>" style="text-decoration: none"><%=pacotes.get(i).getLocalDestino()%></a>
                        </h4>
                        <h5>Valor total: <%=formatoMoeda.format(venda.getTotal())%></h5>
                        <h5><strong><%=venda.getIngressos()%></strong> ingressos comprados</h5>
                        <p class="card-text">Data compra: <%=venda.getDthvenda()%></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>
                </div>

                <%
                        imagens = null;

                    }
                } else {%>

                <style>
                    .center {
                        margin: auto;
                        width: 60%;
                        border: 3px solid #73AD21;
                        padding: 10px;
                    }
                </style>
                <div class='center'>
                    <h3 class="text-muted">Nenhuma compra efetuada</h3>
                    <button onclick="{
                                location = 'index.jsp';
                            }" style="width:auto;">Página inicial</button>    
                </div>
                <%}%>
            </div>

        </div>
    </form>


    <footer class="my-5 pt-5 text-muted text-center text-small">
        <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
        <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
        <a href="termo"><span class="text-primary">Política de Uso</span></a>
        <p class="mb-0">&copy; Orbis Eu Vou</p>
    </footer>

    <script src="js/confirmarsenha.js"></script>
    <script src="js/mascaraCNPJ.js"></script>
    <script src="js/confirmarsenha.js"></script>


</html>
