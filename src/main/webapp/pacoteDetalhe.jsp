
<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="java.util.List"%>
<%@page import="orbis.DAO.pacote.listarImagens"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="orbis.model.pacote.tbPacote"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="site de pacotes de excursao senac">
        <meta name="author" content="paulo bezerra, lucas medeiros, andre pereira">

        <title>Orbis Eu Vou</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-item.css" rel="stylesheet">

    </head>

    <body class="bg-light">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Início</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Sobre</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Mais pacotes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contato</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%
            tbPacote pacote = (tbPacote) request.getAttribute("pacote");

            listarImagens listarImagens = new listarImagens();

            List<tbImagens> imagens;

            imagens = listarImagens.listar(pacote.getIdPacote());

            NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                    new Locale("pt", "BR"));

            Boolean mobile = (Boolean) session.getAttribute("mobile");

        %>
        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <%if (mobile == false) {%>
                <div class="col-lg-3">
                    <h1 class="my-4">Orbis</h1>
                    <div class="list-group">
                        <a href="#" class="list-group-item active">Category 1</a>
                        <%for (int i = 2; i < 10; i++) {
                        %>
                        <a href="#" class="list-group-item">Category <%=i%></a>
                        <%}%>
                    </div>
                </div>
                <%}%>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">

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
                                <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
                                4.0 stars
                                <input type="hidden" value= "<%=pacote.getIdPacote()%>" name="idpacote">
                                <input type="submit" value= "Comprar Agora" style='float: right; ' class="btn btn-success">

                            </div>

                        </div>
                        <!-- /.card -->

                        <div class="card card-outline-secondary my-4">
                            <div class="card-header">
                                Reviews do Produto
                            </div>
                            <div class="card-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <a href="#" class="btn btn-success">Deixe um comentário</a>
                            </div>
                        </div>

                    </form>
                    <!-- /.card -->

                </div>


                <!-- /.col-lg-9 -->

            </div>

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Orbis Eu Vou</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
