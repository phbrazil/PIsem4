<!--**
 *
 * @author paulo.bezerra
 *-->
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

    </head>

    <body class="text-center" style="background-color: white;">
    <form class="needs-validation" novalidate name = "login"  id = "login" action="${pageContext.request.contextPath}/Login" method="POST">
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
            <h5 class="mb-0">Acessar
                <span style = "color: lightblue">Orbis Eu Vou</span>
            </h5>
            <br>
            <label for="inputEmail" class="sr-only">Email</label>
            <input type="email" autocomplete="off" id="inputEmail" class="form-control" placeholder="Email address" name = "username" required autofocus>
            <label for="inputPassword" class="sr-only">Senha</label>
            <input type="password" autocomplete="off" id="inputPassword" class="form-control" placeholder="Password" name = "password" required>
            <button class="btn btn-lg btn-secondary btn-block" type="submit">Entrar</button>
            <p></p>
            <label>
                <a href ="Modal?mensagem=Favor enviar um email para <strong>paulo.bezerra@mci-group.com</strong>&path=index.jsp">Esqueci a senha</a>
            </label>

            <p class="mt-5 mb-3 text-muted">&copy; Orbis Eu Vou</p>
        </form>
    </body>


</html>
