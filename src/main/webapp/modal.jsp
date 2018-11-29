<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Orbis</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>

        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog" style="background-color: #0fd0d0;">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="color: black;"><strong><img src="img/orbis_logo.png" style="width: 20%;height: 20%"></strong></h4>
                        </div>
                        <div class="modal-body">
                            <p><strong>${mensagem}</strong></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

    </body>
    <script>

        $(document).ready(function () {
            $('#myModal').modal('toggle');
        });

        $('#myModal').on('hidden.bs.modal', function () {
            location = "${path}";
        });


    </script>
</html>
