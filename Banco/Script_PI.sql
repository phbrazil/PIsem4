DROP DATABASE orbis;
CREATE DATABASE orbis;
USE orbis;

CREATE TABLE tbpayment(
idpayment INT NOT NULL AUTO_INCREMENT,
tipo VARCHAR(60) NOT NULL,
numero_cartao INT NOT NULL,
validade VARCHAR(5) NOT NULL,
codseg INT NOT NULL,
bandeira VARCHAR (20) NOT NULL,
nomecliente VARCHAR (60) NOT NULL,
PRIMARY KEY (idpayment));

insert into tbpayment (tipo,numero_cartao,validade,codseg,bandeira,nomecliente) values ('Não Cadastrado','000000','0000',0,'','');


CREATE TABLE tbendereco(
idendereco INT NOT NULL AUTO_INCREMENT,
rua VARCHAR(60) NOT NULL,
numero VARCHAR(20) NOT NULL,
cep VARCHAR(9) NOT NULL,
complemento VARCHAR (40) NOT NULL,
bairro VARCHAR (40) NOT NULL,
cidade VARCHAR (60) NOT NULL,
UF VARCHAR (2) NOT NULL,
pais VARCHAR (60) NOT NULL,
referencia VARCHAR(30),
PRIMARY KEY (idendereco));

use orbis;

insert into tbendereco(rua,numero,cep,complemento,bairro,cidade,UF,pais,referencia) values ('','','','','','','','','');


CREATE TABLE tbcliente(
idcliente INT NOT NULL AUTO_INCREMENT,
idendereco INT NOT NULL,
emailcliente VARCHAR (50) UNIQUE NOT NULL,
nomecliente VARCHAR (50) NOT NULL,
rgcliente VARCHAR (12) UNIQUE NOT NULL,
cpfcliente VARCHAR (14) UNIQUE NOT NULL,
telcliente VARCHAR (14) NOT NULL,
celcliente VARCHAR (14),
passwordCliente VARCHAR (30) NOT NULL,
changepassword boolean NOT NULL,
idpayment INT NOT NULL,
PRIMARY KEY (idcliente),
FOREIGN KEY (idpayment) REFERENCES tbpayment (idpayment),
FOREIGN KEY (idendereco) REFERENCES tbendereco (idendereco));

CREATE TABLE tbpacote(
idpacote INT NOT NULL AUTO_INCREMENT,
dthevento VARCHAR (20) NOT NULL,
qtdmax INT NOT NULL,
valor FLOAT(10,2) NOT NULL,
localsaida VARCHAR(100) NOT NULL,
localdestino VARCHAR(100) NOT NULL,
roteiro VARCHAR(1000) NOT NULL,
PRIMARY KEY (idpacote));



CREATE TABLE tbvenda(
idvenda  INT NOT NULL AUTO_INCREMENT,
idcliente INT NOT NULL,
dthvenda VARCHAR(20) NOT NULL,
total FLOAT(10,2) NOT NULL,
PRIMARY KEY (idvenda),
FOREIGN KEY (idcliente) REFERENCES tbcliente (idcliente));

CREATE TABLE tbitemvenda(
itemid INT NOT NULL AUTO_INCREMENT,
idpacote INT NOT NULL,
idvenda INT NOT NULL,
valor FLOAT(10,2) NOT NULL,
dthvenda VARCHAR(20) NOT NULL,
PRIMARY KEY (itemid),
FOREIGN KEY (idpacote) REFERENCES tbpacote (idpacote),
FOREIGN KEY (idvenda) REFERENCES tbvenda (idvenda));












