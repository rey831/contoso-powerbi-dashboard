
-- FACT SALES QUERY
SELECT *
FROM FactSales
WHERE Region IN ('Europe', 'Asia', 'North America')
AND [Date] >= '2022-01-01';

-- DIMENSION STORE QUERY
SELECT StoreKey, StoreName, City, StateProvinceName, Region
FROM DimStore
WHERE Status = 'Active';

-- DIMENSION GEOGRAPHY QUERY
SELECT *
FROM DimGeography;

-- DIMENSION SALES TERRITORY QUERY
SELECT SalesTerritoryKey, SalesTerritoryRegion, SalesTerritoryCountry
FROM DimSalesTerritory;

-- DIMENSION PRODUCT CATEGORY QUERY
SELECT ProductCategoryKey, ProductCategoryName
FROM DimProductCategory;

-- DIMENSION FACT ONLINE SALES QUERY
SELECT *
FROM FactOnlineSales;
