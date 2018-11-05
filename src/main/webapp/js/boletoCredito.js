        function show1() {
            document.getElementById('div1').style.display = 'block';
            document.getElementById('cardname').required = true;
            document.getElementById('cardnumber').required = true;
            document.getElementById('expdate').required = true;
            document.getElementById('codesec').required = true;

        }
        function show2() {
            document.getElementById('div1').style.display = 'none';
            document.getElementById('cardname').required = false;
            document.getElementById('cardnumber').required = false;
            document.getElementById('expdate').required = false;
            document.getElementById('codesec').required = false;

        }