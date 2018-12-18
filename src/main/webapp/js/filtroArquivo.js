function ValidateSize(file) {
    var FileSize = file.files[0].size / 1024 / 1024; // in MB

    var filename = $('#i_file').val();

    if (FileSize > 5) {
        alert('<br><strong>File size is larger than 5MB</strong>');
        document.getElementById('filestatus').value = 'File size is larger than 5MB';
        document.getElementById('filestatus').style.color = 'red';
        $(file).val(''); //for clearing with Jquery
        return false;
    } else {

        /* if (!filename.includes(".ppt")) {
         alert('<br><strong>This is not a PowerPoint file</strong>');
         document.getElementById('filestatus').value = 'This is not a PowerPoint file';
         document.getElementById('filestatus').style.color = 'ref';
         $(file).val(''); //for clearing with Jquery
         return false;
         } else {
         document.getElementById('filestatus').value = 'File accepted';
         document.getElementById('filestatus').style.color = 'green';
         return true;
         }*/
         document.getElementById('filestatus').value = 'File accepted';
         document.getElementById('filestatus').style.color = 'green';

        return true;

    }
}
