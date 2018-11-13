<%
    HttpSession sessao = request.getSession();

    Integer idgrupo = (Integer) sessao.getAttribute("idgrupo");
    boolean mobile = (Boolean) session.getAttribute("mobile");

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

        <link href="../dist/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>


        <title>Quick Dashboard</title>



        <!--ESSE SITE AQUI AJUDA A FORMATAR-->
        <!--https://canvasjs.com/docs/charts/basics-of-creating-html5-chart/labels-index-labels/-->


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


        <%        if (mobile == true) {
        %>      
        <div class="btn-group mr-2">
            <form name ="home">    
                <li class="nav-item">

                    <button  formaction="Home.jsp" class = "button" ><span data-feather="home"></span> Voltar</button>
                </li>
            </form>
        </div>
        <%}%>
        <form name = "Dashboard" action="${pageContext.request.contextPath}/DashboardFullDetails" method="POST">

            <div  class="container-fluid fonteDash">
                <div class="row">
                    <!--bg-dark-->
                    <%if (mobile == false) {%>
                    <nav class="col-md-2 d-none d-md-block sidebar" style="width: 70%;">
                        <div class="sidebar-sticky" >
                            <ul class="nav flex-column">
                                <li class="nav-item">
                                    <a class="nav-link active" href="ListarProjetosGeral?status=Todos&subarea=Todos&year=${year}">
                                        All Projects <span class="sr-only">(current)</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <span data-feather="folder"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Open">Open</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="file"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Lost">Lost</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="folder"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Won">Won</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="folder"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Closed">Closed</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="file"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Canceled">Canceled</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="folder"></span>
                                    <button  type="submit" name = "type" class = "button" value = "Total">Total</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="home"></span>
                                    <button  formaction="WorldMap.jsp" class = "button">Map</button>
                                </li>
                                <li class="nav-item">
                                    <span data-feather="home"></span>
                                    <button  formaction="Home.jsp" class = "button">Voltar</button>
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
                                <button  type="submit" name = "type" class = "button" value = "Won"><strong>Atualizar</strong></button>

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
                            <canvas  id="GM"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="ProjectsQtd"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <h4><strong>01 - ${type} GM per Area ${year}</strong></h4>
                            <canvas id="GMPerArea"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <h4><strong>07 - ${type} Quantity per Area ${year}</strong></h4>
                            <canvas  id="QTDPerArea"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <h4><strong>08 - ${type} Percentage over Total ${year}</strong></h4>
                            <canvas id="Percentage"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <h4><strong>02 - ${type} Average per Area ${year}</strong></h4>
                            <canvas  id="Average"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="TopClients"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="TopClientsQTD"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="WonVSOpen"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="TopSector"></canvas>
                            <br>
                            <p class="border-bottom"></p>
                            <canvas id="TopSectorGM"></canvas>
                            <br>

                            <p class="border-bottom"></p>
                        </div>
                    </main>
                </div>
            </div>
            <!--div align="center">
                <div id="vmap" style="width: 800px; height: 600px;"></div>
            </div-->

    </body>
    <br>
</form>

<link href="../dist/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="dist/jquery.vmap.js"></script>
<script type="text/javascript" src="dist/maps/jquery.vmap.world.js" charset="utf-8"></script>
<script type="text/javascript" src="dist/maps/jquery.vmap.world" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery.vmap.sampledata.js"></script>

<!--script>

    myArray = [
        {name: "br", value: "1"},
        {name: "2", value: "50"},
        {name: "3", value: "12"}
    ];
    jQuery(document).ready(function () {
        jQuery('#vmap').vectorMap({
            map: 'world_en',
            backgroundColor: 'transparent',
            color: '#ffffff',
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: true,
            showTooltip: true,
            scaleColors: ['#C8EEFF', '#006491'],
            values: sample_data,
            normalizeFunction: 'polynomial'
        });
    });
</script-->




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


    //GM PER AREA - CODE 01
    var gmhub = "${gmhub}";
    var gmservices = "${gmservices}";
    var gmkey = "${gmkey}";
    var gmincentive = "${gmincentive}";
    var gmproprietarios = "${gmproprietarios}";
    var gmonemci = "${gmonemci}";

    var year = "${year}";
    var per = "${per}";


    var gmperareaconfig = {
        type: 'pie',
        data: {
            datasets: [{
                    data: [
                        gmhub,
                        gmservices,
                        gmkey,
                        gmincentive,
                        gmproprietarios,
                        gmonemci
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.darkcyan,
                        window.chartColors.darkgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.azure

                    ],
                    label: 'Dataset 1'
                }],
            labels: [
                'Hub ' + "${gmhubformatado}",
                'Services ' + "${gmservicesformatado}",
                'Key Accounts ' + "${gmkeyformatado}",
                'Incentive/Ovation ' + "${gmincentiveformatado}",
                'Proprietários ' + "${gmproprietariosformatado}",
                'One MCI ' + "${gmonemciformatado}"
            ]
        },
        options: {
            responsive: true
        }
    };


    // QUANTITY PER AREA CODE 07

    var qtdhub = "${qtdhub}";
    var qtdservices = "${qtdservices}";
    var qtdkey = "${qtdkey}";
    var qtdincentive = "${qtdincentive}";
    var qtdproprietarios = "${qtdproprietarios}";
    var qtdonemci = "${qtdonemci}";


    var year = "${year}";
    var per = "${per}";


    var qtdperareaconfig = {
        type: 'pie',
        data: {
            datasets: [{
                    data: [
                        qtdhub,
                        qtdservices,
                        qtdkey,
                        qtdincentive,
                        qtdproprietarios,
                        qtdonemci
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.darkcyan,
                        window.chartColors.darkgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.azure,
                    ],
                    label: 'Dataset 1'
                }],
            labels: [
                'Hub ' + qtdhub,
                'Services ' + qtdservices,
                'Key Accounts ' + qtdkey,
                'Incentive/Ovation ' + qtdincentive,
                'Proprietários ' + qtdproprietarios,
                'One MCI ' + qtdonemci

            ]
        },
        options: {
            responsive: true
        }
    };



    //AVERAGE PER AREA CODE 02

    var hubaverageformatado = "${hubaverageformatado}"
    var servicesaverageformatado = "${servicesaverageformatado}"
    var keyaverageformatado = "${keyaverageformatado}"
    var incentiveaverageformatado = "${incentiveaverageformatado}"
    var propaverageformatado = "${propaverageformatado}"
    var onemciaverageformatado = "${onemciaverageformatado}"

    var hubaverage = "${hubaverage}"
    var servicesaverage = "${servicesaverage}"
    var keyaverage = "${keyaverage}"
    var incentiveaverage = "${incentiveaverage}"
    var propaverage = "${propaverage}"
    var onemciaverage = "${onemciaverage}"

    var year = "${year}"
    var per = "${per}"


    var averageconfig = {
        type: 'pie',
        data: {

            datasets: [{

                    data: [
                        hubaverage,
                        servicesaverage,
                        keyaverage,
                        incentiveaverage,
                        propaverage,
                        onemciaverage
                    ],
                    backgroundColor: [
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.darkmagenta,
                        window.chartColors.darkcyan,
                        window.chartColors.azure

                    ],
                    //label: "Top Clients " + year

                }],
            labels: [
                'Hub ' + hubaverageformatado,
                'Services ' + servicesaverageformatado,
                'Key Accounts ' + keyaverageformatado,
                'Incentive/Ovation ' + incentiveaverageformatado,
                'Proprietários ' + propaverageformatado,
                'One MCI ' + onemciaverageformatado

            ]
        },
        options: {
            responsive: true
        }
    };


    //TOP CLIENTS GM - CODE 03

    var nomecliente1 = "${topclients.get(0).clientenome}"
    var nomecliente2 = "${topclients.get(1).clientenome}"
    var nomecliente3 = "${topclients.get(2).clientenome}"
    var nomecliente4 = "${topclients.get(3).clientenome}"
    var nomecliente5 = "${topclients.get(4).clientenome}"
    var nomecliente6 = "${topclients.get(5).clientenome}"
    var nomecliente7 = "${topclients.get(6).clientenome}"
    var nomecliente8 = "${topclients.get(7).clientenome}"
    var nomecliente9 = "${topclients.get(8).clientenome}"
    var nomecliente10 = "${topclients.get(9).clientenome}"

    var clientegm1 = "${topclients.get(0).clientegm}"
    var clientegm2 = "${topclients.get(1).clientegm}"
    var clientegm3 = "${topclients.get(2).clientegm}"
    var clientegm4 = "${topclients.get(3).clientegm}"
    var clientegm5 = "${topclients.get(4).clientegm}"
    var clientegm6 = "${topclients.get(5).clientegm}"
    var clientegm7 = "${topclients.get(6).clientegm}"
    var clientegm8 = "${topclients.get(7).clientegm}"
    var clientegm9 = "${topclients.get(8).clientegm}"
    var clientegm10 = "${topclients.get(9).clientegm}"

    var clientegmf1 = "${topclients.get(0).clientegmf}"
    var clientegmf2 = "${topclients.get(1).clientegmf}"
    var clientegmf3 = "${topclients.get(2).clientegmf}"
    var clientegmf4 = "${topclients.get(3).clientegmf}"
    var clientegmf5 = "${topclients.get(4).clientegmf}"
    var clientegmf6 = "${topclients.get(5).clientegmf}"
    var clientegmf7 = "${topclients.get(6).clientegmf}"
    var clientegmf8 = "${topclients.get(7).clientegmf}"
    var clientegmf9 = "${topclients.get(8).clientegmf}"
    var clientegmf10 = "${topclients.get(9).clientegmf}"

    var year = "${year}"

    var type = "${type}"

    document.Dashboard.year = year;
    var topclientsconfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        clientegm1,
                        clientegm2,
                        clientegm3,
                        clientegm4,
                        clientegm5,
                                //clientegm6,
                                //clientegm7,
                                //clientegm8,
                                //clientegm9,
                                //clientegm10
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.grey,
                                //window.chartColors.yellowgreen,
                                //window.chartColors.darkmagenta,
                                //window.chartColors.olive,
                                //window.chartColors.darkcyan,
                                //window.chartColors.purple
                    ],
                    //label: "Top Clients " + year

                }],
            labels: [
                nomecliente1 + ' ' + clientegmf1,
                nomecliente2 + ' ' + clientegmf2,
                nomecliente3 + ' ' + clientegmf3,
                nomecliente4 + ' ' + clientegmf4,
                nomecliente5 + ' ' + clientegmf5,
                        //nomecliente6 + ' ' + clientegmf6,
                        // nomecliente7 + ' ' + clientegmf7,
                        //nomecliente8 + ' ' + clientegmf8,
                        //nomecliente9 + ' ' + clientegmf9,
                        //nomecliente10 + ' ' + clientegmf10
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '03 - ' + type + ' Top 5 Clients GM ' + year
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



    // TOP CLIENTS QTD CODE 04

    var nomecliente1qtd = "${topclientsQTD.get(0).clientenome}"
    var nomecliente2qtd = "${topclientsQTD.get(1).clientenome}"
    var nomecliente3qtd = "${topclientsQTD.get(2).clientenome}"
    var nomecliente4qtd = "${topclientsQTD.get(3).clientenome}"
    var nomecliente5qtd = "${topclientsQTD.get(4).clientenome}"
    var nomecliente6qtd = "${topclientsQTD.get(5).clientenome}"
    var nomecliente7qtd = "${topclientsQTD.get(6).clientenome}"
    var nomecliente8qtd = "${topclientsQTD.get(7).clientenome}"
    var nomecliente9qtd = "${topclientsQTD.get(8).clientenome}"
    var nomecliente10qtd = "${topclientsQTD.get(9).clientenome}"

    var clienteqtd1p = "${topclientsQTD.get(0).projectqtd}"
    var clienteqtd2p = "${topclientsQTD.get(1).projectqtd}"
    var clienteqtd3p = "${topclientsQTD.get(2).projectqtd}"
    var clienteqtd4p = "${topclientsQTD.get(3).projectqtd}"
    var clienteqtd5p = "${topclientsQTD.get(4).projectqtd}"
    var clienteqtd6p = "${topclientsQTD.get(5).projectqtd}"
    var clienteqtd7p = "${topclientsQTD.get(6).projectqtd}"
    var clienteqtd8p = "${topclientsQTD.get(7).projectqtd}"
    var clienteqtd9p = "${topclientsQTD.get(8).projectqtd}"
    var clienteqtd10p = "${topclientsQTD.get(9).projectqtd}"

    var year = "${year}"
    var type = "${type}"

    document.Dashboard.year = year;
    var topclientsqtdconfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        clienteqtd1p,
                        clienteqtd2p,
                        clienteqtd3p,
                        clienteqtd4p,
                        clienteqtd5p,
                                //clienteqtd6p,
                                //clienteqtd7p,
                                //clienteqtd8p,
                                //clienteqtd9p,
                                //clienteqtd10p
                    ],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.grey,
                                //window.chartColors.yellowgreen,
                                //window.chartColors.darkmagenta,
                                //window.chartColors.olive,
                                //window.chartColors.darkcyan,
                                //window.chartColors.purple
                    ],
                    //label: "Top Clients " + year

                }],
            labels: [
                nomecliente1qtd + ": " + clienteqtd1p,
                nomecliente2qtd + ": " + clienteqtd2p,
                nomecliente3qtd + ": " + clienteqtd3p,
                nomecliente4qtd + ": " + clienteqtd4p,
                nomecliente5qtd + ": " + clienteqtd5p,
                        //nomecliente6qtd + ": " + clienteqtd6p,
                        //nomecliente7qtd + ": " + clienteqtd7p,
                        //nomecliente8qtd + ": " + clienteqtd8p,
                        //nomecliente9qtd + ": " + clienteqtd9p,
                        //nomecliente10qtd + ": " + clienteqtd10p
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '04 - ' + type + ' Top 5 Clients per Quantity ' + year
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


    // TOP SECTOR QTD CODE 09

    var sector1 = "${topsector.get(0).industrysector}"
    var sector2 = "${topsector.get(1).industrysector}"
    var sector3 = "${topsector.get(2).industrysector}"
    var sector4 = "${topsector.get(3).industrysector}"
    var sector5 = "${topsector.get(4).industrysector}"
    var sector6 = "${topsector.get(5).industrysector}"
    var sector7 = "${topsector.get(6).industrysector}"
    var sector8 = "${topsector.get(7).industrysector}"
    var sector9 = "${topsector.get(8).industrysector}"
    var sector10 = "${topsector.get(9).industrysector}"

    var qtd1 = "${topsector.get(0).qtdprojects}"
    var qtd2 = "${topsector.get(1).qtdprojects}"
    var qtd3 = "${topsector.get(2).qtdprojects}"
    var qtd4 = "${topsector.get(3).qtdprojects}"
    var qtd5 = "${topsector.get(4).qtdprojects}"
    var qtd6 = "${topsector.get(5).qtdprojects}"
    var qtd7 = "${topsector.get(6).qtdprojects}"
    var qtd8 = "${topsector.get(7).qtdprojects}"
    var qtd9 = "${topsector.get(8).qtdprojects}"
    var qtd10 = "${topsector.get(9).qtdprojects}"

    var year = "${year}"
    var type = "${type}"

    document.Dashboard.year = year;
    var topsectorqtdconfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        qtd1,
                        qtd2,
                        qtd3,
                        qtd4,
                        qtd5,
                                //clienteqtd6p,
                                //clienteqtd7p,
                                //clienteqtd8p,
                                //clienteqtd9p,
                                //clienteqtd10p
                    ],
                    backgroundColor: [
                        window.chartColors.darkmagenta,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.grey,
                                //window.chartColors.yellowgreen,
                                //window.chartColors.darkmagenta,
                                //window.chartColors.olive,
                                //window.chartColors.darkcyan,
                                //window.chartColors.purple
                    ],
                    //label: "Top Clients " + year

                }],
            labels: [
                sector1 + ": " + qtd1,
                sector2 + ": " + qtd2,
                sector3 + ": " + qtd3,
                sector4 + ": " + qtd4,
                sector5 + ": " + qtd5,
                        //nomecliente6qtd + ": " + clienteqtd6p,
                        //nomecliente7qtd + ": " + clienteqtd7p,
                        //nomecliente8qtd + ": " + clienteqtd8p,
                        //nomecliente9qtd + ": " + clienteqtd9p,
                        //nomecliente10qtd + ": " + clienteqtd10p
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '09 - ' + type + ' Top 5 Industry Sector per Quantity ' + year
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

    //TOP SECTOR GM - CODE 10

    var nomesector1 = "${topsector.get(0).industrysector}";
    var nomesector2 = "${topsector.get(1).industrysector}";
    var nomesector3 = "${topsector.get(2).industrysector}";
    var nomesector4 = "${topsector.get(3).industrysector}";
    var nomesector5 = "${topsector.get(4).industrysector}";
    var nomesector6 = "${topsector.get(5).industrysector}";
    var nomesector7 = "${topsector.get(6).industrysector}";
    var nomesector8 = "${topsector.get(7).industrysector}";
    var nomesector9 = "${topsector.get(8).industrysector}";
    var nomesector10 = "${topsector.get(9).industrysector}";

    var gmsector1 = "${topsector.get(0).gmprojects}";
    var gmsector2 = "${topsector.get(1).gmprojects}";
    var gmsector3 = "${topsector.get(2).gmprojects}";
    var gmsector4 = "${topsector.get(3).gmprojects}";
    var gmsector5 = "${topsector.get(4).gmprojects}";
    var gmsector6 = "${topsector.get(5).gmprojects}";
    var gmsector7 = "${topsector.get(6).gmprojects}";
    var gmsector8 = "${topsector.get(7).gmprojects}";
    var gmsector9 = "${topsector.get(8).gmprojects}";
    var gmsector10 = "${topsector.get(9).gmprojects}";

    var year = "${year}";

    var type = "${type}";

    document.Dashboard.year = year;
    var topsectorgmconfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        gmsector1,
                        gmsector2,
                        gmsector3,
                        gmsector4,
                        gmsector5
                                //clientegm6,
                                //clientegm7,
                                //clientegm8,
                                //clientegm9,
                                //clientegm10
                    ],
                    backgroundColor: [
                        window.chartColors.darkmagenta,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.grey
                                //window.chartColors.yellowgreen,
                                //window.chartColors.darkmagenta,
                                //window.chartColors.olive,
                                //window.chartColors.darkcyan,
                                //window.chartColors.purple
                    ],
                    //label: "Top Sector " + year

                }],
            labels: [
                nomesector1 + ' ' + "${topsector.get(0).gmprojectsf}",
                nomesector2 + ' ' + "${topsector.get(1).gmprojectsf}",
                nomesector3 + ' ' + "${topsector.get(2).gmprojectsf}",
                nomesector4 + ' ' + "${topsector.get(3).gmprojectsf}",
                nomesector5 + ' ' + "${topsector.get(4).gmprojectsf}"
                        //nomecliente6 + ' ' + clientegmf6,
                        // nomecliente7 + ' ' + clientegmf7,
                        //nomecliente8 + ' ' + clientegmf8,
                        //nomecliente9 + ' ' + clientegmf9,
                        //nomecliente10 + ' ' + clientegmf10
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '10 - ' + type + ' Top 5 Industry Sector per GM ' + year
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




    // DASHBOARD GM PER MONTH CODE 05

    var janeiro = "${dashboard.janeiro}"
    var fevereiro = "${dashboard.fevereiro}"
    var marco = "${dashboard.marco}"
    var abril = "${dashboard.abril}"
    var maio = "${dashboard.maio}"
    var junho = "${dashboard.junho}"
    var julho = "${dashboard.julho}"
    var agosto = "${dashboard.agosto}"
    var setembro = "${dashboard.setembro}"
    var outubro = "${dashboard.outubro}"
    var novembro = "${dashboard.novembro}"
    var dezembro = "${dashboard.dezembro}"

    var type = "${type}"
    var year = "${year}"

    var gmconfig = {
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
                "Janeiro: " + "${formatado.janeiro}",
                "Fevereiro: " + "${formatado.fevereiro}",
                "Março: " + "${formatado.marco}",
                "Abril: " + "${formatado.abril}",
                "Maio: " + "${formatado.maio}",
                "Junho: " + "${formatado.junho}",
                "Julho: " + "${formatado.julho}",
                "Agosto: " + "${formatado.agosto}",
                "Setembro: " + "${formatado.setembro}",
                "Outubro: " + "${formatado.outubro}",
                "Novembro: " + "${formatado.novembro}",
                "Dezembro: " + "${formatado.dezembro}"
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '05 - ' + type + ' GM per Month ' + year
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


    // PROJECTS QTD CODE 06

    var janeiro = "${dashboardqtd.janeiro}"
    var fevereiro = "${dashboardqtd.fevereiro}"
    var marco = "${dashboardqtd.marco}"
    var abril = "${dashboardqtd.abril}"
    var maio = "${dashboardqtd.maio}"
    var junho = "${dashboardqtd.junho}"
    var julho = "${dashboardqtd.julho}"
    var agosto = "${dashboardqtd.agosto}"
    var setembro = "${dashboardqtd.setembro}"
    var outubro = "${dashboardqtd.outubro}"
    var novembro = "${dashboardqtd.novembro}"
    var dezembro = "${dashboardqtd.dezembro}"


    var projectsqtdconfig = {
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
                        window.chartColors.darkcyan,
                        window.chartColors.darkgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.aqua,
                        window.chartColors.olive,
                        window.chartColors.orange,
                        window.chartColors.purple,
                        window.chartColors.yellowgreen,
                        window.chartColors.lightcoral,
                        window.chartColors.grey
                    ],
                    label: 'Dataset 1'
                }],
            labels: [
                'Janeiro: ' + janeiro,
                'Fevereiro: ' + fevereiro,
                'Março: ' + marco,
                'Abril: ' + abril,
                'Maio: ' + maio,
                'Junho: ' + junho,
                'Julho: ' + julho,
                'Agosto: ' + agosto,
                'Setembro: ' + setembro,
                'Outubro: ' + outubro,
                'Novembro: ' + novembro,
                'Dezembro: ' + dezembro
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '06 - ' + type + ' Quantity per Month ' + year
            },
            legend: {
                display: false,
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


    // 07 - WON VS OPEN GM 

    var gmconfirmed = "${gmconfirmed}"
    var gmlost = "${gmlost}"
    var gmweighted = "${gmweighted}"
    var gmconfirmedf = "${gmconfirmedf}"
    var gmlostf = "${gmlostf}"
    var gmweightedf = "${gmweightedf}"

    var type = "${type}"
    var year = "${year}"

    var wonopenconfig = {
        type: 'bar',
        data: {

            datasets: [{

                    data: [
                        gmconfirmed,
                        gmweighted,
                        gmlost
                    ],
                    backgroundColor: [
                        window.chartColors.darkgreen,
                        window.chartColors.blue,
                        window.chartColors.red
                    ],

                }],
            labels: [
                "Won " + "${gmconfirmedf}",
                "Weighted " + "${gmweightedf}",
                "Lost " + "${gmlostf}"
            ]
        },
        options: {
            title: {
                display: true,
                fontSize: 30,
                text: '11 - Forecasted Business ' + year
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


    // 08 - PERCENTAGE OVER TOTAL

    var hubpercentage = "${hubpercentage}"
    var servicespercentage = "${servicespercentage}"
    var keypercentage = "${keypercentage}"
    var ovationpercentage = "${ovationpercentage}"
    var proppercentage = "${proppercentage}"
    var onemcipercentage = "${onemcipercentage}"

    var year = "${year}";
    var per = "${per}";


    var percentageconfig = {
        type: 'pie',
        data: {
            datasets: [{
                    data: [
                        hubpercentage,
                        servicespercentage,
                        keypercentage,
                        ovationpercentage,
                        proppercentage,
                        onemcipercentage
                    ],
                    backgroundColor: [
                        window.chartColors.lightcoral,
                        window.chartColors.orange,
                        window.chartColors.darkcyan,
                        window.chartColors.darkgreen,
                        window.chartColors.darkmagenta,
                        window.chartColors.azure,
                    ],
                    label: 'Dataset 1'
                }],
            labels: [
                'Hub ' + Math.round(hubpercentage) + '%',
                'Services ' + Math.round(servicespercentage) + '%',
                'Key Accounts ' + Math.round(keypercentage) + '%',
                'Incentive/Ovation ' + Math.round(ovationpercentage) + '%',
                'Proprietários ' + Math.round(proppercentage) + '%',
                'One MCI ' + Math.round(onemcipercentage) + '%'
            ]
        },
        options: {
            responsive: true
        }
    };


    window.onload = function () {


        Chart.defaults.global.defaultFontColor = 'yellow';

        var percentage = document.getElementById("Percentage").getContext("2d");
        window.myPie = new Chart(percentage, percentageconfig);

        var wonopen = document.getElementById("WonVSOpen").getContext("2d");
        window.myPie = new Chart(wonopen, wonopenconfig);

        var gmarea = document.getElementById("GMPerArea").getContext("2d");
        window.myPie = new Chart(gmarea, gmperareaconfig);

        var qtdarea = document.getElementById("QTDPerArea").getContext("2d");
        window.myPie = new Chart(qtdarea, qtdperareaconfig);


        var topclients = document.getElementById("TopClients").getContext("2d");
        window.myPie = new Chart(topclients, topclientsconfig);

        var projectqtd = document.getElementById("TopClientsQTD").getContext("2d");
        window.myPie = new Chart(projectqtd, topclientsqtdconfig);

        var gm = document.getElementById("GM").getContext("2d");
        window.myPie = new Chart(gm, gmconfig);

        var projectqtd = document.getElementById("ProjectsQtd").getContext("2d");
        window.myPie = new Chart(projectqtd, projectsqtdconfig);

        var average = document.getElementById("Average").getContext("2d");
        window.myPie = new Chart(average, averageconfig);

        var topsector = document.getElementById("TopSector").getContext("2d");
        window.myPie = new Chart(topsector, topsectorqtdconfig);

        var topsectorgm = document.getElementById("TopSectorGM").getContext("2d");
        window.myPie = new Chart(topsectorgm, topsectorgmconfig);





    }


</script>
<script src="../js/formatarMoeda.js"></script>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    feather.replace()
</script>


</html>
