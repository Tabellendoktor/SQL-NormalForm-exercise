-- SQL file has been written for Der TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- How often is each product ordered?
SELECT tSIC.I_ID, Item.INAME, COUNT(tSIC.C_ID)
FROM SupplierItemCustomer tSIC
    INNER JOIN Item ON tSIC.I_ID = Item.I_ID
GROUP BY tSIC.I_ID, Item.INAME;

-- Which customer(s) order only one product?
SELECT CNAME, SICcount.C_ID, orderCount
FROM (
    SELECT C_ID, COUNT(I_ID) AS orderCount
    FROM SupplierItemCustomer
    GROUP BY C_ID
) AS SICcount
	INNER JOIN Customer ON SICcount.C_ID = Customer.C_ID
WHERE orderCount = 1;

-- How many customer names contain the letter ‚i‘?
SELECT COUNT(*)
FROM Customer
WHERE CNAME LIKE '%i%';

-- Which customer(s) never ordered a mouse? (It is done by looking for those customers who ordererd a mouse and then display all others)
SELECT *
FROM Customer
WHERE C_ID NOT IN 
(
    SELECT C_ID
    FROM SupplierItemCustomer
        INNER JOIN Item ON SupplierItemCustomer.I_ID = Item.I_ID
    WHERE INAME = 'Mouse'
    GROUP BY C_ID
);

-- Which product from which vendor had the highest margin?
SELECT SupplierItem.I_ID, Item.INAME, Supplier.S_ID, Supplier.SNAME, SALEPRICE - PURCHPRICE as Margin
FROM Item 
    INNER JOIN SupplierItem ON Item.I_ID = SupplierItem.I_ID
    INNER JOIN Supplier ON Supplier.S_ID = SupplierItem.S_ID
ORDER BY (SALEPRICE - PURCHPRICE) DESC
LIMIT 1; -- only first row