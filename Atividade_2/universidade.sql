drop table historico cascade;
drop table registro cascade;
drop table banca cascade;
drop table subsidio cascade;
drop table bolsa cascade;
drop table aluno_grad cascade;
drop table disciplina cascade;
drop table instrutor_pesquisador cascade;
drop table curso cascade;
drop table departamento cascade;
drop table faculdade cascade;
drop table aluno cascade;
drop table docente cascade;
drop table pessoa cascade;
create table instrutor_pesquisador (
	cod int, primary key (cod)
);

create table pessoa (
	ssn int,
	pnome varchar(50),
	unome varchar(50),
	minicial varchar(50),
	dnasc date,
	sexo char(1),
	num int,
	rua varchar(50),
	numapto int,
	cidade varchar(50),
	estado varchar(50),
	cep char(11),
	primary key (ssn)
);

create table docente (
	ssn integer,
	salario integer,
	categoria varchar(50),
	inst_pesq int,
	escritorio integer,
	telefone char(11),
	foreign key (inst_pesq) references instrutor_pesquisador(cod),
	primary key (ssn),
	foreign key (ssn) references pessoa (ssn)
);


create table bolsa (
	num int,
	primary key (num),
	titulo varchar(50),
	agencia varchar(50),
	datain date,
	docente int,
	foreign key (docente) references docente (ssn)
);
create table subsidio (
	inicio date,
	prazo int,
	fim date,
	instrutor_pesquisador int,
	foreign key (instrutor_pesquisador) references instrutor_pesquisador (cod),
	bolsa int,
	foreign key (bolsa )references bolsa(num),
	primary key (instrutor_pesquisador, bolsa)
);

create table faculdade (
	nome varchar(50) primary key,
	reitor varchar(200),
	escritorio integer
);

create table departamento (
	nome varchar(50) primary key,
	telefone char(11),
	escritorio integer,
	faculdade varchar(50),
	chefe int,
	foreign key (faculdade) references faculdade (nome),
	foreign key (chefe) references docente (ssn)
);
create table aluno (
	turma int,
	ssn int,
	primary key (ssn),
	depto varchar(50),
	depto_opta varchar(50),
	foreign key (depto) references departamento(nome),
	foreign key (depto_opta) references departamento(nome),
	foreign key (ssn) references pessoa (ssn)
);
create table aluno_grad (
	ssn int,
	faculdade varchar(50),
	ano int,
	inst_pesq int,
	foreign key (inst_pesq) references instrutor_pesquisador(cod),
	orientador int,
	foreign key (orientador) references docente(ssn),
	primary key (ssn),
	foreign key (ssn) references aluno(ssn)
);


create table banca (
	ssn_aluno int,
	ssn_docente int,
	primary key (ssn_aluno, ssn_docente),
	foreign key (ssn_aluno) references aluno(ssn),
	foreign key (ssn_docente) references docente
);
create table curso (
	codigo int primary key,
	descricao varchar(50),
	nome varchar(50),
	departamento varchar(50),
	foreign key (departamento) references departamento (nome)
);


create table disciplina (
	cod int primary key,
	nome varchar(50),
	ano int,
	trimestre int,
	curso int,
	instrutor_pesquisador int,
	foreign key (instrutor_pesquisador) references instrutor_pesquisador(cod),
	foreign key (curso) references curso (codigo)
);

create table disciplina_corrente (
	cod int,
	primary key (cod),
	foreign key (cod) references disciplina(cod)
);

create table historico (
	ssn_aluno int,
	cod_disc int,
	nota float,
	foreign key (ssn_aluno) references aluno(ssn),
	foreign key (cod_disc) references disciplina(cod),
	primary key (ssn_aluno, cod_disc)
);

create table registro (
	ssn_aluno int,
	cod_disc int,
	foreign key (ssn_aluno) references aluno(ssn),
	foreign key (cod_disc) references disciplina_corrente(cod),
	primary key (ssn_aluno, cod_disc)
);

create table pertence (
	docente int,
	departamento varchar(50),
	foreign key (docente) references docente(ssn),
	foreign key (departamento) references departamento(nome)

);