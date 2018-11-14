
function confirmCompletePacote() {

    var pacote = document.getElementById('pacote');

    if (document.getElementById('dthevento').value != '' &&
            document.getElementById('localsaida').value != '' &&
            document.getElementById('localdestino').value != '' &&
            document.getElementById('valor').value != '' &&
            document.getElementById('roteiro').value != '' &&
            document.getElementById('qtdmax').value != '') {

        var answer = confirm("Confirma os dados do Pacote?");
        if (answer == true) {
            pacote.submit();
        }
    } else {
        alert("Verificar os campos preenchidos")
        return false;
    }

}
