DROP DATABASE orbis;
CREATE DATABASE orbis;
USE orbis;

CREATE TABLE tbcliente(
idcliente INT NOT NULL AUTO_INCREMENT,
idendereco INT NOT NULL,
emailcliente VARCHAR (50) UNIQUE NOT NULL,
nomecliente VARCHAR (50) NOT NULL,
rgcliente VARCHAR (11) UNIQUE NOT NULL,
cpfcliente VARCHAR (14) UNIQUE NOT NULL,
telcliente VARCHAR (13) NOT NULL,
celcliente VARCHAR (14),
password VARCHAR (30) NOT NULL,
PRIMARY KEY (idcliente));




CREATE TABLE tbvenda(
idvenda  INT NOT NULL AUTO_INCREMENT,
idcliente INT NOT NULL,
dthvenda VARCHAR(20) NOT NULL,
PRIMARY KEY (idvenda),
FOREIGN KEY (idcliente) REFERENCES tbcliente (idcliente));



