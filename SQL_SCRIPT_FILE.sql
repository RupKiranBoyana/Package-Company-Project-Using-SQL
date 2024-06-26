CREATE DATABASE PackageDBBB;
USE PackageDBBB;

----------------------------------------------------------------------------------------------------------------------------------------------
--CREATING TABLES AND ASSIGNING PRIMARY KEYS TO ATTRIBUTES--
----------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Customers (
    Customer_ID_PK INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
	Address_ID_FK SMALLINT NOT NULL,
    Phone_number VARCHAR(20) NOT NULL,
    Email_address VARCHAR(100) NOT NULL,
);

CREATE TABLE BillingAccounts (
    Billing_Account_number_PK BIGINT PRIMARY KEY,
    Billing_Mobile_Number NVARCHAR(50) NOT NULL,
    Billing_Name NVARCHAR(50) NOT NULL,
	Customer_ID_FK INT NOT NULL,
	Address_1 SMALLINT NOT NULL,
);

CREATE TABLE Orders (
    Order_ID_PK INT PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Estimated_Delivery_Date DATE NOT NULL,
    Order_Status NVARCHAR(50) NOT NULL,
	No_of_packages TINYINT NOT NULL,
	Billing_Account_number_FK BIGINT NOT NULL,
);

CREATE TABLE Invoices (
    Invoice_number_PK BIGINT PRIMARY KEY,
	Monthly_billing_amount NVARCHAR(50) NULL,
	Full_Payment NVARCHAR(50) NULL,
	Payment_Type NVARCHAR(50) NOT NULL,
	Total_Invoice_Amount SMALLINT NOT NULL,
	Order_ID_FK INT NOT NULL,
);

CREATE TABLE Packages (
    Package_ID_PK INT PRIMARY KEY,
	Package_Type NVARCHAR(50) NOT NULL,
	Package_weight_lb FLOAT NOT NULL,
	Hazardous_material VARCHAR(50) NOT NULL,
	Customs_declaration VARCHAR(50) NOT NULL,
	Order_ID_1 INT NOT NULL,
);

CREATE TABLE Shipments (
    Shipment_ID_PK INT PRIMARY KEY,
	Shipment_date DATE NOT NULL,
	Origin_Warehouse_ID_FK SMALLINT NOT NULL,
	Destination_Warehouse_ID_FK SMALLINT NOT NULL,
	Shipment_status NVARCHAR(50) NOT NULL,
	Carrier VARCHAR(50) NOT NULL,
	Tracking_number BIGINT NOT NULL,
	Shipment_Type NVARCHAR(50) NULL,
	Shipment_Expected_Delivery_Date DATE NOT NULL,
	Shipment_Delivered_Date NVARCHAR(50) NULL,
	Shipment_Returned_Date NVARCHAR(50) NULL,
	Package_ID_FK INT NOT NULL,
);

CREATE TABLE CreditCards (
    Card_ID_PK SMALLINT PRIMARY KEY,
    Credit_card_number NVARCHAR(50) NOT NULL,
    Expiration_date NVARCHAR(50) NOT NULL,
    Security_code SMALLINT NOT NULL,
	Billing_Account_number_FK1 BIGINT NULL,
);

CREATE TABLE AddressTable (
    Address_ID_PK SMALLINT PRIMARY KEY,
    Street NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    City  NVARCHAR(50) NOT NULL,
	Country NVARCHAR(50) NOT NULL,
    ZipCode INT NOT NULL,
);

CREATE TABLE Employee (
    Employee_ID_PK INT PRIMARY KEY,
    First_name NVARCHAR(50) NOT NULL,
    Last_name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
	Phone_number NVARCHAR(50) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
	Order_ID_FK1 INT NULL,
	Invoice_number_FK BIGINT NOT NULL,
);

------------------------------------------------------------------------------------------------------------------------------
--INSERTING DATA INTO TABLES--
------------------------------------------------------------------------------------------------------------------------------

--Customers
USE PackageDBBB

