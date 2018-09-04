function TamanhoData() {

    var propreqdate = document.getElementById("propreqdate").value;
    var eventstartdate = document.getElementById("eventstartdate").value;
    var eventclosingdate = document.getElementById("eventclosingdate").value;



    if (propreqdate.length > 10 || eventstartdate.length > 10 || eventclosingdate.length > 10) {
        alert("Data no formato inválido")
    }

}