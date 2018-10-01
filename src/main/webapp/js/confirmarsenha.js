
function ConfirmPassword() {

    var criarconta = document.getElementById('criarconta');

    var password = document.getElementById('psw').value;
    var confirmpassword = document.getElementById('psw-repeat').value;

    if (password.length < 5) {

        alert("Senha muito curta");
        document.getElementById("psw").focus();
        return false;

    } else if (password !== confirmpassword) {

        alert("Senhas não combinam");

        document.getElementById("psw").focus();
        return false;


    } else {
        var answer = confirm("Confirma seus dados?");
        if (answer == true) {
            criarconta.submit();
        }
    }


}





