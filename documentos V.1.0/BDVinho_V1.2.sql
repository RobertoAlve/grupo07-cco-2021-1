create database Vinho;
use Vinho;

 create table tb_EmpresaTransporte(
 id_transportadora int primary key,
 nome_transportadora varchar(40),
 endereco_transportadora varchar(50),
 telefone_transportadora int,
 cnpj_transportadora int
);

insert into tb_EmpresaTransporte 
values
(1, 'TransP', 'Rua dos Astronautas, 25, São Paulo, SP', 1139128510, 8000105);

create table tb_Produtor(
id_produtor int primary key,
nome_produtor varchar(40),
endereco_produtor varchar (50),
telefone_produtor int,
cnpj_produtor int
);

insert into tb_Produtor 
values
(1,"Casteluche","Rua das Couves, 51",1175487875, 546545445);

create table tb_Varejista(
id_varejista int primary key,
nome_varejista varchar(40),
endereco_varejista varchar (50),
telefone_varejista int,
cnpj_varejista int
);

insert into tb_Varejista values 
(10,'Rafael', 'Rua Virgilio Roncon', 1120201011, 8811888);


create table tb_Tipo(
id_tipo int primary key,
nome_tipo varchar(40),
descricao_tipo varchar(40)
);

insert into tb_Tipo
values
(1, "carbenet", "Vinho seco");

create table tb_Vinho(
id_vinho int primary key,
nome_vinho varchar(40),
temperatura varchar(40),
umidade varchar(40),
marca int,
tipo int,
tempoMaturacao varchar(40),
anoSafra int,
localFeito varchar(40),
CONSTRAINT fk_marca_vinho foreign key (marca) references tb_Produtor (id_produtor),
CONSTRAINT fk_tipo_vinho foreign key (tipo) references tb_Tipo (id_tipo)
);

insert into tb_Vinho values
(1,"Cantinho do vale","20ºC","50%",1,1,"5 anos",2010,"Rua da jaca");

create table tb_Transporte(
id_transporte int primary key,
transportadora int,
vinho int, 
produtor int,
varejista int,
tempo int,
dataHoraInicio_tranporte datetime,
dataHoraTermino_tranporte datetime,
CONSTRAINT fk_transportadora foreign key (transportadora) references tb_EmpresaTransporte (id_transportadora),
CONSTRAINT fk_vinho foreign key (vinho) references tb_Vinho (id_vinho),
CONSTRAINT fk_produtor foreign key (produtor) references tb_Produtor (id_produtor),
CONSTRAINT fk_varejista foreign key (varejista) references tb_Varejista (id_varejista)
);
insert into tb_Transporte 
values
(1,1,1,1,10,2,"2021-02-26 16:59:59.999999","2021-02-26 18:59:59.999999");

select * from tb_transporte;
select * from tb_vinho;