INSERT INTO Customers(Customer_ID_PK, First_name, Last_name, Address_ID_FK, Phone_number, Email_address)
VALUES
    (1000000000, 'Emma', 'Smith', 14569, '(555) 123-4567', 'emma.smith@example.com'),
    (1000000001, 'Liam', 'Johnson', 14570, '(555) 234-5678', 'liam.johnson@example.com'),
    (1000000002, 'Olivia', 'Williams', 14571, '(555) 345-6789', 'olivia.brown@example.com'),
    (1000000003, 'Noah', 'Brown', 14572, '(555) 456-7890', 'noah.davis@example.com'),
    (1000000004, 'Ava', 'Jones', 14573, '(555) 567-8901', 'ava.miller@example.com'),
    (1000000005, 'Ethan', 'Garcia', 14574, '(555) 678-9012', 'ethan.garcia@example.com'),
    (1000000006, 'Sophia', 'Miller', 14575, '(555) 789-0123', 'sophia.rodriguez@example.com'),
    (1000000007, 'Jackson', 'Davis', 14576, '(555) 890-1234', 'jackson.martinez@example.com'),
    (1000000008, 'Isabella', 'Martinez', 14577, '(555) 901-2345', 'isabella.nguyen@example.com'),
    (1000000009, 'Lucas', 'Rodriguez', 14578, '(555) 012-3456', 'lucas.hernandez@example.com'),
    (1000000010, 'Linda', 'Jhon', 14579, '(555) 012-3457', 'Linda.Jhon@example.com'),
    (1000000011, 'Mike', 'Tyson', 14580, '(555) 012-3458', 'Mike.Tyson@example.com');


--BillingAccounts

INSERT INTO BillingAccounts (Billing_Account_number_PK, Billing_Mobile_Number, Billing_Name, Customer_ID_FK, Address_1)
VALUES
    (1234567888, '(555) 123-4567', 'Emma', 1000000000, 14569),
    (9876543889, '(555) 234-5678', 'Liam', 1000000001, 14570),
    (18518519890, '(555) 345-6789', 'Olivia', 1000000002, 14571),
    (27160495891, '(555) 456-7890', 'Noah', 1000000003, 14572),
    (35802471892, '(555) 567-8901', 'Ava', 1000000004, 14573),
    (44444447893, '(555) 678-9012', 'Ethan', 1000000005, 14574),
    (53086423894, '(555) 789-0123', 'Sophia', 1000000006, 14575),
    (61728399895, '(555) 890-1234', 'Jackson', 1000000007, 14576),
    (70370375896, '(555) 901-2345', 'Isabella', 1000000008, 14577),
    (79012351897, '(555) 012-3456', 'Lucas', 1000000009, 14578),
    (87654327898, '(555) 012-3457', 'Linda', 1000000010, 14579),
    (96296303899, '(555) 012-3458', 'Mike', 1000000011, 14580);


--Orders

INSERT INTO Orders (Order_ID_PK, Order_Date, Estimated_Delivery_Date, Order_Status, No_of_packages, Billing_Account_number_FK)
VALUES
    (87915, '1/2/2023', '1/7/2023', 'Order Completed', 1, 1234567888),
    (91916, '2/1/2023', '2/9/2023', 'Shipped', 1, 9876543889),
    (95917, '3/5/2023', '3/11/2023', 'Shipped', 1, 18518519890),
    (99918, '3/25/2023', '4/15/2023', 'Shipment Delayed', 1, 27160495891),
    (103919, '1/3/2023', '1/9/2023', 'Arrived at Facility', 1, 35802471892),
    (107920, '2/4/2023', '2/15/2023', 'Departed Facility', 1, 44444447893),
    (111921, '3/3/2023', '3/12/2023', 'Exception', 1, 53086423894),
    (115922, '4/1/2023', '4/10/2023', 'Held at Customs', 1, 61728399895),
    (119923, '1/2/2023', '1/10/2023', 'Return Order', 1, 70370375896),
	(123924, '4/5/2023', '4/20/2023', 'Order Cancelled', 1, 79012351897),
    (127925, '4/5/2022', '4/10/2022', 'Order Completed', 3, 87654327898),
    (131926, '4/5/2022', '4/10/2022', 'Order Completed', 2, 96296303899);


--Invoices

