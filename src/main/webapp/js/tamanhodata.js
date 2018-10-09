function TamanhoData() {

    var dthevento = document.getElementById("dthevento").value;



    if (dthevento.length > 10) {
        alert("Data no formato inválido");
        document.getElementById("dthevento").focus();
    }

}