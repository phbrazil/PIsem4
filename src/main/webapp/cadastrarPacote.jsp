<!--**
 *
 * @author paulo.bezerra
 *-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessao = request.getSession();

%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Bootstrap core CSS -->
        <!--link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="css/button.css">
        <link rel="stylesheet" type="text/css" href="css/buttondelete.css">
        <link rel="stylesheet" type="text/css" href="css/gravar.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <link rel="stylesheet" type="text/css" href="css/tooltip.css" />
        <link rel="stylesheet" type="text/css" href="css/collapse_button.css" />
        <link rel="stylesheet" type="text/css" href="css/customAlert.css" />

        <!-- Custom fonts for this template -->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="vendor/devicons/css/devicons.min.css" rel="stylesheet">
        <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width, initial-scale=1.0">


        <title>Cadastrar Pacote</title>

    </head>
    <body id="page-top">



        <style>

            span{
                position:relative;
                margin-right:-20px
            }
            input[type='number']{
                padding-left:20px;
                text-align:left;
            }


        </style>

        <form name = "Projetos"  id = "criarprojeto" action="${pageContext.request.contextPath}/CadastrarProjeto" method="POST">

            <br>
            <div align ="center">
                <div align = "center" >
                    <h3>
                        <span class="text-muted">Cadastrar Pacote</span>
                    </h3>
                </div>
                <br>
                <p></p>
                <h5 class="mb-0">
                    <span class="text-primary">Dados do Pacote</span>
                </h5>
                <br>

                <div class="col-md-9 order-md-1">
                    <div class="row">
                        <div class="col-md-7 mb-3">
                            <label>MCI Standard Client Name</label>
                            <div class="input-group" title="Nome do Cliente">
                                <input data-toggle="tooltip" title="Nome do Cliente" data-placement="left" type="text" autocomplete="off" class="form-control" onblur="naBase(this.value)"  id="mcistdcliname" name="mcistdcliname" maxlength="70" placeholder="" required>
                                <div class="invalid-feedback" style="width: 100%;">
                                    Nome obrigatório.
                                </div>
                            </div>
                            <!--label id ='clientenovo' style='color: red; background-color: transparent; outline: none; border-color: inherit; box-shadow: none;'/-->
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>Additional / Final Client Name</label>
                            <div class="input-group" title="Nome adicional">
                                <input data-toggle="tooltip" title="Nome adicional do Cliente" data-placement="right" name="additionalclientname" autocomplete="off" type="text" class="form-control" id="additionalclientname" placeholder="Optional" value="" maxlength ="70">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label >Proposal Request Date</label>
                            <input name = "propreqdate" data-toggle="tooltip" title="Data da Proposta" data-placement="left" type="date" onblur="TamanhoData('propreqdate')" class="form-control" id="propreqdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>Industry Sector</label>
                            <select name = "industrysector" data-toggle="tooltip" title="Indústria do cliente" data-placement="bottom" class="custom-select d-block w-100" id="industrysector"  required>
                                <option>Agriculture & Chemical</option>
                                <option>Apparel, Fashion & Textiles </option>
                                <option>Art & Design</option>
                                <option>Automotive and Auto Parts</option>
                                <option>Aviation, Defence & Space </option>
                                <option>Banking, Finance and Investment Services </option>
                                <option>Consumer & Household Products (FMCG)</option>
                                <option>Education & Social Services</option>
                                <option>Energy, Environmental, Oil and Gas</option>
                                <option>Food, Beverages, Food Retailing</option>
                                <option>Gambling & Casinos </option>
                                <option>Gaming </option>
                                <option>Government </option>
                                <option>Healthcare, Pharmaceuticals, Biotechnology, Life Science, Medical Devices</option>
                                <option>Hotels & Hospitality & Travel </option>
                                <option>Industrial Goods and Services</option>
                                <option>Information Technology, Hardware & Software </option>
                                <option>Insurance </option>
                                <option>Legal </option>
                                <option>Luxury Goods & Jewellery</option>
                                <option>Media & Publishing </option>
                                <option>Mineral Resources, Materials and Mining</option>
                                <option>Multi-level Marketing</option>
                                <option>Professional Services & Business Services </option>
                                <option>Real Estate, Architecture, Construction & Building</option>
                                <option>Recreation, Entertainment, Film & Music</option>
                                <option>Retailing, Department Stores</option>
                                <option>Science, Engineering & Mathematics </option>
                                <option>Sports & Athletics </option>
                                <option>Telecommunications</option>
                                <option>Tobacco</option>
                                <option>Transport and Logistics</option>
                                <option>Utilities, Water and Electric</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar uma categoria..
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>Customer Type</label>
                            <select name = "customertype" data-toggle="tooltip" title="Tipo de cliente" data-placement="right" class="custom-select d-block w-100" id="customertype"  required>
                                <option>Corporation</option>
                                <option>Association</option>
                                <option>Government / other</option>
                                <option>Intermediary</option>
                                <option>Inter-Office</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar uma categoria..
                            </div>
                        </div>
                        <div class="container">
                            <div align = "center" >
                                <h5 class="mb-0">
                                    <span class="text-primary">Project Information</span>
                                </h5>
                            </div>
                            <br>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label>Project name</label>
                            <!--onkeydown="searchSuggestProjectname(this.value);"-->
                            <div class="input-group">
                                <input name="projectname" autocomplete="off" data-toggle="tooltip" title="Nome do projeto" data-placement="left" type="text" class="form-control" id="projectname" placeholder="" value="" maxlength ="70" required>
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                            <div id ="hintcode" style="color: red"></div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Project Analytical code</label>
                            <div class="input-group" data-toggle="tooltip" title="Código do Projeto criado no SAP" data-placement="bottom">
                                <input name="projectcode" min ="0" value="0" type="number" onkeyup="searchSuggestProjectCode(this.value);" class="form-control" id="projectcode" placeholder="" value="" maxlength ="50" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Starting date</label>
                            <input name = "eventstartdate"  data-toggle="tooltip" title="O projeto entrará no ano fiscal que inicia o evento" data-placement="right" type="date" onblur="TamanhoData('eventstartdate')" class="form-control"  id="eventstartdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Event Status</label>
                            <select name = "eventstatus" data-toggle="tooltip" title="Quando ocorrerá" class="custom-select d-block w-100" id="eventstatus"  required>
                                <option>Past</option>
                                <option>Future</option>
                                <option>Present</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o Status..
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Event Closing date</label>
                            <input name = "eventclosingdate" data-toggle="tooltip" title="Fim do Evento" data-placement="bottom" type="date" class="form-control" onblur="TamanhoData('eventclosingdate')" id="eventclosingdate" placeholder="dd/mm/aaaa" maxlength="10" value = "" required>
                            <div class="invalid-feedback">
                                Data necessária
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>N° of pax</label>
                            <div class="input-group">
                                <input name="paxnumber" data-toggle="tooltip" title="Participantes" data-placement="bottom" type= "number" class="form-control" min = "0" value ="0" id="paxnumber" placeholder="" value="" maxlength ="50" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Cancellation Insurance</label>
                            <select name = "cancelinsurance" data-toggle="tooltip" title="Seguro de Cancelamento"  data-placement="bottom" class="custom-select d-block w-100" id="cancelinsurance"  required>
                                <option>No</option>
                                <option>Yes</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar...
                            </div>
                        </div>
                        <div class ="col-md-2 mb-3" data-toggle="tooltip" title='Projeto envolve'  data-placement="right">
                            <input type="checkbox" name="option1" value = "Criação" > Criação<br>
                            <input type="checkbox" name="option2" value = "Planejamento"> Planej.<br>
                            <input type="checkbox" name="option3" value = "Produção"> Produção<br>
                            <input type="checkbox" name="option4" value = "Produção"> Logística<br>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Country</label>
                            <select name = "pais" data-toggle="tooltip" title='País que ocorrerá' data-placement="left" class="custom-select d-block w-100" id="pais" onblur="Localidade()" required>
                                <option>Diversos</option>
                                <option>Afeganistão</option>
                                <option>África do Sul</option>
                                <option>Albânia</option>
                                <option>Alemanha</option>
                                <option>Andorra</option>
                                <option>Angola</option>
                                <option>Antiga e Barbuda</option>
                                <option>Arábia Saudita</option>
                                <option>Argélia</option>
                                <option>Argentina</option>
                                <option>Arménia</option>
                                <option>Austrália</option>
                                <option>Áustria</option>
                                <option>Azerbaijão</option>
                                <option>Bahamas</option>
                                <option>Bangladexe</option>
                                <option>Barbados</option>
                                <option>Barém</option>
                                <option>Bélgica</option>
                                <option>Belize</option>
                                <option>Benim</option>
                                <option>Bielorrússia</option>
                                <option>Bolívia</option>
                                <option>Bósnia e Herzegovina</option>
                                <option>Botsuana</option>
                                <option selected>Brazil</option>
                                <option>Brunei</option>
                                <option>Bulgária</option>
                                <option>Burquina Faso</option>
                                <option>Burúndi</option>
                                <option>Butão</option>
                                <option>Cabo Verde</option>
                                <option>Camarões</option>
                                <option>Camboja</option>
                                <option>Canadá</option>
                                <option>Catar</option>
                                <option>Cazaquistão</option>
                                <option>Chade</option>
                                <option>Chile</option>
                                <option>China</option>
                                <option>Chipre</option>
                                <option>Colômbia</option>
                                <option>Comores</option>
                                <option>Congo-Brazzaville</option>
                                <option>Coreia do Norte</option>
                                <option>Coreia do Sul</option>
                                <option>Cosovo</option>
                                <option>Costa do Marfim</option>
                                <option>Costa Rica</option>
                                <option>Croácia</option>
                                <option>Cuaite</option>
                                <option>Cuba</option>
                                <option>Dinamarca</option>
                                <option>Dominica</option>
                                <option>Egito</option>
                                <option>Emirados Árabes Unidos</option>
                                <option>Equador</option>
                                <option>Eritreia</option>
                                <option>Eslováquia</option>
                                <option>Eslovénia</option>
                                <option>Espanha</option>
                                <option>Estado da Palestina</option>
                                <option>Estados Unidos</option>
                                <option>Estónia</option>
                                <option>Etiópia</option>
                                <option>Fiji</option>
                                <option>Filipinas</option>
                                <option>Finlândia</option>
                                <option>França</option>
                                <option>Gabão</option>
                                <option>Gâmbia</option>
                                <option>Gana</option>
                                <option>Geórgia</option>
                                <option>Granada</option>
                                <option>Grécia</option>
                                <option>Guatemala</option>
                                <option>Guiana</option>
                                <option>Guiné</option>
                                <option>Guiné Equatorial</option>
                                <option>Guiné-Bissau</option>
                                <option>Haiti</option>
                                <option>Honduras</option>
                                <option>Hungria</option>
                                <option>Iémen</option>
                                <option>Ilhas Marechal</option>
                                <option>Índia</option>
                                <option>Indonésia</option>
                                <option>Irão</option>
                                <option>Iraque</option>
                                <option>Irlanda</option>
                                <option>Islândia</option>
                                <option>Israel</option>
                                <option>Itália</option>
                                <option>Jamaica</option>
                                <option>Japão</option>
                                <option>Jibuti</option>
                                <option>Jordânia</option>
                                <option>Laus</option>
                                <option>Lesoto</option>
                                <option>Letónia</option>
                                <option>Líbano</option>
                                <option>Libéria</option>
                                <option>Líbia</option>
                                <option>Listenstaine</option>
                                <option>Lituânia</option>
                                <option>Luxemburgo</option>
                                <option>Macedónia</option>
                                <option>Madagáscar</option>
                                <option>Malásia</option>
                                <option>Maláui</option>
                                <option>Maldivas</option>
                                <option>Mali</option>
                                <option>Malta</option>
                                <option>Marrocos</option>
                                <option>Maurícia</option>
                                <option>Mauritânia</option>
                                <option>México</option>
                                <option>Mianmar</option>
                                <option>Micronésia</option>
                                <option>Moçambique</option>
                                <option>Moldávia</option>
                                <option>Mónaco</option>
                                <option>Mongólia</option>
                                <option>Montenegro</option>
                                <option>Namíbia</option>
                                <option>Nauru</option>
                                <option>Nepal</option>
                                <option>Nicarágua</option>
                                <option>Níger</option>
                                <option>Nigéria</option>
                                <option>Noruega</option>
                                <option>Nova Zelândia</option>
                                <option>Omã</option>
                                <option>Países Baixos</option>
                                <option>Palau</option>
                                <option>Panamá</option>
                                <option>Papua Nova Guiné</option>
                                <option>Paquistão</option>
                                <option>Paraguai</option>
                                <option>Peru</option>
                                <option>Polónia</option>
                                <option>Portugal</option>
                                <option>Quénia</option>
                                <option>Quirguistão</option>
                                <option>Quiribáti</option>
                                <option>Reino Unido</option>
                                <option>República Centro-Africana</option>
                                <option>República Checa</option>
                                <option>República Democrática do Congo</option>
                                <option>República Dominicana</option>
                                <option>Roménia</option>
                                <option>Ruanda</option>
                                <option>Rússia</option>
                                <option>Salomão</option>
                                <option>Salvador</option>
                                <option>Samoa</option>
                                <option>Santa Lúcia</option>
                                <option>São Cristóvão e Neves</option>
                                <option>São Marinho</option>
                                <option>São Tomé e Príncipe</option>
                                <option>São Vicente e Granadinas</option>
                                <option>Seicheles</option>
                                <option>Senegal</option>
                                <option>Serra Leoa</option>
                                <option>Sérvia</option>
                                <option>Singapura</option>
                                <option>Síria</option>
                                <option>Somália</option>
                                <option>Sri Lanca</option>
                                <option>Suazilândia</option>
                                <option>Sudão</option>
                                <option>Sudão do Sul</option>
                                <option>Suécia</option>
                                <option>Suíça</option>
                                <option>Suriname</option>
                                <option>Tailândia</option>
                                <option>Taiuã</option>
                                <option>Tajiquistão</option>
                                <option>Tanzânia</option>
                                <option>Timor-Leste</option>
                                <option>Togo</option>
                                <option>Tonga</option>
                                <option>Trindade e Tobago</option>
                                <option>Tunísia</option>
                                <option>Turcomenistão</option>
                                <option>Turquia</option>
                                <option>Tuvalu</option>
                                <option>Ucrânia</option>
                                <option>Uganda</option>
                                <option>Uruguai</option>
                                <option>Usbequistão</option>
                                <option>Vanuatu</option>
                                <option>Vaticano</option>
                                <option>Venezuela</option>
                                <option>Vietname</option>
                                <option>Zâmbia</option>
                                <option>Zimbábue</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar...
                            </div>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label>State</label>
                            <select name = "estado" data-toggle="tooltip" title='Estado que ocorrerá' data-placement="bottom" class="custom-select d-block w-100" id="estado"  required >
                                <option>São Paulo</option>
                                <option>Rio de Janeiro</option>
                                <option>Acre</option>
                                <option>Alagoas</option>
                                <option>Amapá</option>
                                <option>Amazonas</option>
                                <option>Bahia</option>
                                <option>Ceará</option>
                                <option>Distrito Federal</option>
                                <option>Espírito Santo</option>
                                <option>Goiás</option>
                                <option>Maranhão</option>
                                <option>Mato Grosso</option>
                                <option>Mato Grosso do Sul</option>
                                <option>Minas Gerais</option>
                                <option>Pará</option>
                                <option>Paraíba</option>
                                <option>Paraná</option>
                                <option>Pernambuco</option>
                                <option>Piauí</option>
                                <option>Rio Grande do Norte</option>
                                <option>Rio Grande do Sul</option>
                                <option>Rondônia</option>
                                <option>Roraima</option>
                                <option>Santa Catarina</option>
                                <option>Sergipe</option>
                                <option>Tocantins</option>
                                <option>Internacional</option>

                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar um Estado..
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>City</label>
                            <div class="input-group">
                                <input name="cidade" data-toggle="tooltip" title='Cidade que ocorrerá' data-placement="bottom" type="text" maxlength="60"  class="form-control" id="cidade" placeholder="Optional">
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>

                        <div class="col-md-2 mb-3">
                            <label>Probability (%)</label>
                            <div class="input-group">
                                <input name="probability" data-toggle="tooltip" title="Probabilidade de ganhar o projeto"  data-placement="right" value = "0" type="number" onblur="Probability()" min = "0" max ="100"  class="form-control" id="probability" placeholder="" required>
                                <div class="invalid-feedback">
                                    Resposta necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 mb-3">
                            <label>Status</label>
                            <select name = "projectstatus" data-toggle="tooltip" title='Status do Projeto'  data-placement="left" onblur="StatusVSProbability()" class="custom-select d-block w-100" id="projectstatus"  required>
                                <option>Open</option>
                                <option>Lost</option>
                                <option>Won</option>
                                <option>Closed</option>
                                <option>Canceled</option>

                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>Audit Status</label>
                            <select name = "projectaudit" data-toggle="tooltip" title='Status de auditoria' data-placement="bottom" class="custom-select d-block w-100" id="projectaudit"  required>
                                <option>Não Realizado</option>
                                <option>Em produção</option>
                                <option>Auditado</option>
                                <option>Realizado</option>
                                <option>N/A</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar o status...
                            </div>
                        </div>


                        <div class="col-md-2 mb-3">
                            <label>Area</label>
                            <select name = "subarea" data-toggle="tooltip" title='Área do evento' data-placement="bottom" class="custom-select d-block w-100" id="subarea"  required>
                                <option>HUB</option>
                                <option>Key Accounts</option>
                                <option>Services</option>
                                <option>Incentive/Ovation</option>
                                <option>Projetos Proprietários</option>
                                <option>One MCI</option>
                            </select>

                            <div class="invalid-feedback">
                                Favor selecionar a Area...
                            </div>
                        </div>                     
                        <div class="col-md-5 mb-3">
                            <label>MCI Contact</label>
                            <div class="input-group">
                                <input name="contatomci" data-toggle="tooltip" title='Contato da MCI'  data-placement="right" autocomplete = "off" type="text" onblur="naBaseContato(this.value)" class="form-control" id="contatomci" placeholder="" value="" maxlength ="40" required>
                                <div class="invalid-feedback">
                                    Nome necessário
                                </div>
                            </div>
                        </div>

                    </div>

                    <h5 class="mb-0">
                        <span class="text-primary">Gross Margin Information</span>
                    </h5>
                    <br>
                    <div class="row">

                        <br>
                        <div class="col-md-3 mb-3">
                            <label>Turnover Forecasted by Project Owner</label>
                            <div class="input-group">
                                <input name="turnoverforowner" data-toggle="tooltip"  data-placement="left" title="Budget do cliente" type="text" min="0" step="0,01" class="form-control"  id="turnoverforowner" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 mb-3">
                            <label>GM forecasted <br>by project owner</label>
                            <div class="input-group">
                                <input name="gmforowner" data-toggle="tooltip" title="Valor esperado de lucro"  data-placement="bottom" type="text" min = "0"  step="0,01" class="form-control" onblur="Calcular()" id="gmforowner" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>GM /Turnover <br>Percentage (%)</label>
                            <div class="input-group">
                                <input name="gmturnoverperc" data-toggle="tooltip" title="Porcentagem de lucro" data-placement="bottom" readonly type="number"  class="form-control" id="gmturnoverperc" placeholder="" required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3">
                            <label>Weighted<br> 
                                prospect</label>
                            <div class="input-group">
                                <input readonly name="weightedprospec" data-toggle="tooltip"  title="Valor calculado de Lucro" data-placement="bottom" type="text" class="form-control" id="weightedprospec" placeholder=""  required>
                                <div class="invalid-feedback">
                                    Valor necessária
                                </div>
                            </div>
                        </div>

                    </div>
                    <h5 class="mb-0">
                        <span class="text-primary">Fotos</span>
                    </h5>                    
                    <form action="upload" method="post" enctype="multipart/form-data">

                        <input type="file" name="file" id="i_file" required />

                        <input type="submit" value="Enviar" id="i_submit"  />
                        <br>

                        <input type ="text" style="border: none; color: red; width: 100%" id="filestatus" readonly>

                    </form>  

                    <br>
                    <button class="btn btn-lg btn-outline-success" type="submit" onclick="{
                                return confirmCompleteProjeto();
                            }" name = "gravarprojeto"><span data-feather="save"></span> Salvar Projeto</button>

                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-0">&copy; MCI Brasil</p>
            </footer>

        </form>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <script src="js/calcularProjeto.js"></script>
        <script src="js/tamanhodata.js"></script>
        <script src="js/searchSuggestProjectname.js"></script>
        <script src="js/searchSuggestProjectCode.js"></script>
        <script src="js/confirmCompleteProjeto.js"></script>
        <script src="js/Probability.js"></script>
        <script src="js/Localidade.js"></script>
        <script src="js/formatarMoeda.js"></script>
        <script src="js/collapse_button.js"></script>
        <script src="js/StatusVSProbability.js"></script>


        <script src="js/jquery.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script src="js/jquery.maskMoney.js"></script>
        <script src="js/AnoFiscal.js"></script>
        <script src="js/customAlert.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <script>
                        $(document).ready(function () {
                            $('[data-toggle="tooltip"]').tooltip();
                        });
        </script>

        <script>
            $("#projectname").autocomplete("getdataProjetos.jsp");
        </script>

        <script>

            $("#contatomci").autocomplete({
                source: $("#contatomci").autocomplete("getdataContatoMCI.jsp")});

            function naBaseContato(val) {
                var source = $("#contatomci").autocomplete("getdataContatoMCI.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('contatomci').value = "";
                        document.getElementById('contatomci').placeholder = "Contato não cadastrado, solicitar inclusão";

                    }
                }
            }
        </script>
        <script>

            $("#mcistdcliname").autocomplete({
                source: $("#mcistdcliname").autocomplete("getdataClientes.jsp")});

            function naBase(val) {
                var source = $("#mcistdcliname").autocomplete("getdataClientes.jsp");

                var length = source.length;
                for (var i = 0; i < length; i++) {
                    if (source[i] != val) {
                        document.getElementById('mcistdcliname').value = "";
                        document.getElementById('mcistdcliname').placeholder = "Cliente não cadastrado, solicitar inclusão";
                    }
                }
            }


        </script>


        <script src="js/feather.min.js"></script>
        <script>
            feather.replace()
        </script>

        <script>
            $(function () {
                $('#turnoverforowner').maskMoney();
                $('#gmforowner').maskMoney();
            });
        </script>
        <script>
            $('.panel-collapse').collapse({
                toggle: true
            });
        </script>
        <script>
            $('#element').tooltip('show')
        </script>

    </body>
</html>
