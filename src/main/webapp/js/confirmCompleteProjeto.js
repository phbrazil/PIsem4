
function confirmCompleteProjeto() {

    var criarprojeto = document.getElementById('criarprojeto');

    var test = document.getElementById('estado').value;

    if (document.getElementById('area').value != '' &&
            document.getElementById('contatomci').value != '' &&
            document.getElementById('propreqdate').value != '' &&
            document.getElementById('mcistdcliname').value != '' &&
            document.getElementById('projectname').value != '' &&
            document.getElementById('projectcode').value != '' &&
            document.getElementById('eventstartdate').value != '' &&
            document.getElementById('industrysector').value != '' &&
            document.getElementById('eventstatus').value != '' &&
            document.getElementById('eventclosingdate').value != '' &&
            document.getElementById('estado').value != '' &&
            document.getElementById('paxnumber').value != '' &&
            document.getElementById('cancelinsurance').value != '' &&
            document.getElementById('probability').value != '' &&
            document.getElementById('projectstatus').value != '' &&
            document.getElementById('projectaudit').value != '' &&
            document.getElementById('turnoverforowner').value != '' &&
            document.getElementById('gmforowner').value != '' &&
            document.getElementById('customertype').value != '' &&
            document.getElementById('pais').value != '' &&
            document.getElementById('additionalclientname').value != '') {

        var answer = confirm("Confirma os dados do Projeto?");
        if (answer == true) {

            if (test == 'Internacional') {
                document.getElementById('estado').disabled = false;            
                
            }
            criarprojeto.submit();
        }
    } else {
        alert("Verificar os campos preenchidos")
        return false;
    }

}
