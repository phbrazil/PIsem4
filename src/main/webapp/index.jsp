<%@page import="orbis.DAO.pacote.listarImagens"%>
<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="orbis.model.pacote.tbPacote"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="orbis.DAO.pacote.listarPacotes"%>
<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userAgent = request.getHeader("user-agent");

    HttpSession sessao = request.getSession();

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


<head>
    <title>Orbis Eu Vou</title>
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
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
    </style>


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

    <%if (nomeUser == null) {

    %>

<body class="bg-light">

    <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto; float: right">Criar Conta</button>
    <button onclick="{
                location = 'login.jsp';
            }" style="width:auto; float: right">Já tenho Conta</button>

    <div id="id01" class="modal">
        <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
        <form class = "modal-content" name = "SignUp"  id = "criarconta" action="${pageContext.request.contextPath}/CriarConta" method="POST">
            <div class="container">
                <h1>Criar Conta</h1>
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
    <%} else {%>


    <button onclick="{
                location = 'sair.jsp';
            }" style="width:auto; float: right">Sair</button>
    <%if (idgrupo == 1) {%>
    <button onclick="{
                location = 'gerenciarPacotes.jsp';
            }" style="width:auto; float: right">Gerenciar Pacotes</button>
    <%}%>


    <button onclick="{
                location = 'minhasCompras';
            }" style="width:auto; float: right">Olá <%=nomeUser%></button>

    <%}%>

    <script>
        // Get the modal
        var modal = document.getElementById('id01');
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
    
            <nav class="navbar navbar-expand-lg navbar-dark  text-dark fixed-top" style="background-color:#c5c5c1">

                <a class="navbar-brand" href="index.jsp">
                  <img src="img/orbis_logo.png" width="80" height="40" class="d-inline-block align-top" alt="">
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        
                    <form  class="form-inline" name = "buscar"  id = "buscar" action="${pageContext.request.contextPath}/Buscar" method="POST">

                            <!--end of col-->
                            <div class="col">
                                <input id="query" name="busca" class="form-control mr-sm-2" type="search" required placeholder="Experimente: Arraial">
                            </div>
                            <!--end of col-->
                            <div class="col-auto">
                                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                            </div>

                        </form>
                    
<!--                    <button onclick="document.getElementById('id01').style.display = 'block'" style="width:auto; float: right">Criar Conta</button>
                    <button onclick="{location = 'login.jsp';}" style="width:auto; float: right">Já tenho Conta</button>-->

 <%if (nomeUser == null) {

    %>

<body class="bg-light">

     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown user
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" onclick="document.getElementById('id01').style.display = 'block'" >Criar Conta</a>
          <a class="dropdown-item" href="login.jsp">Já tenho Conta</a>
        </div>
      </li>

    <div id="id01" class="modal">
        <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
        <form class = "modal-content" name = "SignUp"  id = "criarconta" action="${pageContext.request.contextPath}/CriarConta" method="POST">
            <div class="container">
                <h1>Criar Conta</h1>
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
            
    <%} else {%>


     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown user
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="minhasCompras.jsp">Olá <%=nomeUser%></a>
           <%if (idgrupo == 1) {%>
          <a class="dropdown-item" href="gerenciarPacotes.jsp">Gerenciar Pacotes</a>
          <%}%>
          <a class="dropdown-item" href="sair.jsp">Sair</a>
        </div>
      </li>
      
      <%}%>
    
            </ul>
        </div>

</nav>

 <%@include  file="carrocel.jsp"%>

    <div class="container">
        <br>
        <form  name = "pacote"  id = "pacote" action="${pageContext.request.contextPath}/pacote" method="POST">

            <div class="row" style="width: 90%; height: 90%;">

                <%
                    listarPacotes listar = new listarPacotes();
                    listarImagens listarImagens = new listarImagens();

                    List<tbPacote> pacotes = listar.listar();
                    List<tbImagens> imagens;

                    int i = 0;

                    NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                            new Locale("pt", "BR"));

                    if (pacotes.size() > 0) {

                        for (Iterator iterator = pacotes.iterator(); iterator.hasNext();) {
                            tbPacote pacote = (tbPacote) iterator.next();
                            imagens = listarImagens.listar(pacote.getIdPacote());
                            


                %>

                <div class="col-lg-4 col-md-6 mb-4">
                    <div id="carouselExampleControls<%=i%>" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <%for (int j = 0; j < imagens.size(); j++) {
                                    String action = "";
                            %>

                            <%if (j == 0) {
                                    action = "active";
                                    

                                } else {
                                    action = "";
                                }
                            %>
                            <div id='slide<%=j%>' class="carousel-item <%=action%>">
                                <a href="pacote?destino=<%=pacote.getIdPacote()%>" ><img class="card-img-top" style='width: 350px; height: 200px' src="<%=pacote.getImagePath() + imagens.get(j).getNomeImagem()%>" alt="destino"></a>
                                <input type ='hidden' name ='destino' value="<%=pacote.getIdPacote()%>">
                            </div>
                            <%}%>

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls<%=i%>" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls<%=i%>" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">
                            <a href="pacote?destino=<%=pacote.getIdPacote()%>" style="text-decoration: none"><%=pacote.getLocalDestino()%></a>
                        </h4>
                        <h5><%=formatoMoeda.format(pacote.getValor())%></h5>
                        <p class="card-text"><%=pacote.getRoteiro()%></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                    </div>
                </div>

                <%
                        i++;

                    }
                } else {

                %>
                <style>
                    .center {
                        margin: auto;
                        width: 60%;
                        border: 3px solid #73AD21;
                        padding: 10px;
                    }
                </style>
                <div class='center'>
                    <h3 class="text-muted">Nenhum pacote recomendado encontrado</h3>
                </div>
                <%}%>

            </div>
        </form>

    </div>


    <footer class="my-5 pt-5 text-muted text-center text-small">
        <a href="sobre.jsp"><span class="text-primary">Sobre Orbis</span></a>
        <a href="termo"><span class="text-primary">Termo de Cancelamento</span></a>
        <a href="termo"><span class="text-primary">Política de Uso</span></a>
        <p class="mb-0">&copy; Orbis Eu Vou</p>
    </footer>

    <script src="js/confirmarsenha.js"></script>
    <script src="js/mascaraCNPJ.js"></script>
    <script src="js/confirmarsenha.js"></script>
    <script src="js/jquery.autocomplete.js"></script>
    <script>
        $("#query").autocomplete("getDataDestinos.jsp");
    </script>

    <script>
        /*window.onload = function () {
         
         $('#slide0').each(function (i, obj) {
         var slide = $(this);
         slide.addClass('active');
         
         console.log(obj);
         });
         
         };*/

    </script>


</html>