INSERT INTO Invoices (Invoice_number_PK, Monthly_billing_amount, Full_Payment, Payment_Type, Total_Invoice_Amount, Order_ID_FK)
VALUES
    (1234567890, NULL, 150, 'Monthly Payment', 150, 87915),
    (9876543210, NULL, 95, 'Monthly Payment', 95, 91916),
    (2468101214, NULL, 200, 'Monthly Payment', 200, 95917),
    (5556667778, NULL, 85, 'Monthly Payment', 85, 99918),
    (9012345678, NULL, 310, 'Monthly Payment', 310, 103919),
    (3141592653, 175, NULL, 'Credit Card', 500, 107920),
    (7778889990, 245, NULL, 'Credit Card', 700, 111921),
    (2223334445, 120, NULL, 'Credit Card', 400, 115922),
    (5555555550, 280, NULL, 'Credit Card', 750, 119923),
    (9999999999, 150, NULL, 'Credit Card', 400, 123924),
    (1444444444, NULL, 500, 'Credit Card', 500, 127925),
    (1888888889, NULL, 1000, 'Credit Card', 1000, 127925),
    (2333333334, NULL, 2000, 'Credit Card', 2000, 127925),
    (2777777779, 200, NULL, 'Monthly Payment', 400, 131926),
    (3222222224, 300, NULL, 'Monthly Payment', 900, 131926);


--Packages

INSERT INTO Packages(Package_ID_PK, Package_type, Package_weight_lb, Hazardous_material, Customs_declaration, Order_ID_1)
VALUES
    (123456789, 'Flat envelope', 0.5, 'Yes', 'Yes', 87915),
    (987654321, 'Small box', 1, 'No', 'No', 91916),
    (246813579, 'Large box', 5, 'Yes', 'Yes', 95917),
    (135792468, 'Flat envelope', 0.5, 'Yes', 'Yes', 99918),
    (369258147, 'Small box', 2, 'No', 'No', 103919),
    (864297531, 'Large box', 4, 'No', 'No', 107920),
    (975318642, 'Flat envelope', 0.25, 'Yes', 'Yes', 111921),
    (482619735, 'Small box', 3, 'No', 'No', 115922),
    (753186429, 'Large box', 6, 'Yes', 'Yes', 119923),
    (619273548, 'Flat envelope', 0.5, 'No', 'No', 123924),
    (485360667, 'Small box', 2, 'No', 'No', 127925),
    (351447786, 'Large box', 9, 'No', 'No', 127925),
    (217534905, 'Large box', 9, 'No', 'No', 127925),
    (83622024, 'Small box', 2, 'No', 'No', 131926),
    (150290857, 'Small box', 3, 'No', 'No', 131926);


--Shipments

