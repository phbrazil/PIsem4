
function ConfirmPassword() {


    var password = document.getElementById('password').value;
    var confirmpassword = document.getElementById('confirmpassword').value;

    if (password.length < 5) {

        alert("Senha muito curta");
        document.getElementById("password").focus();

    } else {

        if (password !== confirmpassword) {

            alert("Senhas não combinam")

            document.getElementById("password").focus();

        }
    }


}





