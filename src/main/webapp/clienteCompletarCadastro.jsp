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
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">

        <title>Cadastrar Cliente</title>

    </head>



    <body id="page-top">



        <form name = "completarCadastro" id ='completarCadastro' action="${pageContext.request.contextPath}/completarCadastro" method="POST">

            <br>

            <div align ="center">
                <div class="container">
                    <div align = "center" >
                        <h4 class="text-muted">Complete seu Cadastro</h4>
                    </div>
                    <br>
                    <h5 class="mb-0">
                        <span class="text-primary">Dados adicionais</span>
                    </h5>
                    <br>
                </div>
                <div class="row" style="width: 70%;">

                    <div class="col-md-2 mb-3">
                        <label>CEP</label>
                        <input name ="cep" autocomplete="off" type="text" class="form-control" id="cep"   placeholder="00000000" size="10" maxlength="8" onblur="pesquisacep(this.value);">
                        <div class="invalid-feedback">
                            CEP obrigatório
                        </div>
                    </div>

                    <div class="col-md-8 mb-3">
                        <label>Rua</label>
                        <input name ="rua" type="text" class="form-control" id="rua"  size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir a Rua
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>Número</label>
                        <input name ="numero" type="text" class="form-control" id="numero" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Numero
                        </div>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>Complemento</label>
                        <input name ="complemento" type="text" class="form-control" id="complemento" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Complemento
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Bairro</label>
                        <input name ="bairro" type="text" class="form-control" id="bairro" size="60" maxlength ="50">

                        <div class="invalid-feedback">
                            Favor inserir o Bairro
                        </div>
                    </div>

                    <div class="col-md-5 mb-3">
                        <label>Cidade</label>
                        <input name ="cidade" type="text" class="form-control" id="cidade" placeholder="Cidade" size = "40" maxlength ="50">
                        <div class="invalid-feedback">
                            Favor inserir a Cidade.
                        </div>
                    </div>
                    <div class="col-md-2 mb-3">
                        <label>State / UF</label>
                        <select name = "uf" class="custom-select d-block w-100" id="uf">
                            <option>AC</option>
                            <option>AL</option>
                            <option>AP</option>
                            <option>AM</option>
                            <option>BA</option>
                            <option>CE</option>
                            <option>DF</option>
                            <option>ES</option>
                            <option>GO</option>
                            <option>MA</option>
                            <option>MT</option>
                            <option>MS</option>
                            <option>MG</option>
                            <option>PA</option>
                            <option>PB</option>
                            <option>PR</option>
                            <option>PE</option>
                            <option>PI</option>
                            <option>RJ</option>
                            <option>RN</option>
                            <option>RS</option>
                            <option>RO</option>
                            <option>RR</option>
                            <option>SC</option>
                            <option>SP</option>
                            <option>SE</option>
                            <option>TO</option>
                        </select>

                        <div class="invalid-feedback">
                            Favor selecionar um Estado..
                        </div>

                    </div>

                </div>
                <hr class="mb-4">
                <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                            return confirmCadastroCliente();
                        }" name = "gravarcliente"><span data-feather="save"></span> Finalizar</button>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
                <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
                <a href="termo"><span class="text-primary">Política de Uso</span></a>
                <p class="mb-0">&copy; Orbis Eu Vou</p>
            </footer>

        </div>

    </form>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/CEP.js"></script>
    <script src="js/mascaraCNPJ.js"></script>
    <script src="js/jquery-1.2.6.pack.js"></script>
    <script src="js/jquery.maskedinput-1.1.4.pack.js"></script>
    <script src="js/confirmCadastroCliente.js"></script>
    <script src="js/jquery.autocomplete.js"></script>


    <!--script src="js/jquery.js"></script-->

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

    <script type="text/javascript">
        $(document).ready(function () {
            $("#cnpjcpf").mask("99.999.999/9999-99");
        });
    </script>

    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace();
    </script>
    <script>



        $("#cnpjcpf").autocomplete({
            source: $("#cnpjcpf").autocomplete("getdataCNPJ.jsp")});

    </script>
</body>
</html>
