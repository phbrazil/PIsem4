<!--**
 *
 * @author paulo.bezerra
 *-->

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
<!DOCTYPE html>
<html>
    <head>
        <style>
            .button {
                background-color: white;
                border: none;
                color: black;
                padding: 8px 16px;
                text-align: center;
                font-size: 16px;
                margin: 4px 2px;
                opacity: 0.6;
                transition: 0.3s;
                display: inline-block;
                text-decoration: none;
                cursor: pointer;
            }

            .button:hover {opacity: 2}
        </style>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />


        <!-- Custom styles for this template -->
        <link href="css/topodapagina.css" rel="stylesheet">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <title>Consultar Projeto</title>
    </head>
    <body id="page-top" style="background: #dcdee4">

    <%@include  file="navbarTest.jsp"%>
    
        <br>
        <form name = "consultaPacote" action="${pageContext.request.contextPath}/consulta" method="POST" >

            <div align ="center">
                <br>
                <br>

                <h1 class="text-muted">Consultar Pacote</h1>

                <h5 class="mb-0">
                    <span class="text-primary">Digite o código ou nome do Pacote</span>
                </h5>      
                <br>

                <div class="col-md-5 order-md-1">

                    <input class="form-control form-control-lg form-control-borderless" name="valorbusca" id ='valorbusca' type="search"  required>

                    <div class="invalid-feedback" style="width: 100%;">
                        Valor obrigatório.
                    </div>
                    <br>
                    <button  type="submit" name = "pesquisar" class = "button" ><strong>Pesquisar <img src="img/search.png" width="25" height="25"></strong></button>

                </div>        

                <footer class="my-5 pt-5 text-muted text-center text-small">
                    <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
                    <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
                    <a href="termo"><span class="text-primary">Política de Uso</span></a>
                    <p class="mb-0">&copy; Orbis Eu Vou</p>
                </footer>
            </div>
    </body>
    <script type="text/javascript" 
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script src="js/jquery.autocomplete.js"></script>
    <script>
        $("#projectname").autocomplete("getdataProjetos.jsp");
    </script>
</html>
