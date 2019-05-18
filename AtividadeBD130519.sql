-- criando base.
create database bdescolar;
use bdescolar;
show tables;

-- criando tabela de curso.
create table tb_curso 
(cod_curso int(3), 
nome_curso varchar(100),
periodo_curso varchar(10));
-- conferir se a tabela foi criada na bdescolar.
show tables;

-- mostrar configurações dos campos da tabela curso.
describe tb_curso; 
select * from tb_curso;
insert into tb_curso values 
('001','administração','3sem'),
('002','psicologia','4sem'),
('003','sistemas de informação','1ano');

-- definir a coluna que será chave primária e depois a coluna que o código irá ser gerado automático.
alter table tb_curso add primary key (cod_curso);
alter table tb_curso modify column cod_curso int AUTO_INCREMENT;
insert into tb_curso (nome_curso, periodo_curso) 
values ('engenharia de produção','5sem');
select * from tb_curso;
-- acima, engenharia de produção assumiu cod_curso = 4 pelo AUTO_INCREMENT.
insert into tb_curso (nome_curso, periodo_curso) 
values ('direito','8sem');
-- acima, direito assumiu cod_curso = 5 pelo AUTO_INCREMENT.
select * from tb_curso;

-- deletando um curso que esteja no meio da lista para verificar comportamento do auto_increment.
delete from tb_curso where cod_curso = 4;
select * from tb_curso;
-- o cod_curso removido ficou "um buraco" na numeração.

-- inserindo outro para ver se ele segue com o 6
insert into tb_curso (nome_curso, periodo_curso) 
values ('engenharia de produção','5sem');
select * from tb_curso; -- continuou com 6

insert into tb_curso (cod_curso, nome_curso, periodo_curso) 
values (4, 'enfermagem','7sem');
-- inseriu enfermagem no espaço que estava em branco

insert into tb_curso (cod_curso, nome_curso, periodo_curso) 
values (4, 'medicina','7sem');
-- retornou erro porque já existe curso cadastrado com cod_curso 4
select * from tb_curso; 

create table tb_disciplina 
(cod_disciplina int(3), 
curso_associado varchar(100),
nome varchar(10),
periodo_associado varchar(10),
carga_horaria int(6),
qtde_aulas int(6),
primary key(cod_disciplina));
alter table tb_disciplina modify column nome varchar(100);
alter table tb_disciplina modify column carga_horaria varchar(5);
insert into tb_disciplina values 
('11','administração','matemática I', '2sem', '36h', '24'),
('12','administração','produção', '3sem', '26h', '34'),
('13','administração','marketing', '5sem', '16h', '44'),
('14','psicologia','motivação', '4sem', '28h', '27'),
('15','psicologia','liderança', '6sem', '38h', '37'),
('16','psicologia','portugues', '1sem', '48h', '47'),
('17','sistemas de informação','programação', '7sem', '33h', '23'),
('18','sistemas de informação','estatística', '8sem', '43h', '33'),
('19','sistemas de informação','banco de dados', '9sem', '53h', '43'),
('20','sistemas de informação','redes', '2sem', '36h', '53');
select * from tb_disciplina;
describe tb_disciplina;

create table tb_professor 
(cod_professor int(3), 
nome_professor varchar(500),
primary key(cod_professor));
describe tb_professor;
insert into tb_professor values 
('31','Priscilla Guedes'),
('32','Milena Souto');
select * from tb_professor;

create table tb_aluno
(cod_aluno varchar(10), nome_aluno varchar(500),
end_aluno varchar(500), dt_nasc_aluno date,
cid_nasc_aluno varchar(100),
nacionalidade_aluno varchar(100),
cpf_aluno int(11), rg_aluno int(15),
cod_curso int(3), cod_turma varchar(10),
primary key(cod_aluno));
describe tb_aluno;
alter table tb_aluno modify column cod_aluno int AUTO_INCREMENT;
select * from tb_aluno;
insert into tb_aluno 
(nome_aluno, end_aluno, dt_nasc_aluno, cid_nasc_aluno, nacionalidade_aluno, cpf_aluno, rg_aluno, cod_curso, cod_turma) 
values 
('Priscilla Guedes', 'Avenida P Acnhieta, Santo André', 08/08/1990, 'Patos-PB', 'Brasileira', 7516741418, '3337459', '001', 'xx' );
alter table tb_aluno modify column cpf_aluno varchar (15);
insert into tb_aluno 
(nome_aluno, end_aluno, dt_nasc_aluno, cid_nasc_aluno, nacionalidade_aluno, cpf_aluno, rg_aluno, cod_curso, cod_turma) 
values 
('Vanessa Guedes', 'Avenida P Acnhieta, SantAndré', 08/08/1990, 'Patos-PB', 'Brasileira', 7516741418, '3337459', '001', 'xx' ),
('Fabiana Vollet', 'Rua P Acnhieta, SantoAndré', 07/07/1990, 'SBC-SP', 'Brasileira', 2222222222, '222222', '002', 'yy' ),
('Vinicius Santos', 'Travessa P Acnhieta, SantAnder', 06/06/1990, 'SãoPaulo-SP', 'Brasileira', 33333333333, '33333333', '003', 'zz' ),
('Kelly Cristina', 'Rodovia P Acnhieta, SantAndrez', 05/05/1990, 'Zaira-SP', 'Brasileira', 4444444444444, 44444444, '004', 'ww' );