INSERT INTO Shipments (Shipment_ID_PK, Shipment_date, Origin_Warehouse_ID_FK, Destination_Warehouse_ID_FK, Shipment_status, Carrier, Tracking_number, Shipment_Type, Shipment_Expected_Delivery_Date, Shipment_Delivered_Date, Shipment_Returned_Date, Package_ID_FK)
VALUES
    (87412, '1/5/2023', 14581, 14593, 'Delivered', 'LTU', '123456789012', 'Truck1721', '1/7/2023', '1/7/2023', 'N/A', 123456789),
    (91273, '2/2/2023', 14582, 14594, 'In Transit', 'LTU', '987654321012', 'Aircraft113', '2/9/2023', 'N/A', 'N/A', 987654321),
    (52390, '3/9/2023', 14583, 14595, 'Out for Delivery', 'LTU', '456789012345', 'Truck1721', '3/11/2023', 'N/A', 'N/A', 246813579),
    (67908, '4/1/2023', 14584, 14596, 'Delayed', 'LTU', '210987654321', 'N/A', '4/15/2023', 'N/A', 'N/A', 135792468),
    (34871, '1/7/2023', 14585, 14597, 'Arrived at Facility', 'LTU', '109012345678', 'Aircraft104', '1/9/2023', 'N/A', 'N/A', 369258147),
    (92134, '2/7/2023', 14586, 14598, 'Departed Facility', 'LTU', '543210987654', 'Truck9921', '2/15/2023', 'N/A', 'N/A', 864297531),
    (15682, '3/8/2023', 14587, 14599, 'Exception', 'LTU', '102345678901', 'N/A', '3/12/2023', 'N/A', 'N/A', 975318642),
    (78923, '4/3/2023', 14588, 14600, 'Held at Customs', 'LTU', '108901234567', 'N/A', '4/10/2023', 'N/A', 'N/A', 482619735),
    (43719, '1/3/2023', 14589, 14601, 'Returned to Sender', 'LTU', '345678901234', 'Truck9981', '1/10/2023', '1/10/2023', '1/15/2023', 753186429),
    (67239, '4/11/2023', 14590, 14602, 'Shipment Cancelled', 'LTU', '109012345678', 'N/A', '4/20/2023', 'N/A', 'N/A', 619273548),
    (90759, '4/6/2022', 14591, 14603, 'Delivered', 'LTU', '127654209878', 'Truck9999', '4/10/2022', '4/10/2022', 'N/A', 485360667),
    (11427, '4/6/2022', 14591, 14603, 'Delivered', 'LTU', '364320765434', 'Truck9999', '4/10/2022', '4/10/2022', 'N/A', 351447786),
    (67905, '4/6/2022', 14591, 14603, 'Delivered', 'LTU', '600987320990', 'Truck9999', '4/10/2022', '4/10/2022', 'N/A', 217534905),
    (14723, '4/6/2022', 14592, 14604, 'Delivered', 'LTU', '837653876546', 'Truck0011', '4/10/2022', '4/10/2022', 'N/A', 83622024),
    (22656, '4/6/2022', 14592, 14604, 'Delivered', 'LTU', '107432043210', 'Truck0011', '4/10/2022', '4/10/2022', 'N/A', 150290857);


--Credit Cards

INSERT INTO CreditCards(Card_ID_PK, Credit_card_number, Expiration_date, Security_code, Billing_Account_number_FK1)
VALUES
    (10101, '234-5678-9012-3456', '07/23', '934', 1234567888),
    (10102, '876-5432-1098-7654', '12/24', '652', 9876543889),
    (10103, '111-2222-3333-4444', '11/27', '789', 18518519890),
    (10104, '444-3333-2222-1111', '06/23', '426', 27160495891),
    (10105, '555-5555-5555-5554', '09/26', '513', 35802471892),
    (10106, '234-5678-9012-3451', '04/28', '846', 44444447893),
    (10107, '876-5432-1098-7645', '03/28', '227', 53086423894),
    (10108, '000-0000-0000-0000', '02/24', '935', 61728399895),
    (10109, '212-3434-5656-7878', '09/26', '371', 70370375896),
    (10110, '8765-4321-0987-6543', '12/24', '704', 79012351897),
    (10111, '212-3434-5656-7879', '03/23', '103', 87654327898),
    (10112, '8765-4321-0987-6544', '06/25', '137', 96296303899);


--Address Table

