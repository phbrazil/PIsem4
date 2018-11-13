$('#i_submit').click(function () {
    //check whether browser fully supports all File API
    if (window.File && window.FileReader && window.FileList && window.Blob)
    {
        //get the file size and file type from file input field
        var fsize = $('#i_file')[0].files[0].size;

        if (fsize > 1048576) //do something if file size more than 1 mb (1048576)
        {
            //alert(fsize + " bites\nArquivo muito grande!");
            document.getElementById('filestatus').value = "Arquivo com " + fsize + " bytes é muito grande";
            return false;
        } else {
            console.log(fsize + " bites\nArquivo com tamanho aceito!");
        }
    } else {
        alert("Favor atualizar seu navegador, pois seu navegador atual não possui alguns atributos necessários!");
    }
});
