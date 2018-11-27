        function confirmCadastroCliente() {

            var cliente = document.getElementById('finalizarCadastro');

            var answer = confirm("Confirma seus dados?");
            if (answer == true) {

                //do something if file size more than 1 mb (1048576)
                /*if (fsize > 10048576) {
                 //alert(fsize + " bites\nArquivo muito grande!");
                 document.getElementById('filestatus').value = "As fotos com " + fsize + " bytes são muito grandes";
                 return false;
                 } else {*/
                cliente.submit();

                /*}*/

            } else {
                return false;
            }
            /*} else {
             alert("Verificar os campos preenchidos")
             return false;
             }*/

        }