INSERT INTO AddressTable(Address_ID_PK, Street, City, State, Country, ZipCode)
VALUES
    (14569, '444 Klm Street', 'Texas', 'Nowheresville', 'USA', '90210'),
    (14570, '999 South Road', 'Arizona', 'Anytown', 'USA', '10001'),
    (14571, '143 Apple Road', 'Arizona', 'Anytown', 'USA', '60601'),
    (14572, '009 Linda Avenue', 'Washington DC', 'Somewhereville', 'USA', '90266'),
    (14573, '710 Marine Drive', 'California', 'Anothercity', 'USA', '90291'),
    (14574, '440 Jersy Street', 'Texas', 'Nowheresville', 'USA', '90272'),
    (14575, '369 Stuart Street', 'California', 'Anothercity', 'USA', '60661'),
    (14576, '198 Edward Lane', 'Ohio', 'Anotherplace', 'USA', '94102'),
    (14577, '333 Harry Lane', 'Washington DC', 'Somewhereville', 'USA', '90024'),
    (14578, '777 Brooks Street', 'Newjersy', 'Anytown', 'USA', '90025'),
    (14579, '207 ThornApple', 'Michigan', 'Southfield', 'USA', '90048'),
    (14580, '209 FranklinRiver', 'Michigan', 'Southfield', 'USA', '90064'),
    (14581, '123 Main Street', 'Arizona', 'Anytown', 'USA', '90066'),
    (14582, '456 Oak Avenue', 'Washington DC', 'Somewhere', 'USA', '90067'),
    (14583, '789 Maple Drive', 'Ohio', 'Nowhere', 'USA', '90245'),
    (14584, '1011 Elm Lane', 'California', 'Anyplace', 'USA', '90254'),
    (14585, '1213 Cedar Road', 'Texas', 'Sometown', 'USA', '90274'),
    (14586, '1415 Pine Street', 'Arizona', 'Anywhere', 'USA', '90275'),
    (14587, '1617 Birch Boulevard', 'Washington DC', 'Somewheresville', 'USA', '90277'),
    (14588, '1819 Maplewood Avenue', 'California', 'Nowheresville', 'USA', '90278'),
    (14589, '2021 Cedarhurst Circle', 'Texas', 'Anytown', 'USA', '90401'),
    (14590, '2223 Elmwood Court', 'Arizona', 'Somewhere', 'USA', '90402'),
    (14591, '220 PineApple', 'Newjersy', 'Southfield', 'USA', '90403'),
    (14592, '222 PointoWoods', 'Newjersy', 'Southfield', 'USA', '90404'),
    (14593, '222 Elm Street', 'Texas', 'Nowheresville', 'USA', '90405'),
    (14594, '890 Maple Road', 'Arizona', 'Anytown', 'USA', '91101'),
    (14595, '333 Cedar Road', 'Arizona', 'Anytown', 'USA', '91302'),
    (14596, '111 Oak Avenue', 'Washington DC', 'Somewhereville', 'USA', '91316'),
    (14597, '7890 Magnolia Drive', 'California', 'Anothercity', 'USA', '91356'),
    (14598, '567 Pine Street', 'Texas', 'Nowheresville', 'USA', '91364'),
    (14599, '3456 Cherry Street', 'California', 'Anothercity', 'USA', '91403'),
    (14600, 'Elmwood Lane', 'Ohio', 'Anotherplace', 'USA', '91423'),
    (14601, '234 Cedar Lane', 'Washington DC', 'Somewhereville', 'USA', '91604'),
    (14602, '456 Elm Street', 'Newjersy', 'Anytown', 'USA', '91607'),
    (14603, '197 Orange Street', 'Michigan', 'Southfield', 'USA', '90211'),
    (14604, '222 Franklin Street', 'Michigan', 'Southfield', 'USA', '90212');

--Employee 

INSERT INTO Employee (Employee_ID_PK, First_name, Last_name, Email, Phone_number, Role, Order_ID_FK1, Invoice_number_FK)
VALUES
    (1000000010, 'Anvesh', 'Dhora', 'AnveshD@example.com', '(555) 111-4567', 'Warehouse Worker', 87915, 1234567890),
    (1000000011, 'Harsha', 'Kolii', 'HarshaK@example.com', '(555) 112-5678', 'Warehouse Worker', 91916, 9876543210),
    (1000000012, 'Kiran', 'Naidu', 'KiranN@example.com', '(555) 113-6789', 'Warehouse Worker', 95917, 2468101214),
    (1000000013, 'Prasana', 'Chaudary', 'PrasanaC@example.com', '(555) 114-7890', 'Warehouse Worker', 99918, 5556667778),
    (1000000014, 'Ashwik', 'Linda', 'AshwikL@example.com', '(555) 115-8901', 'Warehouse Worker', 103919, 9012345678),
    (1000000015, 'Venky', 'Mama', 'VenkyM@example.com', '(555) 116-9012', 'Warehouse Worker', 107920, 3141592653),
    (1000000016, 'Prabhu', 'Mike', 'PrabhuM@example.com', '(555) 117-0123', 'Warehouse Worker', 111921, 7778889990),
    (1000000017, 'Pavan', 'Dhilawar', 'PavanD@example.com', '(555) 118-1234', 'Warehouse Worker', 115922, 2223334445),
    (1000000018, 'Goutham', 'Raju', 'GouthamR@example.com', '(555) 119-2345', 'Warehouse Worker', 119923, 5555555550),
    (1000000019, 'Rishi', 'Shetty', 'RishiS@example.com', '(555) 120-3456', 'Warehouse Worker', 123924, 9999999999),
    (1000000020, 'Charan', 'Shindey', 'CharanS@example.com', '(555) 119-2346', 'Warehouse Worker', 127925, 1444444444),
    (1000000021, 'Mehul', 'Bhai', 'MehulB@example.com', '(555) 120-3457', 'Warehouse Worker', 131926, 1888888889),
    (1000000022, 'Bobby', 'Deol', 'BobbyD@example.com', '(555) 119-2347', 'Warehouse Worker', 131926, 2333333334),
    (1000000023, 'Srikar', 'Konga', 'SrikarK@example.com', '(555) 120-3458', 'Warehouse Worker', 131926, 2777777779),
    (1000000024, 'Akshay', 'Kumar', 'AkshayK@example.com', '(555) 119-2348', 'Warehouse Worker', 131926, 3222222224);


