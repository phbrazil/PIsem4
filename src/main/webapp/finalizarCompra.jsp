
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="orbis.model.pacote.tbPacote"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../../../favicon.ico">

        <title>Finalizar Compra</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="form-validation.css" rel="stylesheet">
    </head>

    <form class="needs-validation" novalidate name = "FinalizarCompra"  id = "finalizarvenda" action="${pageContext.request.contextPath}/FinalizarCompra" method="POST">
        <body class="bg-light">

            <div class="container">
                <div class="py-5 text-center">
                    <h2>Finalizar Compra</h2>
                </div>

                <%
                    tbPacote pacote = (tbPacote) request.getAttribute("pacote");

                    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                            new Locale("pt", "BR"));
                %>
                <div class="row">
                    <div class="col-md-4 order-md-2 mb-4">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Pacote</span>
                            <span class="badge badge-secondary badge-pill"><%=pacote.getIdPacote()%></span>
                        </h4>
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0"><%=pacote.getLocalDestino()%></h6>
                                    <small class="text-muted"><%=pacote.getLocalSaida()%></small>
                                </div>
                                <span class="text-muted"><%=formatoMoeda.format(pacote.getValor())%></span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between bg-light">
                                <div class="text-success">
                                    <h6 class="my-0">Bônus por fidelidade</h6>
                                    <small>EXEMPLO</small>
                                </div>
                                <span class="text-success">-R$5,00</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (BRL)</span>
                                <strong><%=formatoMoeda.format(pacote.getValor())%></strong>
                                <input type="hidden" name="valor" value="<%=pacote.getValor()%>"/>
                                <input type="hidden" name="localSaida" value="<%=pacote.getLocalSaida()%>"/>
                                <input type="hidden" name="localDestino" value="<%=pacote.getLocalDestino()%>"/>
                                <input type="hidden" name="roteiro" value="<%=pacote.getRoteiro()%>"/>
                                <input type="hidden" name="data" value="<%=pacote.getDthevento()%>"/>
                                <input type="hidden" name="idpacote" value="<%=pacote.getIdPacote()%>"/>
                            </li>
                        </ul>

                        <form class="card p-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Cupom de desconto">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-secondary">Adicionar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-8 order-md-1">


                        <h4 class="mb-3">Pagamento</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="credito" onclick="show1();" name="paymentMethod" value = "Crédito" type="radio" class="custom-control-input" checked required>
                                <label class="custom-control-label" for="credito">Cartão de Crédito</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="boleto" onclick="show2();" name="paymentMethod" value= "Boleto" type="radio" class="custom-control-input" required>
                                <label class="custom-control-label" for="boleto">Boleto</label>
                            </div>
                        </div>

                        <div id ="div1">
                            <div  class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Nome no cartão</label>
                                    <input type="text" id='cardname' class="form-control" id="cc-name" placeholder="" required>
                                    <small class="text-muted">Nome completo no cartão</small>
                                    <div class="invalid-feedback">
                                        Nome necesário
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Número do cartão</label>
                                    <input type="text" id ='cardnumber' class="form-control" id="cc-number" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Número do cartão necessário
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="cc-expiration">Expira em</label>
                                    <input type="date" id = 'expdate' class="form-control" id="cc-expiration" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Data necessária
                                    </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-cvv">Código de Segurança</label>
                                    <input type="text" id = 'codesec' class="form-control" id="cc-cvv" placeholder="" required>
                                    <div class="invalid-feedback">
                                        Código necessário
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Finalizar</button>
                    </div>
                </div>


                <footer class="my-5 pt-5 text-muted text-center text-small">
                    <a href="termo"><span class="text-primary">Sobre Orbis</span></a>
                    <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
                    <a href="termo"><span class="text-primary">Política de Uso</span></a>
                    <p class="mb-0">&copy; Orbis Eu Vou</p>
                </footer>
            </div>
        </body>
    </form>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="js/vendor/popper.min.js"></script>
    <script src="dist/js/"></script>
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <script src="js/boletoCredito.js"></script>

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

    <style>

        body{
            font-family: arial;


        }
        .hide{
            display:none;
        }
        p{
            font-weight: bold;
        }
    </style>

</body>
</html>
