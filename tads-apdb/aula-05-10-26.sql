CREATE TABLE bairro (
    baicodigo int NOT NULL DEFAULT 0,
    bainome varchar(30) NOT NULL,
    baizoncodigo int NOT NULL,
    baiqtdepessoas int unsigned NOT NULL DEFAULT 0,
    
    PRIMARY KEY (baicodigo),
    KEY baizoncodigo (baizoncodigo),

    CONSTRAINT bairro_ibfk_1 FOREIGN KEY (baizoncodigo) REFERENCES zona (zoncodigo)

) ENGINE = InnoDB DEFAULT CHARSET = latin1;

DROP TABLE bairro_log;
CREATE TABLE bairro_log (
    baicodigo int NOT NULL,
    bainome varchar(30) NOT NULL,
    baizoncodigo int NOT NULL,
    baiqtdepessoas int unsigned NOT NULL,
    baitipoacao int unsigned NOT NULL COMMENT '0 - INSERT, 1 - UPDATE, 2 - DELETE',
    baidataacao datetime NOT NULL default CURRENT_TIMESTAMP,
    baiusuarioacao varchar(50) NOT NULL,
    baimaquinaacao varchar(50) NOT NULL,

    CONSTRAINT chk_tipo_acao
        CHECK (baitipoacao IN (1, 2, 3))
    
) ENGINE = MyISAM DEFAULT CHARSET = latin1;

-- Guardar registros excluídos em bairro;

SHOW COLUMNS FROM bairro_log;
SHOW COLUMNS FROM bairro;

select left(user(), locate('@', user()) - 1);

delimiter $$

create trigger tg_log_tabela_bairro after delete on bairro
for each row
begin

	declare v_usuario, v_maquina varchar(50) default '';
    set v_usuario = left(user(), locate('@', user()) - 1);
    set v_maquina = substring(user(), locate('@', user()) + 1);

	insert into bairro_log
    (baicodigo, bainome, baizoncodigo, baiqtdepessoas, baitipoacao, baiusuarioacao, baimaquinaacao)
    values
    (old.baicodigo, old.bainome, old.baizoncodigo, old.baiqtdepessoas, 2, v_usuario, v_maquina);
    
end$$

delimiter ;

drop trigger tg_log_tabela_bairro;

-- Exercício, a cada inserção em itemvenda, diminuir do saldo de produto

select * from produto where procodigo = 5;
select * from venda;
select * from itemvenda;

delimiter $$

create trigger tg_atualiza_saldo_produto before insert on itemvenda
for each row
begin
	declare saldo_produto int unsigned default 0;
    set saldo_produto = (select prosaldo from produto where procodigo = new.itvprocodigo);
    
    CASE 
		WHEN (saldo_produto <= 0 OR saldo_produto < new.itvqtde) then 
			signal sqlstate '45000' set message_text = 'OPERAÇÃO INVÁLIDA, SALDO INSUFICIENTE';
		ELSE update produto set prosaldo = (prosaldo - new.itvqtde) where procodigo = new.itvprocodigo;
	END CASE;
    
end$$

delimiter ;

drop trigger tg_atualiza_saldo_produto;

insert into itemvenda (itvvencodigo, itvprocodigo, itvqtde) values (112, 7, 4);
insert into itemvenda (itvvencodigo, itvprocodigo, itvqtde) values (112, 3, 10);
insert into itemvenda (itvvencodigo, itvprocodigo, itvqtde) values (112, 5, 3);

-- EVENT SCHEDULER

show variables like 'event_scheduler';

select * from produto where procodigo = 5;

create event ev_incrementa_saldo
on schedule 
every 1 minute
do
	update produto
    set prosaldo = prosaldo + 2
    where procodigo = 5;

alter event ev_incrementa_saldo DISABLE;

-- METADATA

USE information_schema;
select * from schemata;
