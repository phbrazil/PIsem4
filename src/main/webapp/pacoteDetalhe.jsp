
<%@page import="orbis.model.imagensPacote.tbImagens"%>
<%@page import="java.util.List"%>
<%@page import="orbis.DAO.pacote.listarImagens"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="orbis.model.pacote.tbPacote"%>
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
        <meta name="description" content="site de pacotes de excursao senac">
        <meta name="author" content="paulo bezerra, lucas medeiros, andre pereira">

        <title>Orbis Eu Vou</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-item.css" rel="stylesheet">

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

        <%
            tbPacote pacote = (tbPacote) request.getAttribute("pacote");

            listarImagens listarImagens = new listarImagens();

            List<tbImagens> imagens;

            imagens = listarImagens.listar(pacote.getIdPacote());

            NumberFormat formatoMoeda = NumberFormat.getCurrencyInstance(
                    new Locale("pt", "BR"));

        %>
        <!-- Page Content -->
        <div class="container">

            <div class="row">


                <div class="col-lg-16">

                    <form class = "modal-content" name = "checkOut"  id = "checkOut" action="${pageContext.request.contextPath}/checkOut" method="POST">


                        <div class="card mt-4">
                            <div class="col-lg-12 col-md-6 mb-4">
                                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
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
                                            <a href="pacote?destino=<%=pacote.getIdPacote()%>" ><img class="card-img-top" style='width: 800px; height: 400px' src="<%=pacote.getImagePath() + imagens.get(j).getNomeImagem()%>" alt="destino"></a>
                                            <input type ='hidden' name ='destino' value="<%=pacote.getIdPacote()%>">
                                        </div>
                                        <%}%>

                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
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
                                <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
                                4.0 stars
                                <input type="hidden" value= "<%=pacote.getIdPacote()%>" name="idpacote">
                                <input type="submit" value= "Comprar Agora" style='float: right; ' class="btn btn-success">

                            </div>

                        </div>
                        <!-- /.card -->

                        <div class="card card-outline-secondary my-4">
                            <div class="card-header">
                                Reviews do Produto
                            </div>
                            <div class="card-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
                                <small class="text-muted">Posted by Anonymous on 3/1/17</small>
                                <hr>
                                <a href="#" class="btn btn-success">Deixe um comentário</a>
                            </div>
                        </div>

                    </form>
                    <!-- /.card -->

                </div>


                <!-- /.col-lg-9 -->

            </div>

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-light"  style="background-color: #b0cff1">
            <div class="container">
                <p class="m-0 text-center text-dark" >Copyright &copy; Orbis Eu Vou</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
