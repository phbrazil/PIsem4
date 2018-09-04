   function Localidade() {


            var pais = document.getElementById('pais').value;

            if (pais != "Brazil") {

                document.getElementById('estado').value = 'Internacional';
                document.getElementById('estado').disabled = true;


            } else {
                document.getElementById('estado').value = 'São Paulo';
                document.getElementById('estado').disabled = false;
                document.getElementById('estado').focus();

            }
        }
