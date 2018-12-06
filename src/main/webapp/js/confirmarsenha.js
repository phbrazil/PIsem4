
function ConfirmPassword() {

    var trocarsenha = document.getElementById('trocarsenha');

    var password = document.getElementById('password').value;
    var confirmpassword = document.getElementById('confirmpassword').value;

    if (password.length < 5) {

        alert("Senha muito curta");
        document.getElementById("password").focus();
        return false;

    } else if (password !== confirmpassword) {

        alert("Senhas não combinam");

        document.getElementById("password").focus();
        return false;


    } else {
        var answer = confirm("Confirma seus dados?");
        if (answer == true) {
            trocarsenha.submit();
        }
    }


}





