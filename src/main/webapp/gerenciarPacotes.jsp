<!DOCTYPE html>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userAgent = request.getHeader("user-agent");

    HttpSession sessao = request.getSession();

    Integer idUser = (Integer) sessao.getAttribute("idcliente");
    String nomeUser = (String) sessao.getAttribute("nomeUser");
    Integer idgrupo = (Integer) (sessao.getAttribute("idgrupo"));

    boolean mobile = false;
    if (userAgent.toUpperCase().contains("IPHONE") || userAgent.toUpperCase().contains("ANDROID")
            || userAgent.toUpperCase().contains("MOBILE")) {
        mobile = true;
    } else {
        mobile = false;

    }
    sessao.setAttribute("mobile", mobile);

%>
<html lang="en">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script-->
        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Gerenciar Pacotes</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/round-about.css" rel="stylesheet">

    </head>


    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        * {box-sizing: border-box;}

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        /* Add a background color when the inputs get focus */
        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        button:hover {
            opacity:1;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
        }

        /* Float cancel and signup buttons and add an equal width */
        .cancelbtn, .signupbtn {
            float: left;
            width: 50%;
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: #474e5d;
            padding-top: 50px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 100%; /* Could be more or less, depending on screen size */
        }

        /* Style the horizontal ruler */
        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /* The Close Button (x) */
        .close {
            position: absolute;
            right: 35px;
            top: 15px;
            font-size: 40px;
            font-weight: bold;
            color: #f1f1f1;
        }

        .close:hover,
        .close:focus {
            color: #f44336;
            cursor: pointer;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
        }
    </style>

    <body style="background: #dcdee4">

        <!-- Navigation -->
        <%@include  file="navbarTest.jsp"%>

        <br>
        <br>
        <br>

        <!-- Page Content -->
        <div class="container">

            <!-- Team Members Row -->
            <div class="row">
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="pacoteCriar.jsp">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/criarPacote.png" alt="">
                        <h3>Criar Pacotes
                        </h3>
                    </a>
                </div>
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="consultaPacoteEditar.jsp">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/editPacote.png" alt="">
                        <h3>Alterar Pacotes
                        </h3>
                    </a>
                </div>
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="dashboard?year=2018">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/reportsPacotes.jpeg" alt="">
                        <h3>Relatórios
                        </h3>
                    </a>
                </div>
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="#"  onclick="document.getElementById('id01').style.display = 'block'">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/editPacote.png" alt="">
                        <h3>Cadastro de usuário adm
                        </h3>
                    </a>
                </div>

                <div id="id01" class="modal">
                    <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                    <form class = "modal-content" name = "SignUp"  id = "criarconta" action="${pageContext.request.contextPath}/CriarContaAdministrativa" method="POST">
                        <div class="container">
                            <h1>Criar conta - ADM </h1>
                            <p>Preencha os dados para criar sua conta.</p>
                            <hr>

                            <label for="nome"><b>Nome</b></label>
                            <input type="text" autocomplete="off" placeholder="Exemplo: Wilson ou Dora" name="nome" id = 'nome' required>

                            <label for="email"><b>Email</b></label>
                            <input type="text" autocomplete="off" placeholder="Inserir Email" name="email" id='email' required>

                            <label for="cpf"><b>RG</b></label>
                            <input type="text" onkeydown="javascript: fMasc(this, mRG());" maxlength="9" autocomplete="off" placeholder="RG" name="rg" id = 'rg' required>

                            <label for="cpf"><b>CPF</b></label>
                            <input type="text" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" autocomplete="off" placeholder="CPF" name="cpf" id = 'cpf' required>

                            <label for="sexo"><b>Sexo</b></label>
                            <div class ="col-md-2 mb-3" data-toggle="tooltip" title='Projeto envolve'  data-placement="right">
                                <input type="radio" name="sexo" value = "Masculino" > Masculino<br>
                                <input type="radio" name="sexo" value = "Feminino"> Feminino<br>
                            </div>

                            <label for="telefone"><b>Telefone</b></label>
                            <input type="text" onkeydown="javascript: fMasc(this, mTel);" autocomplete="off" placeholder="(xx)xxxx-xxxx" maxlength="13" name="telefone" id = 'telefone'>

                            <label for="celular"><b>Celular</b></label>
                            <input type="text" onkeydown="javascript: fMasc(this, mTel);" autocomplete="off" placeholder="(xx)xxxxx-xxxx" maxlength="14" name="celular" id = 'celular' required>

                            <label for="psw"><b>Senha</b></label>
                            <input type="password" autocomplete="off" placeholder="Insira a Senha" name="psw" id='psw' required>

                            <label for="psw-repeat"><b>Confirmar Senha</b></label>
                            <input type="password" autocomplete="off" placeholder="Repetir Senha" name="psw-repeat" id = 'psw-repeat' required>

                            <p>Para criar sua conta você declara que concorda com <a href="#" style="color:dodgerblue">Termos & Privacidade</a>.</p>

                            <div class="clearfix">
                                <button type="button" onclick="document.getElementById('id01').style.display = 'none'" class="cancelbtn">Cancelar</button>
                                <button type="submit" class="signupbtn" onclick="{
                                            return ConfirmPassword();
                                        }">Criar</button>
                            </div>
                        </div>
                    </form>
                </div>


            </div>

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="my-5 pt-5 text-muted text-center text-small">
            <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
            <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
            <a href="termo"><span class="text-primary">Política de Uso</span></a>
            <p class="mb-0">&copy; Orbis Eu Vou</p>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
