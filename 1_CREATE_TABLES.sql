-- SQL file has been written for Der TabellenDoktor (www.tabellendoktor.de)
-- Please feel free to use the SQL examples but keep the link to the website included. Thank you!

-- Delete tables from database if they exist already
DROP TABLE IF EXISTS SupplierItemCustomer;
DROP TABLE IF EXISTS SupplierItem;
DROP TABLE IF EXISTS Item;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Postcode; 

-- Create table Postcode
CREATE TABLE Postcode (
    POST INTEGER,
    CITY VARCHAR(30) NOT NULL, 
    POSTSTATE VARCHAR(30) NOT NULL, -- "STATE" is an reserved keyword for certain SQL interpretations
    PRIMARY KEY (POST) 
);

-- Create table Customer
CREATE TABLE Customer (
    C_ID INTEGER,
    CNAME VARCHAR(30) NOT NULL, 
    CPOST INTEGER NOT NULL, 
    FOREIGN KEY (CPOST) REFERENCES Postcode(POST),
    PRIMARY KEY (C_ID) 
);

-- Create table Supplier
CREATE TABLE Supplier (
    S_ID INTEGER, -- "SID" is an reserved keyword for certain SQL interpretations
    SNAME VARCHAR(30) NOT NULL, 
    SPOST INTEGER NOT NULL, 
    FOREIGN KEY (SPOST) REFERENCES Postcode(POST),
    PRIMARY KEY (S_ID) 
);

-- Create table Item
CREATE TABLE Item (
    I_ID INTEGER, -- "SID" is an reserved keyword for certain SQL interpretations
    INAME VARCHAR(30) NOT NULL, 
    SALEPRICE NUMERIC(9,2), 
    PRIMARY KEY (I_ID) 
);

-- Create table for supplier-item relationship
CREATE TABLE SupplierItem (
    S_ID INTEGER,
    I_ID INTEGER,
    PURCHPRICE NUMERIC(9,2), 
    FOREIGN KEY (S_ID) REFERENCES Supplier(S_ID),
    FOREIGN KEY (I_ID) REFERENCES Item(I_ID),
    PRIMARY KEY (S_ID, I_ID)
);

-- And now the supplier-item to customer relation
CREATE TABLE SupplierItemCustomer (
    S_ID INTEGER,
    I_ID INTEGER,
    C_ID INTEGER,
    FOREIGN KEY (S_ID) REFERENCES SupplierItem(S_ID),
    FOREIGN KEY (I_ID) REFERENCES SupplierItem(I_ID),
    FOREIGN KEY (C_ID) REFERENCES Customer(C_ID),
    PRIMARY KEY (S_ID, I_ID, C_ID)
);