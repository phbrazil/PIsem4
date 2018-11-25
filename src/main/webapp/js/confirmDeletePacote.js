
function confirmDeletePacote() {

    var deletarPacote = document.getElementById('deletarPacote');


    var answer = confirm("Deseja realmente deletar esse Pacote?");
    if (answer == true) {
        deletarPacote.submit();
    } else {
        return false;
    }


}
