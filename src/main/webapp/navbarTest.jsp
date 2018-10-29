
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>Opportunity</title>

        <!-- nao sei pq nao funciona no bootstrap 4-->
        <!-- Bootstrap core CSS -->
        <link href="https://getbootstrap.com/docs/3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="navbar-fixed-top.css" rel="stylesheet">

    </head>
    <style type="text/css">
        .cores {
            color: white !important;
            background-color: #ff0080 !important;

        }
        .cores a:hover {background-color: #000000 !important;}

    </style>


    <body>

        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top cores">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar js-scroll-trigger fonte" style="text-decoration:none; color: white;" href="Home.jsp">
                        <span class="d-block d-lg-block"><img style ="width: 20%;" src = "img/mci_brazil.png"></span>
                    </a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="fonte"><a href="Home.jsp" style='color: white;'>Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style='color: white;'>Consultas <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="ConsultaProjeto.jsp" style='color: white; background-color: #ff0080;'>Projeto (BL)</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ConsultaCliente.jsp" style='color: white; background-color: #ff0080;'>Cliente</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ConsultaProspect.jsp" style='color: white;background-color: #ff0080;'>Prospect</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ConsultaSuspect.jsp" style='color: white;background-color: #ff0080;'>Suspect</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style='color: white;'>Cadastrar <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="CadastrarProjeto.jsp" style='color: white; background-color: #ff0080;'>Projeto (BL)</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="CadastrarCliente.jsp"style='color: white; background-color: #ff0080;'>Cliente</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="CadastrarProspect.jsp" style='color: white;background-color: #ff0080;'>Prospect</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="CadastrarSuspect.jsp" style='color: white;background-color: #ff0080;'>Suspect</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style='color: white;'>Gerenciamento <span class="caret"></span></a>
                            <ul class="dropdown-menu fonte">
                                <li><a href="FiltroBL.jsp" style='color: white;background-color: #ff0080;'>Listar Projetos (BL)</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ListarClientesGeral" style='color: white;background-color: #ff0080;'>Listar Cliente</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ListarProspectsGeral" style='color: white;background-color: #ff0080;'>Listar Prospect</a></li>
                                <li role="separator" class="divider" style='background-color: #ff0080;'></li>
                                <li><a href="ListarSuspectsGeral" style='color: white;background-color: #ff0080;'>Listar Suspect</a></li>
                            </ul>
                        </li>
                        <li class="fonte"><a href="MemoBL.jsp" style='color: white;'>Dicas</a></li>


                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <!--li><a href="../navbar-static-top/">Static top</a></li-->
                        <li class="fonte"><a href="Logout.jsp" style='color: white;'>Sair <span class="sr-only">(current)</span></a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="assets/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="assets/jquery.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
