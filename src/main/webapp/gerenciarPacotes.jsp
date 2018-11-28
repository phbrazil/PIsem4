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
<html lang="en">

    <head>

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

    <body style="background: #dcdee4">

        <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light  text-dark fixed-top" style="background-color:#c5c5c1">

                <a class="navbar-brand" href="index.jsp">
                  <img src="img/orbis_logo.png" width="80" height="40" class="d-inline-block align-top" alt="">
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav mr-auto">
                        
                  
                    
                    </ul>

 <%if (nomeUser == null) {

    %>
    <ul class="navbar-nav ml-auto">

     <div class="nav-item dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown user
        </button>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#" onclick="document.getElementById('id01').style.display = 'block'" >Criar Conta</a>
          <a class="dropdown-item" href="login.jsp">Já tenho Conta</a>
        </div>
      </div>

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

     <div class="nav-item dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Olá <%=nomeUser%>
        </button>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="minhasCompras.jsp">Minhas compras</a>
           <%if (idgrupo == 1) {%>
          <a class="dropdown-item" href="gerenciarPacotes.jsp">Gerenciar Pacotes</a>
          <%}%>
          <a class="dropdown-item" href="sair.jsp">Sair</a>
        </div>
      </div>
      
      <%}%>
    
            </ul>
        </div>

</nav>
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
                    </a></div>
                <div class="col-lg-2 col-sm-6 text-center mb-4"><a style="text-decoration: none" href="consultaPacoteEditar.jsp">
                        <img class="rounded-circle img-fluid d-block mx-auto" src="img/editPacote.png" alt="">
                        <h3>Alterar Pacotes
                        </h3>
                    </a></div>
                <!--div class="col-lg-2 col-sm-6 text-center mb-4">
                    <img class="rounded-circle img-fluid d-block mx-auto" src="img/deletePacote.png" alt="">
                    <h3>Excluir Pacotes
                    </h3>
                </div-->
                <div class="col-lg-2 col-sm-6 text-center mb-4">
                    <img class="rounded-circle img-fluid d-block mx-auto" src="img/reportsPacotes.jpeg" alt="">
                    <h3>Relatórios
                    </h3>
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
