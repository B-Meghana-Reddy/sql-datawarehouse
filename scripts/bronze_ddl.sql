/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/
USE DataWarehouse;
GO

IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_cust_info;
GO

CREATE TABLE Bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

IF OBJECT_ID('Bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_prd_info;
GO

CREATE TABLE Bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

IF OBJECT_ID('Bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_sales_details;
GO

CREATE TABLE Bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
GO

IF OBJECT_ID('Bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_loc_a101;
GO

CREATE TABLE Bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

IF OBJECT_ID('Bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_cust_az12;
GO

CREATE TABLE Bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

IF OBJECT_ID('Bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_px_cat_g1v2;
GO

CREATE TABLE Bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO

--USE master;
--GO
--DROP TABLE Bronze.crm_cust_info;
--GO

TRUNCATE TABLE Bronze.crm_cust_info;
BULK INSERT Bronze.crm_cust_info
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.crm_cust_info;

TRUNCATE TABLE Bronze.crm_prd_info;
BULK INSERT Bronze.crm_prd_info
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.crm_prd_info;

TRUNCATE TABLE Bronze.crm_sales_details;
BULK INSERT Bronze.crm_sales_details
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.crm_sales_details;

TRUNCATE TABLE Bronze.erp_cust_az12;
BULK INSERT Bronze.erp_cust_az12
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.erp_cust_az12;

TRUNCATE TABLE Bronze.erp_loc_a101;
BULK INSERT Bronze.erp_loc_a101
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.erp_loc_a101;

TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
BULK INSERT Bronze.erp_px_cat_g1v2
FROM 'C:\Users\megha\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
);

SELECT COUNT(*) FROM Bronze.erp_px_cat_g1v2;

