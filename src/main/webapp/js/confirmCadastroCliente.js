function confirmCadastroCliente() {

    var cliente = document.getElementById('finalizarCadastro');

    var answer = confirm("Confirma seus dados?");

    if (answer == true) {

        cliente.submit();
    } else {
        return false;
    }

}