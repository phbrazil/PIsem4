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

        <title>Recibo Venda</title>

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
        <form  action="recibo"  method="POST">
            <div align ="center">
                <div class="content" style = "background-color: white;">
                    <div class="row" style='width: 100%;'>
                        <div class="col-md-2 mb-3">
                            <img  src="img/mci_brazil.png" style="width: 80%" alt="logo MCI">
                        </div>
                        <div class="col-md-6 mb-3 round1">
                            <span  type ='text' style='color: rgb(128, 128, 128);font-size:14px;'><br>MCI Brazil | São Paulo Office<br>
                                R. George Ohm, 206/ 230, 19°a, Torre A - 04576-020 - Cidade Moções<br>
                                T: +55 (11) 3056-6000 ramal 8676 C: +55 (11) 9 4057-2106<br>
                                W: www.mci-group.com</span>

                        </div>
                        <div class="col-md-2 mb-3">
                            <img  src="img/logo_evento.png" style="width: 90%" alt="logo Evento">
                        </div>
                        <div class="col-md-10 mb-3">
                            <span><strong>R e c i b o</strong></span>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label><strong>FORMAS DE PAGAMENTO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>CARTÃO DE CRÉDITO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>FORMAS DE DÉBITO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>ESPÉCIE</strong></label>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>VALOR DA COMPRA</strong></label>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="input-group">
                                <input readonly value= "${valorTotal}" name="valorcompra" onkeydown="autofill()" data-toggle="tooltip" title="Valor da Compra" data-placement="bottom" type="text"  class="form-control" id="valorcompra" required>
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Recebemos de</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input readonly value="${razaoSocial}" name="razoaoSocial" onkeydown="autofill()" data-toggle="tooltip" title="Nome do Cliente" data-placement="bottom"  type="text"  class="form-control" id="nomecli" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>CNPJ</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input  readonly name="cnpj" value="${cnpj}" onkeyup="autofill()" data-toggle="tooltip" onkeydown="javascript: fMasc(this, mCNPJ);" maxlength="18" title="CNPJ do Cliente" data-placement="bottom"  type="text"  class="form-control" id="cnpj" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Expositor</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input name="expositor" onkeydown="autofill()" data-toggle="tooltip" title="Expositor" data-placement="bottom"  type="text"  class="form-control" id="expositor" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Valor por extenso</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input name="extenso" onkeydown="autofill()" data-toggle="tooltip" title="Valor por Extenso" data-placement="bottom"  type="text"  class="form-control" id="extenso" required>
                        </div>

                        <div class="col-md-2 mb-3">
                            <label><strong>Referente à</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input readonly value="${itemVenda}" name="referente" onkeydown="autofill()" data-toggle="tooltip" title="Item vendido" data-placement="bottom"  type="text"  class="form-control" id="referente" required>
                        </div>
                        <div align ='center'>
                            <div class="col-md-10 mb-3">
                                <p class="round1" style='color: black; font-size:14px;'>no evento LABACE 2018, a ser realizado de 14 a 16 de agosto
                                    de 2018 no AEROPORTO DE CONGONHAS, localizado a Rua Tamoios, 361, São Paulo/SP - Brasil						
                                </p>

                            </div>
                            <div class="col-md-10 mb-3">
                                <p class="round1" style='color: black;font-size:14px;'>IMPORTANTE A NF-e DE PRESTAÇÃO DE SERVIÇOS SERÁ EMITIDA E ENVIADA EM ATÉ 5 DIAS ÚTEIS AO CNPJ DECLARADO ACIMA.</p>
                            </div>
                            <label><strong>${estado}, <input id='dd' class="col-md-2 mb-1" style="border: none;"> de <input id='mm' class="col-md-3 mb-1" style="border: none;"> de <input id='yy' class="col-md-3 mb-1" style="border: none;"></strong></label>
                        </div>

                    </div>
                </div>
            </div>
        </form>
        <hr>
        <form  action="recibo"  method="POST">
            <div align ="center">
                <div class="content" style = "background-color: white;">
                    <div class="row" style='width: 100%;'>
                        <div class="col-md-2 mb-3">
                            <img  src="img/mci_brazil.png" style = 'width: 80%;' alt="logo MCI">
                        </div>
                        <div class="col-md-6 mb-3 round1">
                            <span  type ='text' style='color: rgb(128, 128, 128);font-size:14px;'><br>MCI Brazil | São Paulo Office<br>
                                R. George Ohm, 206/ 230, 19°a, Torre A - 04576-020 - Cidade Moções<br>
                                T: +55 (11) 3056-6000 ramal 8676 C: +55 (11) 9 4057-2106<br>
                                W: www.mci-group.com</span>

                        </div>
                        <div class="col-md-2 mb-3">
                            <img  src="img/logo_evento.png" style = 'width: 90%;' alt="logo Evento">
                        </div>
                        <div class="col-md-10 mb-3">
                            <span><strong>R e c i b o</strong></span>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label><strong>FORMAS DE PAGAMENTO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>CARTÃO DE CRÉDITO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>FORMAS DE DÉBITO</strong></label>
                        </div>
                        <div class="col-md-1 mb-3">
                            <label><strong>ESPÉCIE</strong></label>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>VALOR DA COMPRA</strong></label>
                        </div>
                        <div class="col-md-3 mb-3">
                            <div class="input-group">
                                <input readonly value= "${valorTotal}" name="valorcompra2" data-toggle="tooltip" title="Valor da Compra" data-placement="bottom"  type="text"  class="form-control" id="valorcompra2" required>
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Recebemos de</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input readonly value = "${razaoSocial}" name="nomecli2" data-toggle="tooltip" title="Nome do Cliente" data-placement="bottom"  type="text"  class="form-control" id="nomecli2" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>CNPJ</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input readonly value = "${cnpj}" name="cnpj2" onkeydown="javascript: fMasc(this, mCNPJ);" maxlength="18" data-toggle="tooltip" title="CNPJ do Cliente" data-placement="bottom"  type="text"  class="form-control" id="cnpj2" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Expositor</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input name="expositor2" data-toggle="tooltip" title="Expositor" data-placement="bottom"  type="text"  class="form-control" id="expositor2" required>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label><strong>Valor por extenso</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input name="extenso2" data-toggle="tooltip" title="Valor por Extenso" data-placement="bottom"  type="text"  class="form-control" id="extenso2" required>
                        </div>

                        <div class="col-md-2 mb-3">
                            <label><strong>Referente à</strong></label>
                        </div>
                        <div class="col-md-9 mb-3">
                            <input readonly value="${itemVenda}" name="referente2" data-toggle="tooltip" title="Item vendido" data-placement="bottom"  type="text"  class="form-control" id="referente2" required>
                        </div>
                        <div align ='center'>
                            <div class="col-md-10 mb-3">
                                <p class="round1" style='color: black;font-size:14px;'>no evento LABACE 2018, a ser realizado de 14 a 16 de agosto
                                    de 2018 no AEROPORTO DE CONGONHAS, localizado a Rua Tamoios, 361, São Paulo/SP - Brasil						
                                </p>
                            </div>
                            <div class="col-md-10 mb-3">
                                <p class="round1" style='color: black;font-size:14px;'>IMPORTANTE A NF-e DE PRESTAÇÃO DE SERVIÇOS SERÁ EMITIDA E ENVIADA EM ATÉ 5 DIAS ÚTEIS AO CNPJ DECLARADO ACIMA.</p>
                            </div>
                            <label><strong>${estado}, <input id='dd2' class="col-md-2 mb-1" style="border: none;"> de <input id='mm2' class="col-md-3 mb-1" style="border: none;"> de <input id='yy2' class="col-md-3 mb-1" style="border: none;"></strong></label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    <script src="js/jquery.js"></script>
    <script src="js/jquery.maskMoney.js"></script>
    <script src="js/mascaraCNPJ.js"></script>
    <script>

                                function autofill() {

                                    document.getElementById('valorcompra2').value = document.getElementById('valorcompra').value;
                                    document.getElementById('nomecli2').value = document.getElementById('nomecli').value;
                                    document.getElementById('cnpj2').value = document.getElementById('cnpj').value;
                                    document.getElementById('extenso2').value = document.getElementById('extenso').value;
                                    document.getElementById('expositor2').value = document.getElementById('expositor').value;
                                    document.getElementById('referente2').value = document.getElementById('referente').value;

                                }

    </script>

    <script>
        $(function () {
            $('#valorcompra').maskMoney();
            $('#valorcompra2').maskMoney();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#cnpj").mask("99.999.999/9999-99");
        });
    </script>

    <script>

        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();

        var mes = "";
        if (mm === 1) {
            mes = "Janeiro";
        } else if (mm == 2) {
            mes = "Fevereiro";
        } else if (mm == 3) {
            mes = "Março";
        }else if (mm == 4) {
            mes = "Abril";
        }else if (mm == 5) {
            mes = "Maio";
        }else if (mm == 6) {
            mes = "Junho";
        }else if (mm == 7) {
            mes = "Julho";
        }else if (mm == 8) {
            mes = "Agosto";
        }else if (mm == 9) {
            mes = "Setembro";
        }else if (mm == 10) {
            mes = "Outubro";
        }else if (mm == 11) {
            mes = "Novembro";
        }else if (mm == 12) {
            mes = "Dezembro";
        }

        document.getElementById('dd').value = dd;
        document.getElementById('mm').value = mes;

        document.getElementById('dd2').value = dd;
        document.getElementById('mm2').value = mes;

        document.getElementById('yy').value = yyyy;
        document.getElementById('yy2').value = yyyy;

    </script>

</html>
