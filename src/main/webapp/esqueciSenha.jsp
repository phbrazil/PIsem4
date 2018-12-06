<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>

<!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Acessar Orbis</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">
    </head>

    <body class="text-center" style="background-color: white;">
        <form class="form-signin" id='redefinir' action="esqueciSenha"  method="POST">
            <style>
                img{
                    max-width: 100%;
                    /*border: 20px solid #ff0080;
                    padding: 20px;*/

                }

            </style>

            <br>
            <br>
            <br>
            <img class="mb-4" src="img/orbis_logo.png" alt="logo orbis">
            <h5 class="mb-0">Esqueci minha Senha
            </h5>
            <br>
            <label for="inputEmail" class="sr-only">Seu Email</label>
            <input type="email" autocomplete="off" id="emailCliente" onblur="naBase(this.value)" class="form-control" placeholder="Insira seu Email" name = "emailCliente" required autofocus>
            <button class="btn btn-lg btn-secondary btn-block" type="submit">Redefinir Senha</button>
            <p></p>


            <p class="mt-5 mb-3 text-muted">&copy; Orbis Eu Vou</p>
        </form>
    </body>

    <script src="js/jquery.js"></script>
    <script src="js/jquery.autocomplete.js"></script>


    <script>

                $("#emailCliente").autocomplete({
                    source: $("#emailCliente").autocomplete("getdataEmail.jsp")});

                function naBase(val) {
                    var source = $("#emailCliente").autocomplete("getdataEmail.jsp");

                    var length = source.length;
                    for (var i = 0; i < length; i++) {
                        if (source[i] != val) {
                            //document.getElementById('emailCliente').value = "";
                            //document.getElementById('status').value = "Email não encontrado";
                        }
                    }
                }


    </script>


</html>
