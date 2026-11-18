-- Aula dia 16-11-2026 - Aula sobre segurança e usuários


create user 'usuario'@'localhost' identified by 'Senha_123';

-- Esse aqui é para quando for um banco em container
-- create user 'usuario'@'172.18.%' identified by 'Senha_123';

DROP USER 'usuario'@'localhost';
SELECT PASSWORD('xyz123');