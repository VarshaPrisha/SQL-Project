-- CREATE DATABASE Blood_Donation_DB;
USE Blood_Donation_DB;

CREATE TABLE Donors (
    Donor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Blood_Group VARCHAR(5) NOT NULL,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    Last_Donation_Date DATE,
    Health_Status VARCHAR(50)
);

CREATE TABLE Recipients (
    Recipient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Blood_Group VARCHAR(5) NOT NULL,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    Hospital_ID INT
);



CREATE TABLE Hospitals (
    Hospital_ID INT PRIMARY KEY,
    Hospital_Name VARCHAR(200) NOT NULL,
    Address VARCHAR(200),
    Phone VARCHAR(15)
);



CREATE TABLE Blood_Stock (
    Blood_ID INT PRIMARY KEY,
    Blood_Group VARCHAR(5) NOT NULL,
    Quantity INT,
    Contaminated BIT,
    Expiry_Date DATE,
    Donor_ID INT,
    Donation_Date DATE,
    FOREIGN KEY (Donor_ID) REFERENCES Donors(Donor_ID)
);

INSERT INTO Donors (Donor_ID, Name, Age, Blood_Group, Gender, Phone, Address, Last_Donation_Date, Health_Status)
VALUES
    (1, 'John Smith', 25, 'A+', 'Male', '123-456-7890', '123 Main St, City', '2023-07-01', 'Healthy'),
    (2, 'Jane Doe', 30, 'B-', 'Female', '987-654-3210', '456 Elm St, Town', '2023-06-15', 'Healthy'),
    (3, 'Michael Johnson', 28, 'O+', 'Male', '555-111-2222', '789 Oak St, Village', '2023-07-10', 'Healthy'),
    (4, 'Emily Williams', 35, 'AB+', 'Female', '222-333-4444', '111 Maple St, City', '2023-06-28', 'Healthy'),
    (5, 'David Brown', 42, 'O-', 'Male', '444-555-6666', '222 Pine St, Town', '2023-07-03', 'Healthy'),
    (6, 'Sophia Lee', 19, 'A-', 'Female', '777-888-9999', '333 Oak St, Village', '2023-07-12', 'Healthy'),
    (7, 'William Johnson', 34, 'B+', 'Male', '999-888-7777', '444 Walnut St, City', '2023-07-08', 'Healthy'),
    (8, 'Olivia Wilson', 29, 'AB-', 'Female', '111-222-3333', '555 Cherry St, Town', '2023-06-20', 'Healthy'),
    (9, 'James Miller', 26, 'O+', 'Male', '333-444-5555', '666 Birch St, Village', '2023-06-30', 'Healthy'),
    (10, 'Emma Davis', 31, 'A+', 'Female', '555-666-7777', '777 Oak St, City', '2023-07-05', 'Healthy'),
	(11, 'Sophie Williams', 27, 'A-', 'Female', '123-456-7890', '123 Main St, City', '2023-07-01', 'Healthy'),
    (12, 'Noah Johnson', 32, 'B+', 'Male', '987-654-3210', '456 Elm St, Town', '2023-06-15', 'Healthy'),
    (13, 'Olivia Smith', 29, 'AB-', 'Female', '555-111-2222', '789 Oak St, Village', '2023-07-10', 'Healthy'),
    (14, 'Liam Davis', 36, 'O+', 'Male', '222-333-4444', '111 Maple St, City', '2023-06-28', 'Healthy'),
    (15, 'Ava Martinez', 23, 'B-', 'Female', '444-555-6666', '222 Pine St, Town', '2023-07-03', 'Healthy'),
    (16, 'Ethan Johnson', 30, 'AB+', 'Male', '777-888-9999', '333 Oak St, Village', '2023-07-12', 'Healthy'),
    (17, 'Mia Wilson', 25, 'A+', 'Female', '999-888-7777', '444 Walnut St, City', '2023-07-08', 'Healthy'),
    (18, 'Liam Brown', 33, 'O-', 'Male', '111-222-3333', '555 Cherry St, Town', '2023-06-20', 'Healthy'),
    (19, 'Emma Davis', 28, 'B+', 'Female', '333-444-5555', '666 Birch St, Village', '2023-06-30', 'Healthy'),
    (20, 'Noah Smith', 26, 'AB-', 'Male', '555-666-7777', '777 Oak St, City', '2023-07-05', 'Healthy');


