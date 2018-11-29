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
            
            <div class="row" style="width: 90%; height: 90%;">

                <%
                    List<tbVenda> compras = (List<tbVenda>) request.getAttribute("minhasCompras");
                    int linha = 1;

                    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                            new Locale("pt", "BR"));

                    if (compras.size() > 0) {

                        for (Iterator iterator = compras.iterator(); iterator.hasNext();) {
                            tbVenda compra = (tbVenda) iterator.next();


                %>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100">
                        <a href="pacote?destino=<%=compra.getIdpacote()%>"><img class="card-img-top" src="https://picsum.photos/1200/600/?random" alt="destino"></a>
                        <input type ='hidden' name ='destino' value="<%=compra.getIdpacote()%>">
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="pacote?destino=<%=compra.getIdpacote()%>" style="text-decoration: none">Ver Detalhe</a>
                            </h4>
                            <h5>Valor do Pacote: <%=formatoMoeda.format(compra.getTotal())%></h5>
                            <h5>Data da compra: <%=compra.getDthvenda()%></h5>
                            <h5>Protocolo: <%=compra.getId()%></h5>
                            <h5>Tipo Pagamento: <%=compra.getTipoPagamento()%></h5>
                        </div>
                    </div>
                </div>

                <%
                        linha++;

                    }
                } else {

                %>

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
