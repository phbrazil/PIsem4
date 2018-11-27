    CREATE USER 'orbis'@'localhost' IDENTIFIED BY '0c24a188a9';    
    GRANT ALL PRIVILEGES ON * . * TO 'orbis'@'localhost';
DROP DATABASE orbis;
CREATE DATABASE orbis;
USE orbis;

    CREATE USER 'orbis'@'localhost' IDENTIFIED BY 'admin';
    GRANT ALL PRIVILEGES ON * . * TO 'orbis'@'localhost';
    
CREATE TABLE tbCidades(
idcidade INT NOT NULL AUTO_INCREMENT,
UF varchar(100) NOT NULL,
NomeMunic VARCHAR (150) NOT NULL,
PRIMARY KEY (idcidade));


    


CREATE TABLE tbPayment(
idpayment INT NOT NULL AUTO_INCREMENT,
tipo VARCHAR(60) NOT NULL,
numero_cartao INT NOT NULL,
validade VARCHAR(5) NOT NULL,
codseg INT NOT NULL,
bandeira VARCHAR (20) NOT NULL,
nomecliente VARCHAR (60) NOT NULL,
PRIMARY KEY (idpayment));

insert into tbPayment(tipo, numero_cartao,validade,codseg,bandeira,nomecliente) values ('Não Cadastrado',0,'',0,'','');


CREATE TABLE tbEndereco(
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

insert into tbEndereco (rua,numero,cep,complemento,bairro,cidade,UF,pais,referencia) values ('Não Cadastrado','',0,'','','','','','');

CREATE TABLE tbGrupos(
idgrupo INT NOT NULL AUTO_INCREMENT,
nomegrupo VARCHAR(20) NOT NULL,
descricao VARCHAR(50) NOT NULL,
PRIMARY KEY (idgrupo));

INSERT INTO tbGrupos(nomegrupo, descricao) values ('Administradores', 'Responsavel por gerenciar os pacotes');
INSERT INTO tbGrupos(nomegrupo, descricao) values ('Compradores', 'Usuarios compradores / Clientes');


CREATE TABLE tbCliente(
idcliente INT NOT NULL AUTO_INCREMENT,
idendereco INT NOT NULL,
emailcliente VARCHAR (50) UNIQUE NOT NULL,
nomecliente VARCHAR (50) NOT NULL,
rgcliente VARCHAR (13) UNIQUE NOT NULL,
cpfcliente VARCHAR (14) UNIQUE NOT NULL,
telcliente VARCHAR (13) NOT NULL,
celcliente VARCHAR (14),
passwordCliente VARCHAR (30) NOT NULL,
changepassword boolean NOT NULL,
cadastroIncompleto boolean NOT NULL default TRUE,
idpayment INT NOT NULL,
idgrupo iNT NOT NULL,
PRIMARY KEY (idcliente),
FOREIGN KEY (idpayment) REFERENCES tbPayment (idpayment),
FOREIGN KEY (idgrupo) REFERENCES tbGrupos (idgrupo),
FOREIGN KEY (idendereco) REFERENCES tbEndereco (idendereco));

insert into tbCliente(idendereco,emailcliente,nomecliente,rgcliente,cpfcliente,telcliente,celcliente,passwordCliente,
changepassword,idpayment) values (2,'pauloh2012sul@gmail.com','Paulo Henrique Bezerra','46.682.552-3','375.175.588-85','11981997228','981997228',
'senac',false,3);

insert into tbCliente(idendereco,emailcliente,nomecliente,rgcliente,cpfcliente,telcliente,celcliente,passwordCliente,
changepassword,idpayment) values (2,'luucasmeedeiros@gmail.com','Lucas Medeiros','46.682.552-4','375.175.588-86','11981997228','981997228',
'doc@123',false,3);

insert into tbCliente(idendereco,emailcliente,nomecliente,rgcliente,cpfcliente,telcliente,celcliente,passwordCliente,
changepassword,idpayment) values (2,'andremartins98@hotmail.com','Andre Martins','46.682.552-5','375.175.588-87','11981997228','981997228',
'210498',false,3);


CREATE TABLE tbPacote(
idpacote INT NOT NULL AUTO_INCREMENT,
dthevento VARCHAR (20) NOT NULL,
qtdmax INT NOT NULL,
valor FLOAT(10,2) NOT NULL,
localsaida VARCHAR(100) NOT NULL,
localdestino VARCHAR(100) NOT NULL,
roteiro VARCHAR(1000) NOT NULL,
ativo BOOLEAN default TRUE,
imagePath varchar (1000),
dthCadastro VARCHAR (20) NOT NULL,
PRIMARY KEY (idpacote));

insert into tbPacote(dthevento, qtdmax,valor,localsaida,localdestino,roteiro) values (now(),100,200.00,'sao paulo', 'Bahia','A definir');
insert into tbPacote(dthevento, qtdmax,valor,localsaida,localdestino,roteiro) values (now(),100,400.00,'sao paulo', 'Ceara','A definir');
insert into tbPacote(dthevento, qtdmax,valor,localsaida,localdestino,roteiro) values (now(),100,100.00,'sao paulo', 'Brotas','A definir');
insert into tbPacote(dthevento, qtdmax,valor,localsaida,localdestino,roteiro) values (now(),100,210.00,'sao paulo', 'Canoas','A definir');
insert into tbPacote(dthevento, qtdmax,valor,localsaida,localdestino,roteiro) values (now(),100,50.00,'sao paulo', 'HueHue','A definir');


create table tbImagens(
id INT NOT NULL AUTO_INCREMENT,
idPacote INT NOT null,
nomeImagem varchar(60) not null UNIQUE,
PRIMARY KEY (id),
FOREIGN KEY (idPacote) REFERENCES tbPacote (idPacote));



CREATE TABLE tbVenda(
id  INT NOT NULL AUTO_INCREMENT,
idcliente INT NOT NULL,
dthvenda VARCHAR(20) NOT NULL,
total FLOAT(10,2) NOT NULL,
idpacote INT NOT NULL,
tipoPagamento varchar(20) NOT NULL,
PRIMARY KEY (idvenda),
FOREIGN KEY (idpacote) REFERENCES tbPacote (idpacote),
FOREIGN KEY (idcliente) REFERENCES tbCliente (idcliente));

CREATE TABLE tbItemVenda(
itemid INT NOT NULL AUTO_INCREMENT,
idpacote INT NOT NULL,
idvenda INT NOT NULL,
valor FLOAT(10,2) NOT NULL,
dthvenda VARCHAR(20) NOT NULL,
PRIMARY KEY (itemid),
FOREIGN KEY (idpacote) REFERENCES tbPacote (idpacote),
FOREIGN KEY (idvenda) REFERENCES tbVenda (idvenda));












