Use master;
CREATE DATABASE DataWarehouse;
USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO


USE DataWarehouse;
CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key Varchar(50),
cst_firstname varchar(50),
cst_lastname Varchar(50),
cst_material_status Varchar(50),
cst_gender Varchar(50),
cst_create_date DATE
)
CREATE TABLE bronze.crm_prd_info
(
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt   DATE
);
GO


CREATE TABLE bronze.crm_sales_details
(
    sls_ord_num    VARCHAR(50),
    sls_prd_key    VARCHAR(50),
    sls_cust_id    INT,
    sls_order_dt   VARCHAR(50),
    sls_ship_dt    VARCHAR(50),
    sls_due_dt     VARCHAR(50),
    sls_sales      INT,
    sls_quantity   INT,
    sls_price      INT
);
GO



CREATE TABLE bronze.erp_cust_az12
(
    CID     VARCHAR(50),
    BDATE   DATE,
    GEN     VARCHAR(50)
);
GO

CREATE TABLE bronze.erp_loc_a101
(
    CID     VARCHAR(50),
    CNTRY   VARCHAR(50)
);
GO


CREATE TABLE bronze.erp_px_cat_g1v2
(
    ID          VARCHAR(50),
    CAT         VARCHAR(50),
    SUBCAT      VARCHAR(50),
    MAINTENANCE VARCHAR(50)
);
GO



  
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
PRINT'--------------'
PRINT'LOADING BRONZE LAYER'
PRINT'---------------'


PRINT'=========='
PRINT'LOADING CRM TABLES'
PRINT'=========='


PRINT'>>TRUNCATING TABLES:bronze.crm_cust_info'
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT COUNT(*)
FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT COUNT(*)
FROM bronze.crm_prd_info;

TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT COUNT(*)
FROM bronze.crm_sales_details;

PRINT'----------------'
PRINT'LOADING ERP TABLES'
PRINT'-----------------'



TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT COUNT(*)
FROM bronze.erp_cust_az12;


TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT COUNT(*)
FROM bronze.erp_loc_a101;



PRINT'>>Truncating Table:bronze.erp_px_cat_giv2';
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);



SELECT COUNT(*)
FROM bronze.erp_px_cat_g1v2;
END;

