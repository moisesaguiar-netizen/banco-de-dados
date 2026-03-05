create table produtos (
  codigo_produto INT primary key,
  nome_produto varchar(100) not null,
  preço_unitario_kg decimal(10,2) not null,
  comentarios text
  );
select * from produtos;
