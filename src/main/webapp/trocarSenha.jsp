<!--**
 *
 * @author paulo.bezerra
 *-->

<%@page import="java.sql.ResultSet"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="topodapagina.css" rel="stylesheet">
        <link href="css/customAlert.css" rel="stylesheet">


    <form name = "trocarsenha" id='trocarsenha' action="${pageContext.request.contextPath}/trocarSenha" method="POST" >

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <title>Redefinir Senha</title>


    </head>
    <body id="page-top">
        <form>
            <div id="includedContent"></div>

            <div align ="center">
                <br>

                <div class="container">
                    <div class="py-5 text-center">
                        <h2>Redefina sua Senha</h2>
                    </div>
                </div>

                <div class="col-md-8 order-md-1">

                    <div class="mb-3">
                        <label>Nome Completo</label>
                        <div class="input-group">
                            <input readonly name="nomeCliente" type="text" class="form-control" id="nomecomp" placeholder="" value="${nomeCliente}" name="nomeCliente" required>
                            <div class="invalid-feedback">
                                Primeiro nome necessário
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label>Email <span class="text-muted">(Required)</span></label>
                        <input readonly name ="emailCliente" type="email" class="form-control" id="emailuser" placeholder="you@mci-group.com" value ="${emailCliente}">
                        <div class="invalid-feedback">
                            Email invalido
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password">Senha</label>
                        <input name ="password" type="password" class="form-control" id="password" placeholder="Password" autofocus value="" required>
                        <div class="invalid-feedback">
                            Favor inserir o password.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="password">Confirmar Senha</label>
                        <input name ="confirmpassword" type="password"  class="form-control" id="confirmpassword" placeholder="Confirm Password" value="" required>
                        <div class="invalid-feedback">
                            Favor inserir o password.
                        </div>
                    </div>

                    <hr class="mb-4">
                    <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                                return ConfirmPassword();
                            }" name = "trocarsenha"><span data-feather="save"></span> Confirmar</button> 
                            <input type="hidden" name='idCliente' value='${idCliente}'>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
            <p class="mt-5 mb-3 text-muted">&copy; Orbis Eu Vou</p>
            </footer>
            </div>



        </form>




        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../../../assets/js/vendor/popper.min.js"></script>
        <script src="../../../../dist/js/bootstrap.min.js"></script>
        <script src="../../../../assets/js/vendor/holder.min.js"></script>
        <script src="js/confirmarsenha.js"></script>
        <script src="js/customAlert.js"></script>

        <script>
                        // Example starter JavaScript for disabling form submissions if there are invalid fields
                        (function () {
                            'use strict';

                            window.addEventListener('load', function () {
                                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                                var forms = document.getElementsByClassName('needs-validation');

                                // Loop over them and prevent submission
                                var validation = Array.prototype.filter.call(forms, function (form) {
                                    form.addEventListener('submit', function (event) {
                                        if (form.checkValidity() === false) {
                                            event.preventDefault();
                                            event.stopPropagation();
                                        }
                                        form.classList.add('was-validated');
                                    }, false);
                                });
                            }, false);
                        }
                        )();


        </script>
        <script>function ConfirmPassword() {

    var trocarsenha = document.getElementById('trocarsenha');

    var password = document.getElementById('password').value;
    var confirmpassword = document.getElementById('confirmpassword').value;

    if (password.length < 5) {

        alert("Senha muito curta");
        document.getElementById("password").focus();
        return false;

    } else if (password !== confirmpassword) {

        alert("Senhas não combinam");

        document.getElementById("password").focus();
        return false;


    } else {
        var answer = confirm("Confirma seus dados?");
        if (answer == true) {
            trocarsenha.submit();
        }
    }


}</script>
    </body>
</html>
