CREATE DATABASE hotel;


CREATE TABLE hospede
(
	id_hospede int auto_increment primary key,
	nome_hospede varchar(100),
	idade int(3),
	genero varchar(1)
);

CREATE TABLE hotel
(
	cnpj int auto_increment primary key,
	nome_hotel varchar(100),
	numero_de_funcionarios int (4),
	numero_quartos int (5)
);

CREATE TABLE revervas 
(
	id int auto_increment primary key,
	data varchar(10),
	preco int(10),
	dias int(3),
	id_hospede int,
	foreign key(id_hospede) references hospede(id_hospede)
);

CREATE TABLE funcionario
(
	id_funcionario int auto_increment primary key,
	nome_funcionario varchar(100),
	servico varchar(100),
	cnpj_hotel int,
	foreign key(cnpj_hotel) references hotel(cnpj)
);


CREATE TABLE pratos
(
	id_pratos int auto_increment primary key,
	nome_prato varchar(100),
	valor int (5)
);

INSERT INTO hotel (nome_hotel, numero_de_funcionarios, numero_quartos) VALUES 
	("Hotel Lagos", 35, 100),
	("GrandHotel", 40, 230),
	("Sul Express Hotel", 23, 210),
	("D. Hotel Ville", 35, 120);

INSERT INTO pratos (nome_prato, valor) VALUES
	("Salada Austrica", 20),
	("Bife Suíno", 54),
	("Churrasco Olimpico", 100),
	("Burguer Master", 65);

INSERT INTO funcionario (nome_funcionario, servico, cnpj_hotel) VALUES
	("Roberto", "Lavanderia", 1),
	("Vanda", "Recepção", 1),
	("João", "Cozinha", 2),
	("Daniela", "Faxina", 3);

INSERT INTO hospede (nome_hospede, idade, genero) VALUES
	("Sandra", 34, "F"),
	("Albert", 87, "M"),
	("Alex", 43, "M"),
	("Willian", 24, "M"); 

INSERT INTO reservas (data, preco, dias, id_hospede) VALUES
	("23-02-2024", 2400, 5, 2),
	("10-01-2024", 3000, 6, 1),
	("27-06-2024", 6000, 9, 4),
	("22-04-2024", 10000, 15, 3); 


SELECT * FROM hotel
WHERE numero_de_funcionarios >= 10 AND numero_de_funcionarios <= 38

SELECT * FROM pratos
WHERE nome_prato LIKE '%B%'

SELECT * FROM hospede
WHERE genero = 'F'

SELECT funcionario.id_funcionario, funcionario.nome_funcionario, hotel.nome_hotel
FROM hotel
INNER JOIN funcionario ON funcionario.cnpj_hotel = hotel.cnpj

SELECT revervas.id, revervas.data, hospede.nome_hospede, hospede.genero
FROM revervas
RIGHT JOIN hospede ON revervas.id_hospede = hospede.id_hospede
ORDER BY hospede.id_hospede;

SELECT hospede.nome_hospede, revervas.id
FROM hospede
LEFT JOIN revervas ON revervas.id_hospede = hospede.id_hospede;


UPDATE funcionario
SET nome_funcionario 'Geraldo'
WHERE id_funcionario = 3;

UPDATE hotel
set numero_de_funcionarios = 100
WHERE numero_quartos <= 200;

UPDATE pratos
set valor = 15
WHERE nome_prato LIKE '%Bife%';

ALTER TABLE revervas
ADD email varchar (255);

ALTER TABLE pratos
DROP COLUMN valor;

ALTER TABLE hotel
CHANGE COLUMN nome_hotel nome VARCHAR(255);

DELETE FROM funcionario WHERE cnpj_hotel IN (SELECT cnpj FROM hotel WHERE numero_de_funcionarios = 100);
DELETE FROM hotel WHERE numero_de_funcionarios = 100;
DELETE FROM pratos WHERE nome_prato LIKE '%Bife%';


