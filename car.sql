
-- CREATE A DATABASE--

create database cars;
use cars;

-- TABLE CREATION--
CREATE TABLE Consumers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);
select * from Consumers;

CREATE TABLE Cars (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    Model VARCHAR(100) NOT NULL,
    Brand VARCHAR(100) NOT NULL,
    Year INT,
    RentPerDay DECIMAL(10,2),
    Status ENUM('Available', 'Rented', 'Maintenance') DEFAULT 'Available',
    CHECK (Year >= 1980 AND Year <= 2025) -- Use a fixed upper limit
);
select * from Cars;


CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    CarID INT,
    StartDate DATE,
    EndDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Consumers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

select * from Rentals;

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
);

select * from Payments;

-- INSERTION OF CONSUMERS TABLE--

INSERT INTO Consumers (Name, Phone, Email, Address)
VALUES
('akash', '9876453110', 'akash20@gmail.com', 'MG Road-Bengaluru'),
('Babu', '9576568210', 'babu18@gmail.com', 'Brigade Road – Bengaluru'),
('Balaji', '9300045671', 'balaji10@gmail.com', 'Park Street – Kolkata'),
('Jey', '7604987191', 'jey19@gmail.com', 'Marine Drive – Mumbai'),
('Gowtham', '8666773210', 'gowtham86@gmail.com', 'Anna Salai – Chennai'),
('Joseph', '8223459663', 'joseph24@gmail.com', 'Rajpath-Delhi'),
('Nithiya', '7653421908', 'nithiya17@gmail.com', 'Linking Road – Mumbai'),
('Naresh', '9213654897', 'naresh45@gmail.com', 'Commercial Street – Bengaluru'),
('Aswin', '9876453110', 'aswin34@gmail.com', 'Abids Road – Hyderabad'),
('Yogesh', '9498899820', 'yogesh46@gmail.com', 'FC Road- Pune'),
('Viji', '9629860718', 'viji21@gmail.com', 'Bailey Road – Patna');

select * from Consumers;


-- INSERTION OF CARS--

INSERT INTO Cars (Model, Brand, Year, RentPerDay, Status) 
VALUES
('Swift VXi', 'Maruti Suzuki', 2021, 1500.00, 'Available'),
('City ZX', 'Honda', 2022, 2200.00, 'Rented'),
('Innova Crysta', 'Toyota', 2020, 3000.00, 'Available'),
('Kushaq Style', 'Skoda', 2023, 2800.00, 'Maintenance'),
('i20 Sportz', 'Hyundai', 2021, 1700.00, 'Available'),
('XUV700', 'Mahindra', 2022, 3500.00, 'Rented'),
('Tiago XZ', 'Tata', 2019, 1300.00, 'Available'),
('Compass Limited', 'Jeep', 2021, 3600.00, 'Maintenance'),
('Seltos HTK+', 'Kia', 2022, 2600.00, 'Available'),
('Verna SX', 'Hyundai', 2020, 2100.00, 'Rented'),
('Baleno Zeta', 'Maruti Suzuki', 2023, 1800.00, 'Available');

select * from Cars;

-- INSERTION OF RENTALS--

INSERT INTO Rentals (CustomerID, CarID, StartDate, EndDate, TotalAmount) VALUES
(1, 3, '2025-04-01', '2025-04-05', 12000.00),
(2, 1, '2025-04-02', '2025-04-04', 3000.00),
(3, 2, '2025-04-03', '2025-04-06', 6600.00),
(4, 5, '2025-04-07', '2025-04-08', 3400.00),
(5, 6, '2025-04-05', '2025-04-10', 17500.00),
(6, 4, '2025-04-10', '2025-04-12', 5600.00),
(7, 8, '2025-04-11', '2025-04-11', 3600.00),
(8, 9, '2025-04-15', '2025-04-18', 10400.00),
(9, 7, '2025-04-13', '2025-04-14', 2600.00),
(10, 10, '2025-04-17', '2025-04-19', 4200.00),
(11, 11, '2025-04-20', '2025-04-23', 7200.00);

select * from Rentals;

-- INSERTION OF PAYMENTS--

