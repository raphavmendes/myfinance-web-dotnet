select * from planoconta

select * from transacao

insert into planoconta(nome, tipo) values('Combustivel','D')
insert into planoconta(nome, tipo) values('Alimentação','D')
insert into planoconta(nome, tipo) values('Aluguel','D')
insert into planoconta(nome, tipo) values('Água','D')
insert into planoconta(nome, tipo) values('Luz','D')
insert into planoconta(nome, tipo) values('Internet','D')
insert into planoconta(nome, tipo) values('Salário','R')
insert into planoconta(nome, tipo) values('Crédito de Dividendos','R')

insert into transacao (data, valor, historico, tipo, planocontaid)
values(getdate(),458,'Gasolina da Blazer','D',1)

insert into transacao (data, valor, historico, tipo, planocontaid)
values('2024-11-03 13:05',120.58,'Almoço de Domingo','D',2)

insert into transacao (data, valor, historico, tipo, planocontaid)
values('2024-10-01',25,'Padaria','D',2)

insert into transacao (data, valor, tipo, planocontaid)
values('2024-11-05',1000,'R',7)

insert into transacao (data, valor, historico, tipo, planocontaid)
values('2024-31-10',868.32,'Dividendos itaú','R',8)


select * from TRANSACAO where tipo = 'D'
select * from TRANSACAO where tipo = 'R'
select count(*) from TRANSACAO where tipo = 'D'
select count(*) from TRANSACAO where tipo = 'R'
select sum(valor) from TRANSACAO where tipo = 'D'
select sum(valor) from TRANSACAO where tipo = 'R'
select avg(valor) from TRANSACAO where tipo = 'D'
select avg(valor) from TRANSACAO where tipo = 'R'
select max(valor) from TRANSACAO where tipo = 'D'
select max(valor) from TRANSACAO where tipo = 'R'
select min(valor) from TRANSACAO where tipo = 'D'
select min(valor) from TRANSACAO where tipo = 'R'

select * from TRANSACAO where data >= '20240101 00:00:00' and data <= '20240331 23:59:59'
select * from TRANSACAO where data between '20240101 00:00:00' and '20240331 23:59:59'

select tipo, sum(valor) from TRANSACAO
where data >= '20240101 00:00:00' and data <= '20241231 23:59:59'
group by tipo

select T.*, P.nome AS Categoria 
from TRANSACAO AS T INNER JOIN PLANOCONTA AS P
ON T.planocontaid = p.id
where data >= '20240101 00:00:00' and data <= '20241231 23:59:59'

--Como descobrir quais categorias de plano de contas ainda não possuem transações vinculadas?
select P.ID, P.NOME, T.ID AS CODIGOTRANSACAO
FROM PLANOCONTA AS P LEFT JOIN TRANSACAO AS T
ON P.id = T.planocontaid
WHERE T.ID IS NULL