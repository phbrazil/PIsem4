<!--**
 *
 * @author paulo.bezerra
 *-->
<%-- 
    Created on : june 20, 2018, 11:13:17 PM
    Author     : paulo.bezerra
--%>
<!doctype html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Ingressos</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <style>
            p.round1 {
                border: 2px solid black;
                border-radius: 5px;
                text-align: center;

            }

        </style>

    </head>

    <body  style="background-color: white;">
        <div align ="center">
            <div class="content" style = "background-color: white;">
                <div class="row" style='width: 100%;'>
                    <div class="col-md-6 mb-3 round1">
                        <span  type ='text' style='color: rgb(128, 128, 128);font-size:14px;'><br>Orbis<br>
                            Avenida Engenheiro Eusébio Stevaux <br>
                            <br>
                            www.9ember.com/orbis</span>
                    </div>
                    <div class="col-md-2 mb-3">
                        <img  src="img/orbis_logo.png" style="width: 90%" alt="logo orbis">
                    </div>
                </div>
                <div align ='center'>
                    <h3 class='text-muted'><strong>I n g r e s s o</strong></h3>
                </div>
                <div class="col-md-10 order-md-1">
                    <div class="row" style='width: 100%;'>
                        <div class="col-md-6 mb-3">
                            <label><strong>Nome</strong></label>
                            <input readonly value="${nome}" name="nome" data-toggle="tooltip" title="Nome do Cliente" data-placement="bottom"  type="text"  class="form-control" id="nomecli" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Valor</strong></label>
                            <div class="input-group">
                                <input readonly value= "${valor}" name="valor" data-toggle="tooltip" title="Valor do Ingresso" data-placement="bottom" type="text"  class="form-control" id="valor" required>
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Data/Hora</strong></label>
                            <div class="input-group">
                                <input readonly value= "${data}" name="data" data-toggle="tooltip" title="Data Hora" data-placement="bottom" type="text"  class="form-control" id="valor" required>
                            </div>
                        </div>


                        <div class="col-md-5 mb-3">
                            <label><strong>Local Saída</strong></label>
                            <input  readonly name="localSaida" value="${localSaida}" title="Local Saida" data-placement="bottom"  type="text"  class="form-control" id="localSaida" required>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label><strong>Local Destino</strong></label>
                            <input  readonly name="localSaida" value="${localDestino}" title="Local Saida" data-placement="bottom"  type="text"  class="form-control" id="localSaida" required>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <hr>

    </body>

    <script src="js/jquery.js"></script>


</html>
