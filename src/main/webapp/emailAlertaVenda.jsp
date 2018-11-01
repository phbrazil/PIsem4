<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Opportunity</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link href="css/buttonbranco.css" rel="stylesheet">
    </head>

    <body id="page-top">

        <form name = "email" id ="email" action="${pageContext.request.contextPath}/EmailAlertaVenda" method="POST">

            <input type ="hidden" id = "to1"  name = "to1" value="${to1}" </input>
            <input type ="hidden" id = "body"  name = "body" value="${body}" </input>
            <input type ="hidden" id = "subject"  name = "subject" value="${subject}" </input>
            <input type ="hidden" id = "localSaida"  name = "localSaida" value="${localSaida}" </input>
            <input type ="hidden" id = "localDestino"  name = "localDestino" value="${localDestino}" </input>
            <input type ="hidden" id = "roteiro"  name = "roteiro" value="${roteiro}" </input>
            <input type ="hidden" id = "protocolo"  name = "protocolo" value="${protocolo}" </input>
            <input type ="hidden" id = "valor"  name = "valor" value="${valor}" </input>
            <input type ="hidden" id = "data"  name = "data" value="${data}" </input>

        </form>    


        <script >

            window.onload = function () {
                var x = document.getElementsByName('email');
                x[0].submit(); //form submission
            }

        </script>

    </body>



</html>