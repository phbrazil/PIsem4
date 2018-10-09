
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

    <body class="bg-light">

        <div class="container">
            <div class="py-5 text-center">
                <h2>Finalizar Compra</h2>
            </div>

            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Pacote</span>
                        <span class="badge badge-secondary badge-pill">ID Pacote</span>
                    </h4>
                    <ul class="list-group mb-3">
                        <li class="list-group-item d-flex justify-content-between lh-condensed">
                            <div>
                                <h6 class="my-0">Nome do Pacote</h6>
                                <small class="text-muted">Destino (ida - volta)</small>
                            </div>
                            <span class="text-muted">R$50,99</span>
                        </li>

                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <h6 class="my-0">B�nus por fidelidade</h6>
                                <small>EXEMPLO</small>
                            </div>
                            <span class="text-success">-R$5,00</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (BRL)</span>
                            <strong>R$45,99</strong>
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
                    <form class="needs-validation" novalidate>

                        <h4 class="mb-3">Pagamento</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credito" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                <label class="custom-control-label" for="credito">Cart�o de Cr�dito</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debito" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="debito">Cart�o de D�bito</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="boleto" name="paymentMethod" type="radio" class="custom-control-input" required>
                <label class="custom-control-label" for="boleto">Boleto</label>
              </div>
            </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="cc-name">Nome no cart�o</label>
                                <input type="text" class="form-control" id="cc-name" placeholder="" required>
                                <small class="text-muted">Nome completo no cart�o</small>
                                <div class="invalid-feedback">
                                    Nome neces�rio
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cc-number">N�mero do cart�o</label>
                                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                                <div class="invalid-feedback">
                                    N�mero do cart�o necess�rio
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="cc-expiration">Expira em</label>
                                <input type="date" class="form-control" id="cc-expiration" placeholder="" required>
                                <div class="invalid-feedback">
                                    Data necess�ria
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="cc-cvv">C�digo de Seguran�a</label>
                                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                                <div class="invalid-feedback">
                                    C�digo necess�rio
                                </div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Finalizar</button>
                    </form>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <a href="termo"><span class="text-primary">Sobre Orbis</span></a>
                <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
                <a href="termo"><span class="text-primary">Pol�tica de Uso</span></a>
                <p class="mb-0">&copy; Orbis Eu Vou</p>
            </footer>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="js/vendor/popper.min.js"></script>
        <script src="dist/js/"></script>
        <script src="../../assets/js/vendor/holder.min.js"></script>

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
    </body>
</html>