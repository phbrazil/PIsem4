<!--**
 *
 * @author paulo.bezerra
 *-->

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
<html>
    <head>
        <!-- Bootstrap core CSS -->
        <!--link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="css/buttondelete.css">
        <link rel="stylesheet" type="text/css" href="css/gravar.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/collapse_button.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="topodapagina.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">


        <title>Criar Pacote</title>

    </head>
    <body id="page-top" style="background: #fff">

   <%@include  file="navbarTest.jsp"%>




        <style>

            span{
                position:relative;
                margin-right:-20px
            }
            input[type='number']{
                padding-left:20px;
                text-align:left;
            }


        </style>



    </body>





    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-0">&copy; Orbis, eu vou!</p>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="js/tamanhodata"></script>
    <script src="js/searchSuggestProjectname.js"></script>
    <script src="js/searchSuggestProjectCode.js"></script>
    <script src="js/confirmPacote.js"></script>
    <script src="js/formatarMoeda.js"></script>


    <script src="js/jquery.js"></script>
    <script src="js/jquery.autocomplete.js"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/customAlert.js"></script>
    <script src="js/tamanhoArquivo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script>

                    $("#localdestino").autocomplete({
                        source: $("#localdestino").autocomplete("getdataCidades.jsp")});

                    function naBaseDestino(val) {
                        var source = $("#localdestino").autocomplete("getdataCidades.jsp");

                        var length = source.length;
                        for (var i = 0; i < length; i++) {
                            if (source[i] != val) {
                                document.getElementById('localdestino').value = "";
                                document.getElementById('localdestino').placeholder = "Destino não cadastrado, solicitar inclusão";
                            }
                        }
                    }


    </script>
    <script>

        $("#localsaida").autocomplete({
            source: $("#localsaida").autocomplete("getdataCidades.jsp")});

        function naBaseSaida(val) {
            var source = $("#localsaida").autocomplete("getdataCidades.jsp");

            var length = source.length;
            for (var i = 0; i < length; i++) {
                if (source[i] != val) {
                    document.getElementById('localsaida').value = "";
                    document.getElementById('localsaida').placeholder = "Destino não cadastrado, solicitar inclusão";
                }
            }
        }


    </script>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>



    <script src="js/feather.min.js"></script>
    <script>
        feather.replace()
    </script>

    <script>
        $(function () {
            $('#valor').maskMoney();
        });
    </script>
    <script>
        $('#choose-file').inputFileText({
            text: 'Selecione as imagens'
        });

    </script>

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
        })();
    </script>



</html>
