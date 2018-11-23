
function confirmPacote() {

    var pacote = document.getElementById('pacote');
    var fsize = $('#i_file')[0].files[0].size;


    if (document.getElementById('dthevento').value != '' &&
            document.getElementById('localsaida').value != '' &&
            document.getElementById('localdestino').value != '' &&
            document.getElementById('valor').value != '' &&
            document.getElementById('roteiro').value != '' &&
            document.getElementById('qtdmax').value != '') {

        var answer = confirm("Confirma os dados do Pacote?");
        if (answer == true) {

//do something if file size more than 1 mb (1048576)
            if (fsize > 10048576) {
                //alert(fsize + " bites\nArquivo muito grande!");
                document.getElementById('filestatus').value = "As fotos com " + fsize + " bytes são muito grandes";
                return false;
            } else {
                pacote.submit();

            }

        }
    } else {
        alert("Verificar os campos preenchidos")
        return false;
    }

}
