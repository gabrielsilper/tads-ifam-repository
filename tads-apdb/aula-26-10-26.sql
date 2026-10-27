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
        SUM(prosaldo * itvqtde * grpcomissao)
    from
        itemvenda
        join venda on vencodigo = itvvencodigo
        join produto on procodigo = itvprocodigo
        join funcionario on funcodigo = venfuncodigo
        join grupoproduto on grpcodigo = progrpcodigo
    where funcodigo = 9
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