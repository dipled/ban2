drop table historico;
drop table registro;
drop table banca;
drop table subsidio;
drop table bolsa;
drop table aluno_grad;
drop table disciplina;
drop table instrutor_pesquisador;
drop table curso;
drop table departamento;
drop table faculdade;
drop table aluno;
drop table docente;
drop table pessoa;

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
	escritorio integer,
	telefone char(11),
	primary key (ssn),
	foreign key (ssn) references pessoa (ssn)
);

create table aluno (
	turma int,
	ssn int,
	primary key (ssn),
	foreign key (ssn) references pessoa (ssn)
);
create table instrutor_pesquisador (
	cod int, primary key (cod)
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

create table banca (
	ssn_aluno int,
	ssn_docente int,
	primary key (ssn_aluno, ssn_docente),
	foreign key (ssn_aluno) references aluno(ssn),
	foreign key (ssn_docente) references docente
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
	foreign key (cod_disc) references disciplina(cod),
	primary key (ssn_aluno, cod_disc)
)