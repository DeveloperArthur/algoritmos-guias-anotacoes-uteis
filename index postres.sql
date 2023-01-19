-- link: https://onecompiler.com/postgresql/3yva6eefa
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
