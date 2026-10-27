CREATE TABLE funcionariocomissao (
    fcfuncodigo INT NOT NULL,
    fcano INT NOT NULL,
    fcmes INT NOT NULL,
    fcvalor DOUBLE NOT NULL DEFAULT 0.0,
    CONSTRAINT pk_fc_ano_mes PRIMARY KEY (fcfuncodigo, fcano, fcmes),
    CONSTRAINT fk_fc_funcodigo FOREIGN KEY (fcfuncodigo) REFERENCES funcionario (funcodigo) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Procedure para inserir ou atualizar a comissão de um funcionario
delimiter $$
create procedure sp_ajusta_fc_comissao(p_funcodigo int)
begin
    INSERT INTO
    funcionariocomissao (fcfuncodigo, fcano, fcmes, fcvalor)
    select
        funcodigo,
        YEAR(vendata),
        MONTH(vendata),
        SUM(propreco * itvqtde * (grpcomissao/100))
    from
        itemvenda
        join venda on vencodigo = itvvencodigo
        join produto on procodigo = itvprocodigo
        join funcionario on funcodigo = venfuncodigo
        join grupoproduto on grpcodigo = progrpcodigo
    where funcodigo = p_funcodigo
    group by
        funcodigo,
        YEAR(vendata),
        MONTH(vendata) ON Duplicate KEY
    UPDATE
        fcvalor = VALUES (fcvalor);
end$$
delimiter ;

-- Trigger para atualizar funcionariocomissao após insercão em itemvenda
delimiter $$

create trigger tg_atualiza_saldo_produto after insert on itemvenda
for each row
begin
	declare v_funcodigo int unsigned default 0;
    set v_funcodigo = (
		select venfuncodigo from venda where vencodigo = new.itvvencodigo
	);
    
    call sp_ajusta_fc_comissao(v_funcodigo);
    
end$$

delimiter ;

-- Query para verificar e fazer as inserções de venda e itemvenda para validar
select * from venda;
select * from itemvenda;
select * from produto join grupoproduto on grpcodigo = progrpcodigo order by procodigo;
select * from cliente;
select * from funcionariocomissao;


insert into venda
values 
(112, curdate(), 2, 8, 9, 1);

insert into venda
values 
(113, curdate(), 2, 2, 8, 1);

insert into itemvenda
values
(112, 2, 13);

insert into itemvenda
values
(113, 21, 1);

delimiter $$
