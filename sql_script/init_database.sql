/*
=========================================================
Create Database and Schemas
=========================================================
Purpose:
    Drops and recreates the DataWarehosue database.
    Creates bronze, silver, and gold schemas.

WARNING:
    This will permanently delete the database if it exists.
    Run while connected to the 'postgres' database.
=========================================================
*/

-- Terminate active connections
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'DataWarehosue';

-- Drop and recreate database
DROP DATABASE IF EXISTS "DataWarehosue";
CREATE DATABASE "DataWarehosue";


-- After creating the database:
-- Connect to "DataWarehosue" before running below

CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
