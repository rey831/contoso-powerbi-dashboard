
-- FACT SALES QUERY
Create VIEW add_date_city_add AS
SELECT 
	dbo.FactSales.SalesKey AS SalesKey,
    DATEADD(year, 14, DateKey) AS NewDate,
	dbo.FactSales.channelKey AS ChannelKey,
	dbo.FactSales.StoreKey AS StoreKey,
	dbo.FactSales.ProductKey AS ProductKey, 
	dbo.FactSales.UnitCost AS UnitCost,
	dbo.FactSales.UnitPrice AS UnitPrice,
	dbo.FactSales.SalesQuantity AS SalesQuantity,
	dbo.FactSales.ReturnQuantity AS ReturnQuantity,
	dbo.FactSales.ReturnAmount AS ReturnAmount, 
	dbo.FactSales.DiscountQuantity AS DiscountQTY,
	dbo.FactSales.DiscountAmount AS DiscountAmount, 
	dbo.FactSales.TotalCost AS TotalCost, 
	dbo.FactSales.SalesAmount AS SalesAmount
FROM dbo.FactSales
INNER JOIN
	dbo.DimStore ON dbo.Dimstore.StoreKey = dbo.FactSales.StoreKey
INNER JOIN
	dbo.DimGeography ON dbo.Dimstore.Geographykey = dbo.DimGeography.Geographykey
WHERE DateKey BETWEEN '2007-01-01' AND '2009-12-31'
AND dbo.dimGeography.ContinentName IN ('Europe', 'North America', 'Asia');

-- Dimension Store
CREATE VIEW dim_storegeo AS
SELECT
    dbo.DimGeography.GeographyKey AS GeographyKey,
    dbo.DimStore.StoreKey AS StoreKey ,
	dbo.DimStore.StoreName AS StoreName, 
	dbo.DimGeography.RegionCountryName AS CountryName, 
	dbo.DimGeography.ContinentName AS ContinentName
FROM
    dbo.DimGeography
INNER JOIN
    dbo.DimStore
ON 
    dbo.DimGeography.GeographyKey = dbo.DimStore.GeographyKey
WHERE dbo.dimGeography.ContinentName IN ('Europe', 'North America', 'Asia');

-- Dimension Geography
select * from dbo.DimGeography
where ContinentName = 'Europe' OR ContinentName = 'North America' OR ContinentName = 'Asia';

-- Dimension Sales Territory
select * from dbo.DimSalesTerritory
Where SalesTerritoryGroup = 'Europe';

-- Dimension Product Category
select * from dbo.DimProductCategory;
select * from dbo.DimProductSubcategory;

-- Dimension Fact Online Sales
Create VIEW add_online_sales_1 AS
SELECT 
	dbo.FactOnlineSales.OnlineSalesKey AS SalesKey,
    DATEADD(year, 14, DateKey) AS NewDate,
	dbo.FactOnlineSales.StoreKey AS StoreKey,
	dbo.FactOnlineSales.ProductKey AS ProductKey, 
	dbo.FactOnlineSales.CustomerKey AS CustomerKey,
	dbo.FactOnlineSales.SalesOrderNumber AS SalesOrderNumber,
	dbo.FactOnlineSales.SalesQuantity AS SalesQuantity,
	dbo.FactOnlineSales.SalesAmount AS SalesAmount,
	dbo.FactOnlineSales.ReturnQuantity AS ReturnQty,
	dbo.FactOnlineSales.ReturnAmount AS ReturnAmount, 
	dbo.FactOnlineSales.DiscountQuantity AS DiscountQTY,
	dbo.FactOnlineSales.DiscountAmount AS DiscountAmount, 
	dbo.FactOnlineSales.TotalCost AS TotalCost, 
	dbo.FactOnlineSales.UnitCost AS UnitCost, 
	dbo.FactOnlineSales.UnitPrice AS UnitPrice 
FROM dbo.FactOnlineSales
INNER JOIN
	dbo.DimStore ON dbo.Dimstore.StoreKey = dbo.FactOnlineSales.StoreKey
INNER JOIN
	dbo.DimGeography ON dbo.Dimstore.Geographykey = dbo.DimGeography.Geographykey
WHERE DateKey BETWEEN '2007-01-01' AND '2009-12-31'
AND dbo.dimGeography.ContinentName IN ('Europe', 'North America', 'Asia');


