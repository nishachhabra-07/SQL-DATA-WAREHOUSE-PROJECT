CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    PRINT '--------------';
    PRINT 'LOADING BRONZE LAYER';
    PRINT '--------------';


    PRINT '==========';
    PRINT 'LOADING CRM TABLES';
    PRINT '==========';


    -- CRM Customer Info
    PRINT '>> TRUNCATING TABLE: bronze.crm_cust_info';

    TRUNCATE TABLE bronze.crm_cust_info;

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info';


    -- CRM Product Info
    PRINT '>> TRUNCATING TABLE: bronze.crm_prd_info';

    TRUNCATE TABLE bronze.crm_prd_info;

    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.crm_prd_info';


    -- CRM Sales Details
    PRINT '>> TRUNCATING TABLE: bronze.crm_sales_details';

    TRUNCATE TABLE bronze.crm_sales_details;

    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.crm_sales_details';


    PRINT '----------------';
    PRINT 'LOADING ERP TABLES';
    PRINT '----------------';


    -- ERP Customer
    PRINT '>> TRUNCATING TABLE: bronze.erp_cust_az12';

    TRUNCATE TABLE bronze.erp_cust_az12;

    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.erp_cust_az12';


    -- ERP Location
    PRINT '>> TRUNCATING TABLE: bronze.erp_loc_a101';

    TRUNCATE TABLE bronze.erp_loc_a101;

    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.erp_loc_a101';


    -- ERP Product Category
    PRINT '>> TRUNCATING TABLE: bronze.erp_px_cat_g1v2';

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT '>> INSERTING DATA INTO: bronze.erp_px_cat_g1v2';


END;
