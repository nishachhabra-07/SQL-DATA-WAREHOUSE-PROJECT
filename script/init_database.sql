/*
===============================================================================
Script:        init_database.sql
Purpose:       Create the Data Warehouse database and initialize its schemas.
               If the database already exists, it will be dropped and recreated.

WARNING:
Running this script will permanently delete the existing DataWarehouse database
and all data inside it. Make sure you have a backup before running this script.
===============================================================================
*/

-- Check if the database exists and drop it
USE Master;
Go
  
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

-- Create the Data Warehouse database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

