-- link: https://onecompiler.com/postgresql/3yva6eefa
-- link: https://onecompiler.com/postgresql/3yvrycyf3
-- minhas duvidas sobre index: 
--https://cursos.alura.com.br/forum/topico-duvida-para-qual-campo-devemos-criar-o-indice-266820
--https://cursos.alura.com.br/forum/topico-duvida-e-quando-indice-nao-resolve-266823
--https://cursos.alura.com.br/forum/topico-duvida-indice-b-tree-para-campo-com-baixa-cardinalidade-266822

CREATE TABLE instrutor (
  id SERIAL PRIMARY KEY, 
  nome VARCHAR (255) NOT NULL, 
  salario DECIMAL (10, 2)
);

-- criando 200.000 registros
DO $$ 
  DECLARE 
  BEGIN 
    FOR I IN 1..200000 LOOP 
      INSERT INTO instrutor (nome, salario) VALUES ('Instrutor(a)' || i,random()  * 1000+ 1);
    END LOOP;      
  END;        
$$;

UPDATE instrutor SET salario = salario * 2 WHERE id % 2 = 1;

-- rodando uma query q mostra uma analise do plano de execucao
explain analyze select * from instrutor where salario > 1500;

-- criando o index
CREATE INDEX idx_salario on instrutor(salario);

-- rodando a mesma query de novo
explain analyze select * from instrutor where salario > 1500;

-- fazendo reindex, nesse momento ele busca todos os indices, 
-- em todas as tabelas e reorganiza para otimizar
reindex table instrutor;

-- rodando a mesma query de novo
explain analyze select * from instrutor where salario > 1500;

-- outro exemplo
Create table test_normal (
  empno varchar(10), 
  ename varchar(30), 
  sal numeric(10), 
  faixa varchar(10)
);

DO $$ 
  DECLARE 
  BEGIN 
    FOR I IN 1..200000 LOOP 
      Insert into test_normal values(
        to_char(i, 'FM999999999999999999'), 
        'md5(random()::text)', 
        random() * 10 + 1, 
        'ND'
      ); 
    END LOOP;      
  END;        
$$;

Create table test_random 
as
select /*+ append */ * from test_normal order by random();

-- SEM INDICE
explain analyze SELECT * FROM TEST_RANDOM where empno = '165076';
-- Execution Time: 24.497 ms / cost: 2521.34

CREATE INDEX IDX_RANDOM_1 ON TEST_RANDOM(EMPNO);

-- COM INDICE
explain analyze SELECT * FROM TEST_RANDOM where empno = '165076';
--  Execution Time: 0.091 ms / cost: 19.92



