-- Aula estutura de repetição

delimiter $$

create procedure sp_while()
begin
    declare i int default 0;

    while i < 10 do
        select i;
        set i = i + 1;
    end while;
end$$

delimiter ;

call sp_while();

-- imprimir cada letra de um varchar

delimiter $$ 

create procedure sp_imprime_letras(IN p_texto varchar(100))
begin
    declare v_tamanho smallint default length(p_texto);
    declare v_contador smallint default 1;

    while v_contador <= v_tamanho do
        select substring(p_texto, v_contador, 1);
        set v_contador = v_contador + 1;
    end while;
end$$

delimiter ;

call sp_imprime_letras('AOBA');

-- Exercício 1 - Quantidade vogais de um texto passado;
delimiter $$ 

create procedure sp_qtd_vogais(IN p_texto varchar(100))
begin
    declare v_tamanho smallint default length(p_texto);
    declare v_contador smallint default 1;
    declare v_contador_vogais smallint default 0;

	while v_contador <= v_tamanho do
        if substring(p_texto, v_contador, 1) in ('A', 'B', 'C', 'D', 'E') then
            set v_contador_vogais = v_contador_vogais + 1;
		end if;
		set v_contador = v_contador + 1;
    end while;
    
    select v_contador_vogais qtd_vogais;
    
end$$

delimiter ;

call sp_qtd_vogais('Gabriel');

-- Exercício 2 - Quantidade consoantes de um texto passado;
delimiter $$ 

create procedure sp_qtd_consoantes(IN p_texto varchar(100))
begin
    declare v_tamanho smallint default length(p_texto);
    declare v_contador smallint default 1;
    declare v_contador_consoantes smallint default 0;

	while v_contador <= v_tamanho do
        if substring(p_texto, v_contador, 1) not in ('A', 'B', 'C', 'D', 'E') then
            set v_contador_consoantes = v_contador_consoantes + 1;
		end if;
		set v_contador = v_contador + 1;
    end while;
    
    select v_contador_consoantes qtd_vogais;
    
end$$

delimiter ;

call sp_qtd_consoantes('Gabriel');

-- Exercício 3 - Retorne um texto com "-" - Ex.: Banco - B-a-n-c-o
delimiter $$ 

create procedure sp_texto_com_hifens(IN p_texto varchar(100))
begin
    declare v_tamanho smallint default length(p_texto);
	declare v_contador smallint default 1;
    declare saida_text varchar(100) default '';

	while v_contador <= v_tamanho do
        if v_contador = v_tamanho then
            set saida_text = concat(saida_text, substring(p_texto, v_contador, 1));
        else
            set saida_text = concat(saida_text, substring(p_texto, v_contador, 1), '-');
		end if;
        set v_contador = v_contador + 1;
    end while;
    
    select saida_text;
    
end$$

delimiter ;

-- drop procedure sp_while;
call sp_texto_com_hifens('Gabriel');
