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

%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="stylesheet" type="text/css" href="css/buttonvoltar.css">

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

        <!-- Custom styles for this template -->
        <link href="css/shop-item.css" rel="stylesheet">
        <link href="css/estrelas.css" rel="stylesheet">


        <link href="dist/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>


        <title>Quick Dashboard</title>

    </head>
    <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <style>
        .button {

            background-color: #000000;
            border: none;
            color: yellow;
            padding: 4px 8px;
            text-align: center;
            font-size: 20px;
            margin: 4px 2px;
            opacity: 0.5;
            transition: 0.3s;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }

        .button:hover {opacity: 2}
    </style>

    <style>
        img {
            opacity: 0.6;
            filter: alpha(opacity=50); /* For IE8 and earlier */
        }
    </style>
    <body  background="img/dashbg.jpg" style="opacity: 0.9;">

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

                    <form  class="form-inline" name = "buscar"  id = "buscar" action="${pageContext.request.contextPath}/Buscar" method="POST">

                        <!--end of col-->
                        <div class="mr-2">
                            <input id="query" name="busca" class="form-control col-lg-25" type="search" required placeholder="Pesquisar">
                        </div>
                        <!--end of col-->
                        <div class="">
                            <button class="btn btn-outline-success" type="submit"><img src="img/search_icon.png" width="25" height="25" class="d-inline-block align-top" alt=""></button>
                        </div>
                        <span class="glyphicon glyphicon-search"></span>

                    </form>

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
                                <h1>Criar conta</h1>
                                <p>Preencha os dados para criar sua conta.</p>
                                <hr>

                                <label for="nome"><b>Nome</b></label>
                                <input type="text" autocomplete="off" placeholder="Exemplo: Wilson ou Dora" name="nome" id = 'nome' required>

                                <label for="email"><b>Email</b></label>
                                <input type="text" autocomplete="off" placeholder="Inserir Email" name="email" id='email' required>

                                <label for="rg"><b>RG</b></label>
                                <input type="text" onkeydown="javascript: fMasc(this, mRG);" maxlength="15" autocomplete="off" placeholder="RG" name="rg" id = 'rg' required>

                                <label for="cpf"><b>CPF</b></label>
                                <input type="text" onkeydown="javascript: fMasc(this, mCPF);" onblur="naBase(this.value)"  maxlength="14" autocomplete="off" placeholder="CPF" name="cpf" id = 'cpf' required>

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


        <%        if (mobile == false) {

        %>
        <%@include  file = "navbarTest.jsp"%>        
        <p></p>
        <%}%>  

        <%        if (mobile == true) {
        %>      
        <div class="btn-group mr-2">
            <form name ="home">    
                <li class="nav-item">

                    <button  formaction="gerenciarPacotes.jsp" class = "button" ><span data-feather="home"></span> Voltar</button>
                </li>
            </form>
        </div>
        <%}%>
        <form name = "Dashboard" action="${pageContext.request.contextPath}/dashboard" method="GET">


            <div  class="container-fluid fonteDash">
                <div class="row">
                    <!--bg-dark-->
                    <%if (mobile == false) {%>
                    <nav class="col-md-2 d-none d-md-block sidebar" style="width: 70%;">
                        <div class="sidebar-sticky" >
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <span data-feather="home"></span>
                                    <button  formaction="gerenciarPacotes.jsp" class = "button">Voltar</button>
                                </li>
                            </ul>
                            <div class="col-md-8 mb-0 fonteDash">
                                <select name = "year" class="custom-select d-block w-100" id="year" >
                                    <option id="ano0">${year}</option>
                                    <option id="ano1">2017</option>
                                    <option id="ano2">2018</option>
                                    <option id="ano3">2019</option>
                                </select>
                                <div class="invalid-feedback">
                                    Favor selecionar o Ano..
                                </div>
                                <button  type="submit" class = "button" ><strong>Atualizar</strong></button>

                            </div>
                        </div>

                    </nav>
                    <%}%>


                    <style type="text/css">
                        .fonteDash {
                            color: yellow;
                            max-width: 100%;

                        }
                    </style>

                    <style>

                        .zoom {
                            zoom: 100%;
                            max-width: 100%;

                        }                   
                    </style>

                    <!--style = "background-color: #454545"-->
                    <main  role="main" class ="col-md-10 ml-sm-auto col-lg-10 pt-3 px-4">
                        <div class = "fonteDash zoom" align ="center">
                            <canvas  id="Quantidades"></canvas>
                            <br>
                            <canvas  id="Valores"></canvas>
                            <br>
                        </div>
                    </main>
                </div>
            </div>
    </body>
    <br>
