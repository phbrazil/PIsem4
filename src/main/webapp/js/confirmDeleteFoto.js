
function confirmDeleteFoto() {

    var foto = document.getElementById('foto');


    var answer = confirm("Deseja realmente deletar essa foto?");
    if (answer == true) {
        foto.submit();
    } else {
        return false;
    }


}
