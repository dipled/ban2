drop table veterinario cascade; 
drop table animal cascade; 
drop table consulta cascade; 
drop table tratamento cascade; 


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


