
<!DOCTYPE html>

<html>
    
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
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
            }
        @media only screen and (max-width: 990px) {
                div.logo {
                display: none;
               }
            }
        @media only screen and (min-width: 990px) {
            div.espaco {
             display: none;
               }
            }
    </style>

 <nav class="navbar navbar-expand-lg navbar-light  text-dark fixed-top" style="background-color:#c5c5c1">

                <div class="logo" id="logo" name="logo">
                    <a class="navbar-brand" href="index.jsp" >
                    <img src="img/orbis_logo.png" width="80" height="40" class="d-inline-block align-top" alt="">
                    </a>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse collapse navbar-collapse mr-5" id="navbarResponsive">
                    <ul class="navbar-nav mr-auto">
         
                    </ul>

 <%if (nomeUser == null) {

    %>
    <ul class="navbar-nav ml-10">
        

     <div class="nav-item dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Menu
        </button>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="login.jsp">Efetuar login</a>
          <a class="dropdown-item" href="#" onclick="document.getElementById('id01').style.display = 'block'" >Cadastre-se</a>
          <a class="dropdown-item" href="sobre.jsp">Sobre o Orbis</a>
          <a class="dropdown-item" href="ajuda.jsp">Ajuda</a>

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


          <a class="dropdown-item" href="clienteConsultaID?id=<%=idUser%>">Minha conta</a>

          <a class="dropdown-item" href="minhasCompras">Minhas compras</a>
           <%if (idgrupo == 1) {%>
          <a class="dropdown-item" href="gerenciarPacotes.jsp">Administração</a>
          <%}%>
          <a class="dropdown-item" href="sobre.jsp">Sobre o Orbis</a>
          <a class="dropdown-item" href="ajuda.jsp">Ajuda</a>
          <a class="dropdown-item" href="sair.jsp">Sair</a>
        </div>
      </div>
      
      <%}%>
    
            </ul>
        </div>

</nav>
 
<div class="espaco" >
    <br>
    <br>
    <br>

</div>

</html>
