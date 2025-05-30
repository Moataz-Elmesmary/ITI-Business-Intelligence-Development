-- vw_DimProducts
CREATE VIEW vw_DimProducts AS
SELECT
    p.ProductID,
    p.Name AS ProductName,
    p.ProductNumber,
    p.Color,
    p.StandardCost,
    p.ListPrice,
    ps.Name AS ProductSubcategory,
    pc.Name AS ProductCategory
FROM
    Production.Product AS p
LEFT JOIN
    Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN
    Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID;

-- vw_DimSalesPersons
CREATE VIEW vw_DimSalesPersons AS
SELECT
    sp.BusinessEntityID AS SalesPersonID,
    p.FirstName,
    p.MiddleName,
    p.LastName,
    p.FirstName + ' ' + ISNULL(p.MiddleName + ' ', '') + p.LastName AS FullName,
    sp.SalesQuota,
    sp.Bonus,
    sp.CommissionPct,
    sp.SalesYTD,
    sp.SalesLastYear
FROM
    Sales.SalesPerson AS sp
INNER JOIN
    Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID;

-- vw_DimShipMethods
CREATE VIEW vw_DimShipMethods AS
SELECT
    ShipMethodID,
    Name AS ShipMethodName
FROM
    Purchasing.ShipMethod;

CREATE VIEW vw_DimStatuses AS
SELECT DISTINCT
    Status AS OrderStatusID,
    CASE Status
        WHEN 1 THEN 'In Process'
        WHEN 2 THEN 'Approved'
        WHEN 3 THEN 'Back Ordered'
        WHEN 4 THEN 'Rejected'
        WHEN 5 THEN 'Shipped'
        WHEN 6 THEN 'Cancelled'
        ELSE 'Unknown'
    END AS OrderStatusName
FROM
    Sales.SalesOrderHeader;


-- vw_DimTerritories
CREATE VIEW vw_DimTerritories AS
SELECT
    TerritoryID,
    Name AS TerritoryName,
    CountryRegionCode,
    "Group" AS SalesTerritoryGroup
FROM
    Sales.SalesTerritory;


-- vw_FactOrderDetails
CREATE VIEW vw_FactOrderDetails AS
SELECT
    sod.SalesOrderID,
    sod.SalesOrderDetailID,
    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal,
    soh.OrderDate,
    soh.DueDate,
    soh.ShipDate,
    soh.CustomerID,
    soh.SalesPersonID,
    soh.TerritoryID,
    soh.ShipMethodID,
    soh.SubTotal,
    soh.TaxAmt AS TaxAmount,
    soh.Freight,
    soh.TotalDue,
    soh.Status AS OrderStatusID
FROM
    Sales.SalesOrderDetail AS sod
INNER JOIN
    Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID;