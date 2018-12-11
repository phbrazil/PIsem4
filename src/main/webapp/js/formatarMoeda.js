/*@file utils.js
 @brief Conjunto de funções para tratamento dos dados
 @author Marcone Gledson de Almeida
 @date 2008
 */

/*   @brief Converte uma string em formato moeda para float
 @param valor(string) - o valor em moeda
 @return valor(float) - o valor em float
 
 
 */
function Moeda(valor, nomecampo) {

    for (var i = 0; i < valor.length; i++) {
        if (valor.charAt(i) == ".") {
            valor = valor.replace(".", "");
        }
    }
    valor = valor.replace(",", ".");

    if (nomecampo == 'turnoverforowner') {
        document.Projetos.turnoverforowner.value = converteFloatMoeda(valor);

    } else if (nomecampo == 'gmforowner') {
        document.Projetos.gmforowner.value = converteFloatMoeda(valor);

    }


}

function validaNumero(entrada, nomecampo) {


    for (var i = 0; i < entrada.length; i++) {

        if (entrada.charAt(i) == '0' || entrada.charAt(i) == '1' || entrada.charAt(i) == '2'
                || entrada.charAt(i) == '3' || entrada.charAt(i) == '4' || entrada.charAt(i) == '5'
                || entrada.charAt(i) == '6' || entrada.charAt(i) == '7' || entrada.charAt(i) == '8'
                || entrada.charAt(i) == '9' || entrada.charAt(i) == ',') {

        } else {
            alert("Inserir somente números e vírgula");
            document.getElementById(nomecampo).value = 0;
            document.getElementById(nomecampo).focus();

        }

    }
}

function converteMoedaFloat(valor) {

    if (valor === "") {
        valor = 0;
    } else {
        for (var i = 0; i < valor.length; i++) {
            if (valor.charAt(i) == ".") {
                valor = valor.replace(".", "");
            }
        }
        valor = valor.replace(",", ".");
        valor = parseFloat(valor);
    }
    return valor;

}

/*   @brief Converte um valor em formato float para uma string em formato moeda
 @param valor(float) - o valor float
 @return valor(string) - o valor em moeda
 */
function converteFloatMoeda(valor) {
    
    alert(valor+" aqui");


    var inteiro = null, decimal = null, c = null, j = null;
    var aux = new Array();
    valor = "" + valor;
    c = valor.indexOf(".", 0);
    //encontrou o ponto na string
    if (c > 0) {
        //separa as partes em inteiro e decimal
        inteiro = valor.substring(0, c);
        decimal = valor.substring(c + 1, valor.length);
    } else {
        inteiro = valor;
    }

    //pega a parte inteiro de 3 em 3 partes
    for (j = inteiro.length, c = 0; j > 0; j -= 3, c++) {
        aux[c] = inteiro.substring(j - 3, j);
    }

    //percorre a string acrescentando os pontos
    inteiro = "";
    for (c = aux.length - 1; c >= 0; c--) {
        inteiro += aux[c] + '.';
    }
    //retirando o ultimo ponto e finalizando a parte inteiro

    inteiro = inteiro.substring(0, inteiro.length - 1);

    decimal = parseInt(decimal);
    if (isNaN(decimal)) {
        decimal = "00";
    } else {
        decimal = "" + decimal;
        if (decimal.length === 1) {
            decimal = decimal + "0";
        }
    }

    valor = inteiro + "," + decimal;
    return valor;

}