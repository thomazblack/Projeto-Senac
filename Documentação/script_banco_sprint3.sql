-- Criando Banco de dados desejado --

CREATE DATABASE CoffeeTec;


-- Fazendo uso do Banco de Dados escolhido --

USE CoffeeTec;



CREATE TABLE Empresa(
idEmpresa int primary key auto_increment,
Cnpj char(14),
Nome VARCHAR (45),
Telefone VARCHAR (20),
Responsavel VARCHAR (45)
)auto_increment=1500;

CREATE TABLE Estufa(
idEstufa INT PRIMARY KEY AUTO_INCREMENT,
nomeEstufa VARCHAR (45),
fkEmpresa int,
foreign key (fkempresa) references empresa(idempresa)
)auto_increment=200;


create table sensores (
idSensor int primary key auto_increment,
local_Estufa varchar(45),
Numero_serial varchar(45),
fkEstufa int,
foreign key (fkEstufa) references estufa(idEstufa)
);

create table dados(
idDado int primary key auto_increment,
Temperatura double,
Umidade double,
dtHora datetime default current_timestamp,
fkSensor int,
foreign key (fksensor) references sensores(idsensor)
)auto_increment=2000;


create table funcionario (
idFunc int primary key auto_increment,
nomeFunc varchar(45),
fkEmpresa int, 
foreign key (fkempresa) references empresa(idempresa)
)auto_increment=9000;

create table login(
idLogin int primary key auto_increment,
email varchar(45),
senha varchar(100),
fkempresa int,
foreign key (fkempresa) references empresa(idempresa),
fkfunc int,
foreign key (fkfunc) references funcionario(idfunc)
)auto_increment=500;



-- inserindo dados nas tabelas --

insert into empresa (cnpj, Nome, telefone, responsavel) values
	(25367851000123, 'CafeLover', 949736425, 'Greta munhoz'), 
    (19273845000170, 'CoffeeShop', 926387462,  'Amanda teles'), 
    (27389452637484, 'ConkaFé', 963752265,  'Diego dantas');
  
insert into funcionario (nomefunc, fkempresa) values
	( 'Gisele', 1502),
    ( 'Mariana', 1500),
    ('Gislene', 1500),
    ( 'Beatrys', 1501),
    ( 'Ana clara', 1502),
    ( 'Juliana', 1501);
    

insert into estufa (nomeEstufa, fkEmpresa) values
	('Estufa alfa', 1500),
    ('Estufa xpto', 1500),
    ('Estufa beta', 1500),
    ('Estufa principal', 1500),
	('Estufa primaria', 1501),
    ('Estufa secundaria', 1501),
    ('Estufa Americana', 1502),
    ('Estufa Brasileira', 1502),
    ('Estufa Francesa', 1502),
    ('Estufa Britanica',1502),
    ('Estufa Italiana', 1502),
    ('Estufa Japonesa', 1502),
    ('Estufa Canadense', 1502);
    
insert into login (email, senha, fkempresa) values
	('cafe@lover.com', '123456', 1500),
    ('Coffeeshop@gmail.com', '123456', 1501),
    ('conkafe@gmail.com', '12345678', 1502);

insert into login (email, senha, fkfunc) values
('gisele@gamil.com', 'gisele123',9000),
('mari@hotmail.com', 'mmary2002',9001),
('gibarros@yahoo.com', 'gi_ny575',9002),
( 'bia_gourmet@gmail.com', '#mendoca',9003),
( 'aninha@gmail.com', '$ana@clara',9004),
('guarisiju@hotmail.com', 'guarisi99',9005);

insert into sensores values
(null,'Setor A','123E',213),
(null,'Setor B','123S',213),
(null,'Setor A','123T',214),
(null,'Setor C','123D',215);

update sensores set idsensor = 4 where idsensor = 16; 

select * from empresa;
select * from login;
select * from funcionario;
select * from estufa;
select * from sensores;
select * from dados;

SELECT * FROM login join empresa on fkempresa = idempresa  join funcionario on fkfunc=idfunc;