----------------------------------------------------------------------------------------------------------------------------------------------------------
--ADDING CONSTRAINTS AND ASSIGNING FOREIGN KEYS TO ATTRIBUTES
----------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Customers
ADD CONSTRAINT Address_ID_FK
FOREIGN KEY(Address_ID_FK) REFERENCES AddressTable(Address_ID_PK);

ALTER TABLE BillingAccounts
ADD CONSTRAINT Customer_ID_FK
FOREIGN KEY(Customer_ID_FK) REFERENCES Customers(Customer_ID_PK);

ALTER TABLE BillingAccounts
ADD CONSTRAINT Address_1
FOREIGN KEY(Address_1) REFERENCES AddressTable(Address_ID_PK);

ALTER TABLE Orders
ADD CONSTRAINT Billing_Account_number_FK
FOREIGN KEY(Billing_Account_number_FK) REFERENCES BillingAccounts(Billing_Account_number_PK);

ALTER TABLE Invoices
ADD CONSTRAINT Order_ID_FK
FOREIGN KEY(Order_ID_FK) REFERENCES Orders(Order_ID_PK);

ALTER TABLE Packages
ADD CONSTRAINT Order_ID_1 
FOREIGN KEY(Order_ID_1) REFERENCES Orders(Order_ID_PK);

ALTER TABLE Shipments
ADD CONSTRAINT Origin_Warehouse_ID_FK
FOREIGN KEY(Origin_Warehouse_ID_FK) REFERENCES AddressTable(Address_ID_PK);

ALTER TABLE Shipments
ADD CONSTRAINT Destination_Warehouse_ID_FK
FOREIGN KEY(Destination_Warehouse_ID_FK) REFERENCES AddressTable(Address_ID_PK);

ALTER TABLE Shipments
ADD CONSTRAINT Package_ID_FK
FOREIGN KEY(Package_ID_FK) REFERENCES Packages(Package_ID_PK);

ALTER TABLE CreditCards
ADD CONSTRAINT Billing_Account_number_FK1
FOREIGN KEY (Billing_Account_number_FK1) REFERENCES BillingAccounts(Billing_Account_number_PK);

ALTER TABLE Employee
ADD CONSTRAINT Order_ID_FK1
FOREIGN KEY(Order_ID_FK1) REFERENCES Orders(Order_ID_PK);

ALTER TABLE Employee
ADD CONSTRAINT Invoice_number_FK
FOREIGN KEY(Invoice_number_FK) REFERENCES Invoices(Invoice_number_PK);

----------------------------------------------------------------------------------------------------------------------------------------------
-- Query the Database --
----------------------------------------------------------------------------------------------------------------------------------------------