INSERT INTO Recipients (Recipient_ID, Name, Age, Blood_Group, Gender, Phone, Address, Hospital_ID)
VALUES
    (1, 'Emily Johnson', 45, 'O+', 'Female', '123-456-7890', '123 Main St, City', 1),
    (2, 'David Smith', 37, 'B-', 'Male', '987-654-3210', '456 Elm St, Town', 2),
    (3, 'Sophia Martinez', 52, 'AB+', 'Female', '555-111-2222', '789 Oak St, Village', 3),
    (4, 'Michael Brown', 28, 'A+', 'Male', '222-333-4444', '111 Maple St, City', 1),
    (5, 'Olivia Williams', 63, 'O-', 'Female', '444-555-6666', '222 Pine St, Town', 2),
    (6, 'Liam Davis', 41, 'B+', 'Male', '777-888-9999', '333 Oak St, Village', 3),
    (7, 'Emma Wilson', 32, 'A-', 'Female', '999-888-7777', '444 Walnut St, City', 1),
    (8, 'Noah Johnson', 58, 'AB-', 'Male', '111-222-3333', '555 Cherry St, Town', 2),
    (9, 'Mia Smith', 49, 'O+', 'Female', '333-444-5555', '666 Birch St, Village', 3),
    (10, 'William Brown', 39, 'B-', 'Male', '555-666-7777', '777 Oak St, City', 1);





INSERT INTO Blood_Stock (Blood_ID, Blood_Group, Quantity, Contaminated, Expiry_Date, Donor_ID, Donation_Date)
VALUES
    (1, 'A+', 50, 0, '2023-08-01', 1, '2023-07-01'),
    (2, 'B-', 30, 0, '2023-07-25', 2, '2023-06-15'),
    (3, 'O+', 70, 0, '2023-09-05', 3, '2023-07-10'),
    (4, 'AB+', 20, 0, '2023-08-20', 4, '2023-06-28'),
    (5, 'O-', 40, 0, '2023-08-03', 5, '2023-07-03'),
    (6, 'A-', 25, 0, '2023-07-12', 6, '2023-07-12'),
    (7, 'B+', 60, 0, '2023-09-10', 7, '2023-07-08'),
    (8, 'AB-', 15, 0, '2023-08-05', 8, '2023-06-20'),
    (9, 'A+', 45, 0, '2023-08-15', 9, '2023-06-30'),
    (10, 'O+', 65, 0, '2023-09-01', 10, '2023-07-05'),
    (11, 'B-', 35, 0, '2023-08-30', 11, '2023-07-01'),
    (12, 'O+', 75, 0, '2023-09-20', 12, '2023-06-15'),
    (13, 'A-', 30, 0, '2023-08-25', 13, '2023-07-10'),
    (14, 'AB+', 25, 0, '2023-08-02', 14, '2023-06-28'),
    (15, 'O-', 55, 0, '2023-08-04', 15, '2023-07-03'),
    (16, 'B+', 20, 0, '2023-09-07', 16, '2023-07-12'),
    (17, 'AB-', 10, 0, '2023-08-10', 17, '2023-07-08'),
    (18, 'A+', 40, 0, '2023-08-18', 18, '2023-06-20'),
    (19, 'O+', 60, 0, '2023-09-03', 19, '2023-06-30'),
    (20, 'B-', 20, 0, '2023-08-12', 20, '2023-07-05');