</form>

<link href="dist/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="dist/jquery.vmap.js"></script>
<script type="text/javascript" src="dist/maps/jquery.vmap.world.js" charset="utf-8"></script>
<script type="text/javascript" src="dist/maps/jquery.vmap.world" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.vmap.sampledata.js"></script>





<!-- Bootstrap core JavaScript
================================================== -->

<!-- graficos-->
<script src="js/Chart.bundle.js"></script>
<script src="js/utils.js"></script>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
                                        feather.replace()
</script>
<script>


    // 01 - Quantidade vendas por mes

    var janeiro = "${janeiro}"
    var fevereiro = "${fevereiro}"
    var marco = "${marco}"
    var abril = "${abril}"
    var maio = "${maio}"
    var junho = "${junho}"
    var julho = "${julho}"
    var agosto = "${agosto}"
    var setembro = "${setembro}"
    var outubro = "${outubro}"
    var novembro = "${novembro}"
    var dezembro = "${dezembro}"

    var year = "${year}"

    var quantideConfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        janeiro,
                        fevereiro,
                        marco,
                        abril,
                        maio,
                        junho,
                        julho,
                        agosto,
                        setembro,
                        outubro,
                        novembro,
                        dezembro
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.grey,
                        window.chartColors.aqua,
                        window.chartColors.yellowgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.olive,
                        window.chartColors.darkcyan,
                        window.chartColors.purple,
                        window.chartColors.darkgreen,
                        window.chartColors.lightcoral

                    ],

                }],
            labels: [
                "Janeiro: " + "${janeiro}",
                "Fevereiro: " + "${fevereiro}",
                "Março: " + "${marco}",
                "Abril: " + "${abril}",
                "Maio: " + "${maio}",
                "Junho: " + "${junho}",
                "Julho: " + "${julho}",
                "Agosto: " + "${agosto}",
                "Setembro: " + "${setembro}",
                "Outubro: " + "${outubro}",
                "Novembro: " + "${novembro}",
                "Dezembro: " + "${dezembro}"
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '01 - Vendas por mês ' + year
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
            },
            tooltips: {
                callbacks: {
                    label: function (tooltipItem) {
                        return tooltipItem.yLabel;
                    }
                }
            }
        }
    };


    // 02 - Valores vendas por mes

    var janeiro = "${janeiroV}"
    var fevereiro = "${fevereiroV}"
    var marco = "${marcoV}"
    var abril = "${abrilV}"
    var maio = "${maioV}"
    var junho = "${junhoV}"
    var julho = "${julhoV}"
    var agosto = "${agostoV}"
    var setembro = "${setembroV}"
    var outubro = "${outubroV}"
    var novembro = "${novembroV}"
    var dezembro = "${dezembroV}"

    var year = "${year}"

    var valoresConfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        janeiro,
                        fevereiro,
                        marco,
                        abril,
                        maio,
                        junho,
                        julho,
                        agosto,
                        setembro,
                        outubro,
                        novembro,
                        dezembro
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.grey,
                        window.chartColors.aqua,
                        window.chartColors.yellowgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.olive,
                        window.chartColors.darkcyan,
                        window.chartColors.purple,
                        window.chartColors.darkgreen,
                        window.chartColors.lightcoral

                    ],

                }],
            labels: [
                "Janeiro: " + "${janeiroF}",
                "Fevereiro: " + "${fevereiroF}",
                "Março: " + "${marcoF}",
                "Abril: " + "${abrilF}",
                "Maio: " + "${maioF}",
                "Junho: " + "${junhoF}",
                "Julho: " + "${julhoF}",
                "Agosto: " + "${agostoF}",
                "Setembro: " + "${setembroF}",
                "Outubro: " + "${outubroF}",
                "Novembro: " + "${novembroF}",
                "Dezembro: " + "${dezembroF}"
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '01 - Valores Vendas por mês ' + year
            },
            legend: {
                display: false
            },
            scales: {
                yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
            },
            tooltips: {
                callbacks: {
                    label: function (tooltipItem) {
                        return tooltipItem.yLabel;
                    }
                }
            }
        }
    };


    window.onload = function () {


        Chart.defaults.global.defaultFontColor = 'yellow';

        var quantidadeMes = document.getElementById("Quantidades").getContext("2d");
        window.myPie = new Chart(quantidadeMes, quantideConfig);


        var valoresMes = document.getElementById("Valores").getContext("2d");
        window.myPie = new Chart(valoresMes, valoresConfig);


    }


</script>
<script src="js/formatarMoeda.js"></script>
<script src="js/jquery.js"></script>


<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    feather.replace()
</script>


</html>