show tables;
select * from tb_aluno;
describe tb_aluno;
select * from tb_curso;
describe tb_curso;
select * from tb_disciplina;
describe tb_disciplina;
select * from tb_professor;
describe tb_professor;

*******************************************;
-- comandos aula 130519
create database dbAula;
use dbAula;
create table tbAlunos (id int primary key auto_increment not null, nome varchar (255));
create table tbDisciplinas (id int primary key auto_increment not null, disciplinas varchar (255));
alter table tbDisciplinas add column id_aluno int;
alter table tbDisciplinas add constraint fkAlunos foreign key(id_aluno) references tbAlunos(id);
insert into tbalunos (nome) values ("Vinicius Luna");
insert into tbDisciplinas (disciplinas, id_aluno) values ("Math", 1);
select * from tbAlunos as a join tbDisciplinas as d on a.id = d.id_aluno;
select a.nome , d.disciplinas from tbAlunos as a join tbDisciplinas as d on a.id = d.id_aluno;

*******************************************;
-- praticando comandos acima, aplicando às tabelas já criadas.
describe tb_aluno;
alter table tb_aluno modify column cod_aluno int AUTO_INCREMENT not null;
alter table tb_aluno modify column nome_aluno varchar (255);
describe tb_disciplina; -- cod_disciplina estava sem auto increment
select * from tb_disciplina;
-- corrigindo coluna cod_disciplina para auto_increment
alter table tb_disciplina modify column cod_disciplina int AUTO_INCREMENT not null;

-- alterar o nome da coluna
alter table tb_disciplina change column nome disciplinas varchar(255);
alter table tb_disciplina change column disciplinas descri_disciplina varchar(255);
-- deletar todos os registros de uma tabela
truncate table tb_disciplina;
insert into tb_disciplina (curso_associado, descri_disciplina, periodo_associado, carga_horaria, qtde_aulas) values 
('administração','matemática I', '2sem', '36h', '24'),
('administração','produção', '3sem', '26h', '34'),
('administração','marketing', '5sem', '16h', '44'),
('psicologia','motivação', '4sem', '28h', '27'),
('psicologia','liderança', '6sem', '38h', '37'),
('psicologia','portugues', '1sem', '48h', '47'),
('sistemas de informação','programação', '7sem', '33h', '23'),
('sistemas de informação','estatística', '8sem', '43h', '33'),
('sistemas de informação','banco de dados', '9sem', '53h', '43'),
('sistemas de informação','redes', '2sem', '36h', '53');

alter table tb_aluno modify column id_a int AUTO_INCREMENT not null;
select * from tb_aluno;
alter table tb_disciplina modify column id_d int AUTO_INCREMENT not null;
select * from tb_disciplina;

alter table tb_disciplina add column id_aluno int;
select * from tb_disciplina;
alter table tb_disciplina add constraint fkAlunos foreign key (id_aluno) references tb_aluno(id_a);
describe tb_aluno;
insert into tb_disciplina (id_aluno) values (1);
delete from tb_disciplina where id_aluno = 1;
update tb_disciplina set id_aluno = '1' where id_d = 5;
update tb_disciplina set id_aluno = '2' where id_d = 4;
update tb_disciplina set id_aluno = '3' where id_d = 3;
update tb_disciplina set id_aluno = '4' where id_d = 2;
update tb_disciplina set id_aluno = '5' where id_d = 1;
select * from tb_aluno as a join tb_disciplina as d on a.id_a = d.id_aluno;
select a.nome_aluno , d.descri_disciplina from tb_aluno as a join tb_disciplina as d on a.id_a = d.id_aluno;