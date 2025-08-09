-- Criação do banco de dados
USE master;
GO

-- Verifica se o banco existe e remove se necessário
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DexianDB')
BEGIN
    ALTER DATABASE DexianDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DexianDB;
END
GO

-- Cria o banco de dados
CREATE DATABASE DexianDB;
GO

USE DexianDB;
GO

-- Cria o usuário com permissões CRUD
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'dexian_usr')
BEGIN
    DROP LOGIN dexian_usr;
END
GO

CREATE LOGIN dexian_usr WITH PASSWORD = 'Dexian123!';
GO

CREATE USER dexian_usr FOR LOGIN dexian_usr;
GO

-- Concede permissões CRUD ao usuário
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO dexian_usr;
GO

-- Cria a tabela de agências bancárias (tabela pai)
CREATE TABLE dbo.Agencia (
    AgenciaId INT IDENTITY(1,1) PRIMARY KEY,
    NomeBanco VARCHAR(100) NOT NULL,
    Agencia VARCHAR(100) NOT NULL,
    DataCriacao DATETIME DEFAULT GETDATE(),
    DataAtualizacao DATETIME DEFAULT GETDATE()
);
GO

-- Cria a tabela de contas bancárias (tabela filha)
CREATE TABLE dbo.Conta (
    ContaId INT IDENTITY(1,1) PRIMARY KEY,
    AgenciaId INT NOT NULL,
	NumeroConta VARCHAR(40),
    DataUltimoMovimento DATETIME NULL,
    Saldo DECIMAL(19, 4) DEFAULT 0.00,
	Observacoes VARCHAR(800),
    DataCriacao DATETIME DEFAULT GETDATE(),
    DataAtualizacao DATETIME DEFAULT GETDATE(),
    
    CONSTRAINT FK_Conta_Agencia FOREIGN KEY (AgenciaId) 
        REFERENCES dbo.Agencia(AgenciaId)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- Cria índice para melhorar performance nas consultas por agência
CREATE INDEX IX_Conta_AgenciaId ON dbo.Conta(AgenciaId);
GO

-- Cria trigger para atualizar DataAtualizacao automaticamente
CREATE TRIGGER tr_Agencia_Update
ON dbo.Agencia
AFTER UPDATE
AS
BEGIN
    UPDATE dbo.Agencia
    SET DataAtualizacao = GETDATE()
    FROM dbo.Agencia a
    INNER JOIN inserted i ON a.AgenciaId = i.AgenciaId
END
GO

CREATE TRIGGER tr_Conta_Update
ON dbo.Conta
AFTER UPDATE
AS
BEGIN
    UPDATE dbo.Conta
    SET DataAtualizacao = GETDATE()
    FROM dbo.Conta c
    INNER JOIN inserted i ON c.ContaId = i.ContaId
END
GO

PRINT 'Banco de dados, tabelas e usuário criados com sucesso!';
GO