INSERT INTO Payments (RentalID, PaymentDate, AmountPaid, PaymentMethod) VALUES
(1, '2025-04-01', 12000.00, 'Credit Card'),
(2, '2025-04-02', 3000.00, 'UPI'),
(3, '2025-04-03', 6600.00, 'Cash'),
(4, '2025-04-07', 3400.00, 'Debit Card'),
(5, '2025-04-05', 17500.00, 'Net Banking'),
(6, '2025-04-10', 5600.00, 'Credit Card'),
(7, '2025-04-11', 3600.00, 'Cash'),
(8, '2025-04-15', 10400.00, 'UPI'),
(9, '2025-04-13', 2600.00, 'Credit Card'),
(10, '2025-04-17', 4200.00, 'Debit Card'),
(11, '2025-04-20', 7200.00, 'Net Banking');

select * from Payments;

ALTER TABLE Cars
ADD FuelType Enum('Petrol', 'Diesel', 'Electric', 'Hybrid');


select * from Cars;

UPDATE Cars
SET FuelType = 'Petrol'
WHERE Year=2019;

UPDATE Cars
SET FuelType = 'Diesel'
WHERE Year=2020;

UPDATE Cars
SET FuelType = 'Petrol'
WHERE Year=2021;

UPDATE Cars
SET FuelType = 'Hybrid'
WHERE Year=2022;

UPDATE Cars
SET FuelType = 'Electric'
WHERE Year=2023;

-- 1.WHERE CLAUSE --


-- Get all rentals where amount is greater than ₹5,000-- in Rental table

SELECT * FROM Rentals
WHERE TotalAmount > 5000;

-- Find all cars that are currently available -- in Cars Table

SELECT * FROM Cars
WHERE Status = 'Available';


-- 2.ORDERBY--
-- List all cars ordered by RentPerDay (lowest to highest)--
SELECT * FROM Cars
ORDER BY RentPerDay ASC;

SELECT * FROM Payments
ORDER BY AmountPaid DESC;

-- Total payments by payment method (payment table)

SELECT PaymentMethod, SUM(AmountPaid) AS TotalPerMethod
FROM Payments
GROUP BY PaymentMethod;


 -- Find the highest-paying customer using nested subqueries--
SELECT Name
FROM Consumers
WHERE CustomerID = (
    SELECT CustomerID
    FROM Rentals
    GROUP BY CustomerID
    ORDER BY SUM(TotalAmount) DESC
    LIMIT 1
);

SELECT 
    Rentals.RentalID,
    Consumers.Name AS CustomerName,
    Cars.Model AS CarModel,
    Rentals.StartDate,
    Rentals.EndDate,
    Rentals.TotalAmount
FROM Rentals
JOIN Consumers ON Rentals.CustomerID = Consumers.CustomerID
JOIN Cars ON Rentals.CarID = Cars.CarID;

-- List all customers, even if they haven't rented a car--

SELECT 
    Consumers.CustomerID,
    Consumers.Name,
    Rentals.RentalID,
    Rentals.StartDate,
    Rentals.TotalAmount
FROM Consumers
LEFT JOIN Rentals ON Consumers.CustomerID = Rentals.CustomerID;

-- List all distinct customers who have made at least one rental sql --

SELECT DISTINCT Consumers.CustomerID, Consumers.Name
FROM Consumers
JOIN Rentals ON Consumers.CustomerID = Rentals.CustomerID;



-- Create a view for customer rental history (Car Rental System) sql --

CREATE VIEW ConsumerRentalHistory AS
SELECT 
    Consumers.CustomerID,
    Consumers.Name AS ConsumerName,
    Cars.Model AS CarModel,
    Rentals.StartDate,
    Rentals.EndDate,
    Rentals.TotalAmount
FROM Rentals
JOIN Consumers ON Rentals.CustomerID = Consumers.CustomerID
JOIN Cars ON Rentals.CarID = Cars.CarID;

--  Now you can query it like a table--
SELECT * FROM ConsumerRentalHistory
WHERE TotalAmount > 10000;



DELIMITER $$

CREATE PROCEDURE GetConsumerTotal(IN cust_id INT)
BEGIN
    SELECT 
        SUM(TotalAmount) AS TotalSpent
    FROM Rentals
    WHERE CustomerID = cust_id;
END $$

DELIMITER ;

CALL GetConsumerTotal(1);




