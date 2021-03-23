CREATE DATABASE dbVinho;
USE dbVinho;

 CREATE TABLE tblTransportadora(
 id INT PRIMARY KEY,
 nome VARCHAR(40) NOT NULL,
 endereco VARCHAR(50) NOT NULL,
 telefone VARCHAR(11) NOT NULL,
 cnpj VARCHAR(14) UNIQUE KEY NOT NULL
);


INSERT INTO tblTransportadora (id,nome,endereco,telefone,cnpj)
VALUES
(01,'TransP', 'Rua dos Astronautas, 25, São Paulo, SP', '1139128510', '1234567890123'),
(02,'Loggi', 'Rua das Palmeiras, 200, São Paulo, SP', '11922009966', '15998775321478'),
(03,'Transportadora Aricanduva','Rua Freitas de Barros, 150, São Caetano, SP', '11965239874', '91478963258741'),
(04,'Tegma','Rua das Flores, 100, São Bernardo, SP', '11965412387', '74185296332165');



CREATE TABLE tblProdutor(
id INT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
endereco VARCHAR(50) NOT NULL,
telefone VARCHAR(11) NOT NULL,
cnpj VARCHAR(14) UNIQUE KEY NOT NULL
);

INSERT INTO tblProdutor (id, nome, endereco, telefone, cnpj)
VALUES
(01,'Casteluche','Rua das Couves, 150, São Paulo, SP', 1175487875, 14523546545445),
(02,'Quartier de L’esacrelle', 'Rua dos Alfeneiros, 800, Leme, SP', '11965412369', '91478523698745'),
(03,'Catrala Chardonnay', 'Rua das Américas, 320, Araras, SP', '11987456123', '11123654789963' ),
(04,'Alta Vista','Rua Alberto de Nóbrega, 111, São Bernardo, SP','1165412369','98765432100123');

select * from tblProdutor;
select * from tbltransportadora;

CREATE TABLE tblVarejista(
id INT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
endereco VARCHAR(50) NOT NULL,
telefone VARCHAR(11) NOT NULL,
cnpj VARCHAR(14) NOT NULL UNIQUE KEY
);


INSERT INTO tblVarejista (id, nome, endereco, telefone, cnpj)
VALUES 
(01,'Rafael Cardoso', 'Rua Virgilio Roncon, 120, São Paulo, SP', '1120201011', '88118889512365'),
(02,'Erik Silva','Rua Amarildo Costa, 98, São Caetano, SP','1132569874','12304569877412'),
(03,'Wesley Cardoso','Rua Maria, 66, São Paulo, SP','1132567412','74185296332145'),
(04,'Douglas Amaro','Rua Tuiuti, 200, São Paulo, SP','1138746521','57315946820145');


CREATE TABLE tblTipo(
id INT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
descricao varchar(400) NOT NULL
);

INSERT INTO tblTipo (id, nome, descricao)
VALUES
('Vinho Tinto','Este vinho é resultante da extração de uvas tintas. Sua coloração provém do trabalho feito com as cascas das uvas, que descansam com o mosto da mesma. Este processo chama-se maceração e dará ao vinho suas características principais.'),
('Fortificados', 'De modo geral, esses tipos de vinho são aqueles que possuem aguardente vínica ou outro tipo de destilados adicionados à sua mistura no processo de produção, resultando em vinhos com teor alcoólico mais elevado.'),
('Vinho Branco','O método de produção é similar ao do vinho tinto. A grande diferença é que as cascas são separadas do mosto assim que são prensadas, para que este não adquira as características provenientes das cascas. '),
('Espumantes', 'Espumante é o vinho com ”perlage”, ou borbulhas. Seu maior representante é o Champagne, que leva este nome por ser produzido nesta região da França.');

CREATE TABLE tblVinho(
id INT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
temperatura VARCHAR(40) NOT NULL,
umidade VARCHAR(40) NOT NULL,
produtor INT,
tipo INT,
tempoMaturacao VARCHAR(40) NOT NULL,
dataSafra DATE NOT NULL,
localFeito VARCHAR(60) NOT NULL,
CONSTRAINT FK_produtor_vinho FOREIGN KEY(produtor) REFERENCES tblProdutor (id),
CONSTRAINT FK_tipo_vinho FOREIGN KEY(tipo) REFERENCES tblTipo (id)
);

select * from tblVinho;

INSERT INTO tblVinho (id, nome, temperatura, umidade, produtor, tipo, tempoMaturacao, dataSafra, localFeito)
VALUES
(01, 'São Francisco', '13°C à 19°C', '5% à 15%', 6, 3, '5 anos', 19851205, 'Campos nevados, Minas Gerais, MG');


CREATE TABLE tblTransporte(
id INT PRIMARY KEY,
transportadora INT,
vinho INT, 
produtor INT,
varejista INT,
tempo TIME NOT NULL,
dataHoraInicio_tranporte DATETIME NOT NULL,
dataHoraTermino_tranporte DATETIME NOT NULL,
CONSTRAINT FK_transportadora FOREIGN KEY (transportadora) REFERENCES tblTransportadora (id),
CONSTRAINT FK_vinho FOREIGN KEY (vinho) REFERENCES tblVinho (id),
CONSTRAINT FK_produtor FOREIGN KEY (produtor) REFERENCES tblProdutor (id),
CONSTRAINT FK_varejista FOREIGN KEY (varejista) REFERENCES tblVarejista (id)
);

INSERT INTO tblTransporte (id, transportadora, vinho, produtor, varejista, tempo, dataHoraInicio_tranporte, dataHoraTermino_tranporte) 
VALUES
(01, 2,2,3,4,'10:00:00.999999','2021-02-26 16:59:59.999999','2021-02-26 18:59:59.999999');

SELECT * FROM tblTransporte;
SELECT * FROM tblTransportadora;
SELECT * FROM tblVinho;
SELECT * FROM tblTipo;
SELECT * FROM tblVarejista;
SELECT * FROM tblProdutor;
