drop table veterinario cascade; 
drop table animal cascade; 
drop table consulta cascade; 
drop table tratamento cascade; 
drop table inseminacao cascade; 
drop table reprodutor cascade; 
drop table matriz cascade; 
drop table curral cascade; 
drop table semen cascade; 
drop table cobertura cascade; 
drop table sequencia cascade; 
create table veterinario (
    crm int,
    nome varchar(50),
    convenio varchar(50),
    primary key (crm)
);

create table animal (
    id int,
    nome varchar(50),
    raca varchar(50),
    sexo char(1),
    primary key (id)

);


create table semen (
    tipo int,
    caracteristica varchar(50),
    primary key (tipo)
);

create table matriz (
    animal int,
    foreign key (animal) references animal (id),
    primary key (animal)
);

create table inseminacao (
    semen int,
    matriz int,
    foreign key (semen) references semen(tipo),
    foreign key (matriz) references matriz(animal),
    geracao int,
    foreign key (geracao) references animal (id),
    data_nasc date,
    primary key (semen, matriz)
);

create table reprodutor (
    animal int,
    foreign key (animal) references animal (id),
    primary key (animal),
    flag_adq boolean,
    flag_cria boolean,
    data_desmame date,
    nome_pai varchar(50),
    nome_mae varchar(50),
    valor float
);

create table cobertura (
    matriz int,
    reprodutor int,
    geracao int,
    foreign key (geracao) references animal(id),
    foreign key (matriz) references matriz(animal),
    foreign key (reprodutor) references reprodutor(animal),
    data_nasc date
);


create table curral (
    numero int,
    primary key (numero),
    localizacao varchar(50),
    matriz int,
    foreign key (matriz) references matriz(animal)
);


create table consulta (
    veterinario int,
    animal int,
    data_consulta date,
    resultado varchar(50),
	primary key (data_consulta, veterinario, animal),
    foreign key (veterinario) references veterinario(crm),
    foreign key (animal) references animal(id)
	
);

create table sequencia (
    consulta date,
    vet int,
    an int,

    sequencia date,
	vet2 int,
	an2 int,
    foreign key (consulta, vet, an) references consulta(data_consulta, veterinario, animal),
	foreign key (sequencia, vet2, an2) references consulta(data_consulta, veterinario, animal)
);

create table tratamento (
    data_tratamento date,
    descricao varchar(50),
    consulta date,
	vet int,
	an int,
    primary key (data_tratamento),
    foreign key (consulta, vet, an) references consulta(data_consulta, veterinario, animal)
);


