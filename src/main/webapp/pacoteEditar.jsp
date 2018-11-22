<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="java.util.List"%>
<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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


        <title>Editar Pacote</title>

    </head>
    <body id="page-top">

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


        <br>
        <br>
        <br>

        <div align ="center">
            <div align = "center" >
                <h4>Editar Pacote</h4>
            </div>
            <br>
            <h5 class="mb-0">
                <span class="text-primary">Dados do Pacote</span>
            </h5>
            <br>
            <form id = 'foto' name = "deletarImagem" action="${pageContext.request.contextPath}/deletarImagem" method="POST"></form>
            <form enctype="multipart/form-data" class="needs-validation" novalidate name = "pacote"  id = "pacote" action="${pageContext.request.contextPath}/editar" method="POST"></form>


            <div class="col-md-8 order-md-1">
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label>Data da Viagem</label>
                        <div class="input-group" title="Data da Viagem">
                            <input form='pacote' data-toggle="tooltip" value="${pacote.dthevento}" title="Data da Viagem" data-placement="left" oninput="TamanhoData()" type="date" autocomplete="off" class="form-control" id="dthevento" name="dthevento"  required>
                        </div>
                        <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Participantes</label>
                        <div class="input-group">
                            <input form='pacote' data-toggle="tooltip" value="${pacote.qtdMax}" title="Quantidade máxima de participantes" data-placement="right" name="qtdmax" autocomplete="off" type="number" class="form-control" id="qtdmax" value="0" required>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Valor</label>
                        <input form='pacote' name = "valor" data-toggle="tooltip" value="${pacote.valor}" title="Valor do pacote" data-placement="left" type="text" class="form-control" id="valor" value = "0,00" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Local de saída</label>
                        <div class="input-group">
                            <input form='pacote' data-toggle="tooltip" value="${pacote.localSaida}" onblur="naBaseSaida(this.value)" title="Local de Saída" data-placement="right" name="localsaida" autocomplete="off" type="text" class="form-control" id="localsaida">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Local de destino</label>
                        <div class="input-group">
                            <input form='pacote' data-toggle="tooltip" value="${pacote.localDestino}" onblur="naBaseDestino(this.value)" title="Local de Destino" data-placement="right" name="localdestino" autocomplete="off" type="text" class="form-control" id="localdestino">
                        </div>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>Roteiro da Viagem</label>
                        <div class="input-group">
                            <textarea form='pacote' data-toggle="tooltip" title="Roteiro da Viagem" data-placement="right" name="roteiro" autocomplete="off" type="text" class="form-control" id="roteiro">${pacote.roteiro}</textarea>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-3 mb-3">
                        <label>Pacote ativo?</label>
                        <select form='pacote' name = "ativo" class="custom-select d-block w-100" id="ativo"  required>
                            <option>Sim</option>
                            <option>Não</option>
                        </select>
                    </div> 

                </div>
                <h5 class="mb-0">
                    <span class="text-primary">Fotos</span>
                </h5>                    
                <br>
                </form>    


                <%
                    List<tbImagens> imagens = (List<tbImagens>) request.getAttribute("imagens");
                %>
                <div class="row">
                    <%for (int i = 0; i < imagens.size(); i++) {%>
                    <div class="col-md-3 mb-3">
                        <img style="width: 200px; height: 100px" src="${pacote.imagePath}<%=imagens.get(i).getNomeImagem()%>"/>
                        <div class="btn-group">
                            <button form='foto' type ="submit" onclick="{
                                        return confirmDeleteFoto();
                                    }" id = "deletarFoto"  name = "id" value="" class="btn btn-sm"><img src="img/deletePacote.png" style="width: 25%; height: 25%"></button>

                        </div>
                        <input form="foto" type='hidden' name='idImagem' value='<%=imagens.get(i).getId()%>'>
                        <input form='foto' type='hidden' name='idpacote' value='<%=imagens.get(i).getIdPacote()%>'>
                    </div>

                    <%}%>
                </div>

                <label class="btn btn-primary">

                    <i class="fa fa-image"></i> Selecione as imagens<input type="file" name="file" id="i_file" multiple style="display: none;"  name="image">
                </label>
                <input type ="text" style="border: none; color: red; width: 100%" id="filestatus" readonly>

            </div>
            <button form='pacote' class="btn btn-lg btn-outline-success" id='i_submit' type="submit" onclick="{
                        return confirmPacote();
                    }" name = "gravarprojeto"><span data-feather="save"></span> Salvar Pacote</button>
            <input type='hidden' form='pacote' name='idpacote' value='${pacote.idPacote}'>

        </div>


    </body>





    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-0">&copy; Orbis Eu Vou</p>
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="js/tamanhodata"></script>
    <script src="js/searchSuggestProjectname.js"></script>
    <script src="js/searchSuggestProjectCode.js"></script>
    <script src="js/confirmDeleteFoto.js"></script>
    <script src="js/formatarMoeda.js"></script>


    <script src="js/jquery.js"></script>
    <script src="js/jquery.autocomplete.js"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/customAlert.js"></script>
    <script src="js/tamanhoArquivo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <script>

                window.onload = function () {

                    var valor = document.getElementById('valor');

                    document.pacote.valor.value = converteFloatMoeda(valor.value);

                }


    </script>


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
        function confirmPacote() {

            var pacote = document.getElementById('pacote');
            //var fsize = $('#i_file')[0].files[0].size;


            /*if (document.getElementById('dthevento').value != '' &&
             document.getElementById('localsaida').value != '' &&
             document.getElementById('localdestino').value != '' &&
             document.getElementById('valor').value != '' &&
             document.getElementById('roteiro').value != '' &&
             document.getElementById('qtdmax').value != '') {*/

            var answer = confirm("Confirma os dados do Pacote?");
            if (answer == true) {

                //do something if file size more than 1 mb (1048576)
                /*if (fsize > 10048576) {
                 //alert(fsize + " bites\nArquivo muito grande!");
                 document.getElementById('filestatus').value = "As fotos com " + fsize + " bytes são muito grandes";
                 return false;
                 } else {*/
                pacote.submit();

                /*}*/

            } else {
                return false;
            }
            /*} else {
             alert("Verificar os campos preenchidos")
             return false;
             }*/

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
