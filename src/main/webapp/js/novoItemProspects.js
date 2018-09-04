function addRow(tableID) {

    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    var element1 = document.createElement("input");
    element1.type = "checkbox";
    cell1.appendChild(element1);

    var cell2 = row.insertCell(1);
    cell2.innerHTML = rowCount;

    var cell3 = row.insertCell(2);
    var array = ["Andre Ciccala", "Claudia Tommasi", "Helena Huang", "Wagner Lourenço"];
    var element3 = document.createElement("select");
    element3.setAttribute("id", "mySelect");
    cell3.appendChild(element3);
    element3.type = "text";
    element3.required = true;

    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        element3.name = "bd" + rowCount;
        element3.rows = "5";
        element3.cols = "50"
        element3.appendChild(option);
    }

    var cell4 = row.insertCell(3);
    var element3 = document.createElement("input");
    element3.type = "text";
    element3.name = "nomecontatoitem" + rowCount;
    element3.placeholder = "Nome Contato"
    element3.required = true;
    element3.autocomplete = 'off';
    element3.setAttribute('maxlength',50);
    cell4.appendChild(element3);


    var cell5 = row.insertCell(4);
    var element4 = document.createElement("textarea");
    element4.type = "text";
    element4.name = "briefing" + rowCount;
    element4.id = "briefing" + rowCount;
    element4.placeholder = "Comentário"
    element4.required = true;
    element4.setAttribute('maxlength',500);
    cell5.appendChild(element4);


    var cell6 = row.insertCell(5);
    var array = ["Sim", "Não"];
    var element6 = document.createElement("select");
    element6.setAttribute("id", "mySelect");
    cell6.appendChild(element6);
    element6.type = "text";
    element6.required = true;
    for (var i = 0; i < array.length; i++) {
        var option = document.createElement("option");
        option.setAttribute("value", array[i]);
        option.text = array[i];
        element6.name = "followup" + rowCount;
        element6.appendChild(option);
    }

    var cell7 = row.insertCell(6);
    var element7 = document.createElement("input");
    element7.type = "date";
    element7.name = "datefollowup" + rowCount;
    element7.id = "datefollowup" + rowCount;
    element7.valueAsDate = new Date();
    element7.required = true;
    cell7.appendChild(element7);

}


function deleteRow(tableID) {
    try {
        var table = document.getElementById(tableID);
        var rowCount = table.rows.length;

        for (var i = 0; i < rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            if (null != chkbox && true == chkbox.checked) {
                table.deleteRow(i);
                rowCount--;
                i--;
            }

        }
    } catch (e) {
        alert(e);
    }
}

