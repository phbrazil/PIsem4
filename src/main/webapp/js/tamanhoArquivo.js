$('#i_submit').click(function () {
    //check whether browser fully supports all File API
    if (window.File && window.FileReader && window.FileList && window.Blob)
    {
        //get the file size and file type from file input field
        var fsize = $('#i_file')[0].files[0].size;

        if (fsize > 10048576) //do something if file size more than 1 mb (1048576)
        {
            //alert(fsize + " bites\nArquivo muito grande!");
            alert("As fotos com " + fsize + " bytes são muito grandes");
            return false;
        } else {
            console.log(fsize + " bites\nArquivo com tamanho aceito!");
        }
    } else {
        alert("Favor atualizar seu navegador, pois seu navegador atual não possui alguns atributos necessários!");
    }
});
