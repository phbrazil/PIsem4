<!--**
 *
 * @author paulo.bezerra
 *-->
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">


        <style>
            .button {
                background-color: #33CCCC;
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                font-size: 16px;
                margin: 16px 8px;
                opacity: 0.6;
                transition: 0.3s;
                display: inline-block;
                text-decoration: none;
                cursor: pointer;
            }

            .button:hover {opacity: 1}
        </style>




        <title>Orbis </title>

    </head>
    <body id="page-top">

        <form name = "Logout" action="${pageContext.request.contextPath}/Logout" method="POST" >
            <div align ="center">
                <br>
                <br>
                <br>
                <br>



                <div class="col-md-5 order-md-1">


                    <input type="submit" name="logout" class="btn btn-lg btn-outline-success" value ="Continuar" >
                    <input type="submit" name="logout" class="btn btn-lg btn-outline-danger" value ="Sair" >

                </div>





                <footer class="my-5 pt-5 text-muted text-center text-small">
                    <p class="mb-1">&copy; MCI Brasil</p>

                </footer>
            </div>

        </form>




        <!-- Bootstrap core JavaScript
=== === === === === === === === === === === === === === === === == -- ><!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="../../../../assets/js/vendor/popper.min.js"></script>
        <script src="../../../../dist/js/bootstrap.min.js"></script>
        <script src="../../../../assets/js/vendor/holder.min.js"></script>
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


        <script>


            var mensagem = "${mensagem}"

            if (mensagem == "Produto não encontrado") {
                alert(mensagem)
            }
        </script>


    </body>
</html>
