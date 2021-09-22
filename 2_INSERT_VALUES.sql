-- SQL file has been written for Der TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- Insert data in the right order to be able to fulfill the foreign key requirements
INSERT INTO Postcode (POST, CITY, POSTSTATE) VALUES
    (80333, 'Munich', 'BY'),
    (40547, 'Dusseldorf', 'NRW'),
    (30167, 'Hannover', 'NS'),
    (22305, 'Hamburg', ' HH'),
    (44227, 'Dortmund', 'NRW')
;

INSERT INTO Customer (C_ID, CNAME, CPOST) VALUES
    (1, 'Meister', 80333),
    (2, 'Armin', 40547),
    (3, 'Vogel', 30167),
    (4, 'Lutz', 22305)
;

INSERT INTO Supplier (S_ID, SNAME, SPOST) VALUES
    (1, 'MC', 80333),
    (2, 'IPC', 44227)
;

INSERT INTO Item (I_ID, INAME, SALEPRICE) VALUES
    (2, 'Keyboard', 29),
    (3, 'Mouse', 19),
    (1, 'Router', 49)
;

INSERT INTO SupplierItem (S_ID, I_ID, PURCHPRICE) VALUES
    (1, 2, 18.00),
    (1, 3, 12.00),
    (2, 2, 17.00),
    (2, 1, 35.00)
;

INSERT INTO SupplierItemCustomer (S_ID, I_ID, C_ID) VALUES
    (1, 2, 2),
    (1, 2, 4),
    (1, 3, 4),
    (1, 3, 3),
    (2, 2, 2),
    (2, 2, 1),
    (2, 2, 3)
;