--Assume truck 1721 is destroyed in a crash. Find all customers who had a package on that truck at the time of the crash. Write a query to list all recipients who had a
--package on that truck at the time of the crash. Find the last successful delivery by that truck prior to the crash.USE PackageDBBB
SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Packages.Package_ID_PK, Shipments.Shipment_ID_PK, Packages.Package_type AS Service, Packages.Package_weight_lb, Invoices.Total_Invoice_Amount,Shipments.Shipment_Type, Shipments.Shipment_status
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
INNER JOIN Invoices ON Orders.Order_ID_PK = Invoices.Order_ID_FK
INNER JOIN Packages ON Orders.Order_ID_PK = Packages.Order_ID_1
INNER JOIN Shipments ON Packages.Package_ID_PK = Shipments.Package_ID_FK
WHERE Shipments.Shipment_Type='Truck1721' 
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Invoices.Total_Invoice_Amount, Packages.Package_type, Packages.Package_ID_PK, Shipments.Shipment_ID_PK, Packages.Package_weight_lb, Shipments.Shipment_status, Shipments.Shipment_Type

--Write a query to list the customer who has shipped the most packages in the past year
SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name,Orders.Order_Date, Orders.No_of_packages
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
WHERE Orders.Order_Date <= DATEADD(year, -1, GETDATE()) and Orders.No_of_packages > 1
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Orders.Order_Date, Orders.No_of_packages

--Write a query to list the customer who has spent the most money on shipping in the past year.

SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, SUM(Total_Invoice_Amount) AS Highest_Invoice_Amount
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
INNER JOIN Invoices ON Orders.Order_ID_PK = Invoices.Order_ID_FK
WHERE Orders.Order_Date <= DATEADD(year, -1, GETDATE()) 
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name

--Write a query to list the state with the most customers.

SELECT State, COUNT(*) AS Repetitions
FROM Customers
INNER JOIN AddressTable ON Customers.Address_ID_FK = AddressTable.Address_ID_PK
GROUP BY State
HAVING COUNT(*) > 1;

--Write a query to list those packages that were not delivered within the promised time.

SELECT * FROM Shipments
WHERE Shipment_Status != 'Delivered' and Shipment_Status != 'Returned to Sender'
    AND Shipment_Delivered_Date = 'N/A';

--Write queries that can be used to generate the following bills. These forms will be sent to each customer in the past month:

-- A simple bill: customer, address, and amount owed.

SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name,Invoices.Total_Invoice_Amount- Invoices.Monthly_billing_amount AS Amount_Owed
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
INNER JOIN Invoices ON Orders.Order_ID_PK = Invoices.Order_ID_FK
WHERE Invoices.Monthly_billing_amount <> 'N/A' OR Invoices.Monthly_billing_amount IS NULL
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Invoices.Total_Invoice_Amount, Invoices.Monthly_billing_amount

-- A bill listing charges by type of service.

SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Packages.Package_type AS Service, Invoices.Total_Invoice_Amount
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
INNER JOIN Invoices ON Orders.Order_ID_PK = Invoices.Order_ID_FK
INNER JOIN Packages ON Orders.Order_ID_PK = Packages.Order_ID_1
WHERE Packages.Package_type <> 'N/A' OR Packages.Package_type IS NULL
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Invoices.Total_Invoice_Amount, Packages.Package_type

-- An itemize billing listing each individual shipment and the charges for it.

SELECT Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Packages.Package_ID_PK, Shipments.Shipment_ID_PK, Packages.Package_type AS Service, Packages.Package_weight_lb, Invoices.Total_Invoice_Amount
FROM Customers
INNER JOIN BillingAccounts ON Customers.Customer_ID_PK = BillingAccounts.Customer_ID_FK
INNER JOIN Orders ON BillingAccounts.Billing_Account_number_PK = Orders.Billing_Account_number_FK
INNER JOIN Invoices ON Orders.Order_ID_PK = Invoices.Order_ID_FK
INNER JOIN Packages ON Orders.Order_ID_PK = Packages.Order_ID_1
INNER JOIN Shipments ON Packages.Package_ID_PK = Shipments.Package_ID_FK
WHERE Packages.Package_type <> 'N/A' OR Packages.Package_type IS NULL
GROUP BY Customers.Customer_ID_PK, Customers.First_name, Customers.Last_name, Invoices.Total_Invoice_Amount, Packages.Package_type, Packages.Package_ID_PK, Shipments.Shipment_ID_PK, Packages.Package_weight_lb
