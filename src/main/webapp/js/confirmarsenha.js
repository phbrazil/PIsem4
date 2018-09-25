
function ConfirmPassword() {


    var password = document.getElementById('psw').value;
    var confirmpassword = document.getElementById('psw-repeat').value;

    if (password.length < 5) {

        alert("Senha muito curta");
        document.getElementById("psw").focus();

    } else {

        if (password !== confirmpassword) {

            alert("Senhas não combinam");

            document.getElementById("psw").focus();

        }
    }


}





