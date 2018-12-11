
<%@page import="orbis.model.comentario.tbComentario"%>
<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="java.util.List"%>
<%@page import="orbis.DAO.pacote.listarImagens"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="orbis.model.pacote.tbPacote"%>
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
<html lang="en">

    <head>

        <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
        <link rel="manifest" href="favicon/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="site de pacotes de excursao senac">
        <meta name="author" content="paulo bezerra, lucas medeiros, andre pereira">

        <title>Orbis Eu Vou</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-item.css" rel="stylesheet">
        <link href="css/estrelas.css" rel="stylesheet">

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
                width: 80%; /* Full width */
                height: 80%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: window;
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

    </head>

    <body style="background: #dcdee4">

        <!-- Navigation -->
        <%@include  file="navbarTest.jsp"%>
        <%
            tbPacote pacote = (tbPacote) request.getAttribute("pacote");

            listarImagens listarImagens = new listarImagens();

            List<tbImagens> imagens;
            List<tbComentario> comentarios = (List<tbComentario>) request.getAttribute("listaComentario");

            imagens = listarImagens.listar(pacote.getIdPacote());

            NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                    new Locale("pt", "BR"));

            int nota1 = 4;
            int nota2 = 4;
            int nota3 = 4;
            int nota4 = 4;
            int nota5 = 4;

        %>
        <!-- Page Content -->
        <div class="container">
            <div class="col-lg-16">

                <form class = "modal-content" name = "checkOut"  id = "checkOut" action="${pageContext.request.contextPath}/checkOut" method="POST">
                    <div class="card mt-4">
                        <div class="col-lg-12 col-md-6 mb-4">
                            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                                        <a href="pacote?destino=<%=pacote.getIdPacote()%>" ><img class="card-img-top" style='width: 800px; height: 400px' src="<%=pacote.getImagePath() + imagens.get(j).getNomeImagem()%>" alt="destino"></a>
                                        <input type ='hidden' name ='destino' value="<%=pacote.getIdPacote()%>">
                                    </div>
                                    <%}%>

                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="pacote?destino=<%=pacote.getIdPacote()%>" style="text-decoration: none"><%=pacote.getLocalDestino()%></a>
                                </h4>
                                <h5><%=formatoMoeda.format(pacote.getValor())%></h5>
                                <p class="card-text"><%=pacote.getRoteiro()%></p>
                            </div>
                            <% double notaMedia = (Double) request.getAttribute("notaMedia");
                                int notaMedia1 = 4;
                                int notaMedia2 = 4;
                                int notaMedia3 = 4;
                                int notaMedia4 = 4;
                                int notaMedia5 = 4;
                                for (int j = 1; j <= notaMedia; j++) {
                                    if (j == 1) {
                                        notaMedia1 = 3;
                                    }
                                    if (j == 2) {
                                        notaMedia2 = 3;

                                    }
                                    if (j == 3) {
                                        notaMedia3 = 3;

                                    }
                                    if (j == 4) {
                                        notaMedia4 = 3;

                                    }
                                    if (j == 5) {
                                        notaMedia5 = 3;
                                    }

                                }
                            %>

                            <span class="text-warning">&#973<%=notaMedia1%>; &#973<%=notaMedia2%>; &#973<%=notaMedia3%>; &#973<%=notaMedia4%>; &#973<%=notaMedia5%>;</span>
                            ${notaMedia} estrelas
                            <input type="hidden" value= "<%=pacote.getIdPacote()%>" name="idpacote">
                            <input type="submit" value= "Comprar Agora" style='float: right; ' class="btn btn-success">

                        </div>

                    </div>
                    <!-- /.card -->

                    <div class="card card-outline-secondary my-4">
                        <div class="card-header">
                            Reviews do Pacote
                        </div>
                        <div class="card-body">
                            <%for (int i = 0; i < comentarios.size(); i++) {%>
                            <p><%=comentarios.get(i).getComentario()%></p>
                            <small class="text-muted">Postado por <%=comentarios.get(i).getNome()%> em <%=comentarios.get(i).getDthComentario()%></small>
                            <%for (int j = 1; j <= comentarios.get(i).getNota(); j++) {
                                    if (j == 1) {
                                        nota1 = 3;
                                    }
                                    if (j == 2) {
                                        nota2 = 3;

                                    }
                                    if (j == 3) {
                                        nota3 = 3;

                                    }
                                    if (j == 4) {
                                        nota4 = 3;

                                    }
                                    if (j == 5) {
                                        nota5 = 3;
                                    }

                                }
                            %>
                            <span class="text-warning">&#973<%=nota1%>; &#973<%=nota2%>; &#973<%=nota3%>; &#973<%=nota4%>; &#973<%=nota5%>;</span>
                            <hr>
                            <%}%>
                            <a href="#"  onclick="document.getElementById('comentarioModal').style.display = 'block'" class="btn btn-success">Deixe um comentário</a>

                        </div>
                    </div>

                </form>
                <!-- /.card -->



                <!-- /.col-lg-9 -->

            </div>

            <div id="comentarioModal" class="modal">
                <span onclick="document.getElementById('comentarioModal').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                <form class = "modal-content" name = "Comentario"  id = "comentario" action="${pageContext.request.contextPath}/Comentario" method="POST">
                    <div class="container">
                        <h1>Deixe seu comentário</h1>
                        <hr>

                        <label for="nome"><b>Nome</b></label>
                        <input type="text" autocomplete="off" placeholder="Exemplo: Wilson ou Dora" name="nome" id = 'nome' required>

                        <label for="email"><b>Email</b></label>
                        <input type="text" autocomplete="off" placeholder="Inserir Email" name="email" id='email' required>

                        <label for="comentario"><b>Comentário</b></label>
                        <textarea data-toggle="tooltip" title="Comentário" data-placement="right" name="comentario" autocomplete="off" type="text" class="form-control" required id="roteiro"></textarea>
                        <br>
                        <label for="comentario"><b><strong>Nota</strong></b></label>
                        <fieldset class="rating">
                            <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Demais - 5 estrelas"></label>
                            <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Muito legal - 4.5 estrelas"></label>
                            <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Bem bom - 4 estrelas"></label>
                            <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 estrelas"></label>
                            <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 estrelas"></label>
                            <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Meio ruim - 2.5 estrelas"></label>
                            <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Meio ruim - 2 estrelas"></label>
                            <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 estrelas"></label>
                            <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Ruim o tempo todo - 1 estrela"></label>
                            <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Nunca mais vou - 0.5 estrelas"></label>
                        </fieldset>
                        <br>
                        <br>

                        <input type="hidden" value= "${pacote.idPacote}" name="idpacote">

                        <div class="clearfix">
                            <button type="button" onclick="document.getElementById('comentarioModal').style.display = 'none'" class="cancelbtn">Cancelar</button>
                            <button type="submit" class="signupbtn">Salvar</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-light"  style="background-color: #b0cff1">
            <div class="container">
                <p class="m-0 text-center text-dark" >Copyright &copy; Orbis Eu Vou</p>
            </div>
            <!-- /.container -->
        </footer>

        <script>
            // Get the modal
            var modal = document.getElementById('comentarioModal');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
