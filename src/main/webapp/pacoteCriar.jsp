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


        <title>Criar Pacote</title>

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

        <form name = "pacote"  id = "pacote" action="${pageContext.request.contextPath}/criarPacote" method="POST">

            <br>
            <div align ="center">
                <div align = "center" >
                    <h4>Criar Pacote</h4>
                </div>
                <br>
                <h5 class="mb-0">
                    <span class="text-primary">Dados do Pacote</span>
                </h5>
                <br>

                <div class="col-md-8 order-md-1">
                    <div class="row">
                        <div class="col-md-5 mb-3">
                            <label>Data da Viagem</label>
                            <div class="input-group" title="Data da Viagem">
                                <input data-toggle="tooltip" title="Data da Viagem" data-placement="left" oninput="TamanhoData()" type="date" autocomplete="off" class="form-control" id="dthevento" name="dthevento"  required>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Participantes</label>
                            <div class="input-group">
                                <input data-toggle="tooltip" title="Quantidade máxima de participantes" data-placement="right" name="qtdmax" autocomplete="off" type="number" class="form-control" id="qtdmax" value="0">
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Valor</label>
                            <input name = "valor" data-toggle="tooltip" title="Valor do pacote" data-placement="left" type="text" class="form-control" id="valor" value = "0,00" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Local de saída</label>
                            <div class="input-group">
                                <input data-toggle="tooltip" title="Local de Saída" data-placement="right" name="localsaida" autocomplete="off" type="text" class="form-control" id="localsaida">
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Local de destino</label>
                            <div class="input-group">
                                <input data-toggle="tooltip" title="Local de Destino" data-placement="right" name="localdestino" autocomplete="off" type="text" class="form-control" id="localdestino">
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label>Roteiro da Viagem</label>
                            <div class="input-group">
                                <textarea data-toggle="tooltip" title="Roteiro da Viagem" data-placement="right" name="localsaida" autocomplete="off" type="text" class="form-control" id="localsaida"></textarea>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-3 mb-3">
                            <label>Pacote ativo?</label>
                            <select name = "pctAtivo" class="custom-select d-block w-100" id="finanstatus"  required>
                                <option>Sim</option>
                                <option>Não</option>
                            </select>
                        </div> 
                        <div class="col-md-9 mb-3">

                            <h5 class="mb-0">
                                <span class="text-primary">Fotos</span>
                            </h5>                    
                            <form action="upload" method="post" enctype="multipart/form-data">

                                <input type="file" name="file" id="i_file" required />

                                <input type="submit" value="Enviar" id="i_submit"  />
                                <br>

                                <input type ="text" style="border: none; color: red; width: 100%" id="filestatus" readonly>

                            </form>  
                        </div>

                    </div>
                    <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                                return confirmCompletePacote();
                            }" name = "gravarprojeto"><span data-feather="save"></span> Salvar Pacote</button>

                </div>

                <footer class="my-5 pt-5 text-muted text-center text-small">
                    <p class="mb-0">&copy; Orbis Eu Vou</p>
                </footer>

        </form>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="js/tamanhodata"></script>
        <script src="js/searchSuggestProjectname.js"></script>
        <script src="js/searchSuggestProjectCode.js"></script>
        <script src="js/confirmCompletePacote.js"></script>
        <script src="js/formatarMoeda.js"></script>


        <script src="js/jquery.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <script>
                        $(document).ready(function () {
                            $('[data-toggle="tooltip"]').tooltip();
                        });
        </script>

        <script>
            $("#projectname").autocomplete("getdataProjetos.jsp");
        </script>

        <script>

            $("#contatomci").autocomplete({
                source: $("#contatomci").autocomplete("getdataContatoMCI.jsp")});

            function naBaseContato(val) {
                var source = $("#contatomci").autocomplete("getdataContatoMCI.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('contatomci').value = "";
                        document.getElementById('contatomci').placeholder = "Contato não cadastrado, solicitar inclusão";

                    }
                }
            }
        </script>
        <script>

            $("#mcistdcliname").autocomplete({
                source: $("#mcistdcliname").autocomplete("getdataClientes.jsp")});

            function naBase(val) {
                var source = $("#mcistdcliname").autocomplete("getdataClientes.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('mcistdcliname').value = "";
                        document.getElementById('mcistdcliname').placeholder = "Cliente não cadastrado, solicitar inclusão";
                    }
                }
            }


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

    </body>
</html>
