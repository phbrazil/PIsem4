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
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Gerenciar Pacotes</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/round-about.css" rel="stylesheet">

    </head>

    <body style="background: #dcdee4">

        <!-- Navigation -->
  <%@include  file="navbarTest.jsp"%>
  
        <br>
        <br>
        <br>

        <!-- Page Content -->
        <div class="container">

            <!-- Team Members Row -->
            <div class="row">
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="pacoteCriar.jsp">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/criarPacote.png" alt="">
                        <h3>Criar Pacotes
                        </h3>
                    </a></div>
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="consultaPacoteEditar.jsp">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/editPacote.png" alt="">
                        <h3>Alterar Pacotes
                        </h3>
                    </a></div>
                <!--div class="col-lg-2 col-sm-6 text-center mb-4">
                    <img class="rounded-circle img-fluid d-block mx-auto" src="img/deletePacote.png" alt="">
                    <h3>Excluir Pacotes
                    </h3>
                </div-->
                <div class="col-lg-2 col-sm-6 text-center mb-4">
                    <img class="rounded-circle img-fluid d-block mx-auto" src="img/reportsPacotes.jpeg" alt="">
                    <h3>Relatórios
                    </h3>
                </div>

            </div>

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
            <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
            <a href="termo"><span class="text-primary">Política de Uso</span></a>
            <p class="mb-0">&copy; Orbis Eu Vou</p>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
