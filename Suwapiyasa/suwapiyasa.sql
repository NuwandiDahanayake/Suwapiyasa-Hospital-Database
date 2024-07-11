/*creating database*/
create database Suwapiyasa;

use Suwapiyasa;

/*create table staff*/
CREATE TABLE Staff (
    EmployeeNumber INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Address VARCHAR(200),
    TelephoneNumber VARCHAR(15) UNIQUE
);

select * from Staff;

/*create table doctor*/
CREATE TABLE Doctors (
    EmployeeNumber INT PRIMARY KEY,
    Specialty VARCHAR(50) NOT NULL,
	FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
);

select * from Doctors;

/*create table HeadDoctor*/
CREATE TABLE HeadDoctors (
    HDNo INT PRIMARY KEY
);

select * from HeadDoctors;

/*Create table for Surgeons*/
CREATE TABLE Surgeons (
    EmployeeNumber INT PRIMARY KEY,
	ContractType VARCHAR(20) NOT NULL,
    ContractLength INT NOT NULL,
    FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
);

select * from Surgeons;

/*Create table for Nurses*/
CREATE TABLE Nurses (
    EmployeeNumber INT PRIMARY KEY,
    Grade INT,
    YearsOfExperience INT,
    MonthlySalary VARCHAR(10),
    FOREIGN KEY (EmployeeNumber) REFERENCES Staff(EmployeeNumber)
);

select * from Nurses;

/*Create table for Patients*/
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Initials VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Age INT,
    Address VARCHAR(100),
    TelephoneNumber VARCHAR(10) UNIQUE,
    BloodType VARCHAR(5)
);

select * from Patients;


/*Create table for Medicine*/
CREATE TABLE Medicine (
    UniqueCode INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    QuantityOnHand INT,
    QuantityOrdered INT,
    Cost DECIMAL(10, 2),
    ExpirationDate DATE
);

select * from Medicine;

/*Create table for Surgery*/
CREATE TABLE Surgery (
    SurgeryID INT PRIMARY KEY,
    PatientID INT,
    SurgeryName VARCHAR(100) NOT NULL,
    DatePerformed DATE,
    TimePerformed TIME,
    Category VARCHAR(50),
	Theatre VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
 );
 
 select * from Surgery;
 
 
 /*Create table for Location*/
CREATE TABLE Location (
	BedNumber INT PRIMARY KEY,
    PatientID INT,
    RoomNumber VARCHAR(10),
    NursingUnit VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

select * from Location;




/*Insert data into Staff table*/
INSERT INTO Staff (EmployeeNumber, Name, Gender, Address, TelephoneNumber) VALUES
    (1, 'Nuwandi Hashinika', 'F', '123 Main Street', '0714755550'),
    (2, 'Janith Madusanka', 'M', '456 Homagama', '0768441854'),
    (3, 'Rasadi Perera', 'F', '78 Piliyndala', '0789441854');
    
select * from Staff;
    
/*Insert data into Doctors table*/
INSERT INTO Doctors (EmployeeNumber, Specialty) VALUES
    (1, 'Cardiology'),
    (2, 'Neurology');
    
select * from Doctors;
    
/*Insert data into Surgeons table*/
INSERT INTO Surgeons (EmployeeNumber, ContractType, ContractLength) VALUES
    (3, 'Contract', 2),
    (4, 'Contract', 1),
    (5, 'Contract', 4);
    
select * from Surgeons;
    
/*Insert data into Nurses table*/
INSERT INTO Nurses (EmployeeNumber, Grade, YearsOfExperience, MonthlySalary) VALUES
    (5, 1, 3, '20000'),
    (6, 2, 5, '30000'),
    (7, 4, 5, '50000');
    
select * from Nurses;
    
/*Insert data into Patients table*/
INSERT INTO Patients (PatientID, Initials, Surname, Age, Address, TelephoneNumber, BloodType) VALUES
    (1, 'ND', 'Alice', 60, '789 Horana', '0716896555', 'A+'),
    (2, 'SDD', 'Perera', 45, '567 Maharagama', '0771802060', 'B-'),
	(3, 'MED', 'Jayarathna', 28, '87 Pannipitiya', '0771898706', 'B+');
    
select * from Patients;
    
/*Insert data into Location table*/
INSERT INTO Location (BedNumber, PatientID, RoomNumber, NursingUnit) VALUES
    (001, '1', 'A101', 'Cardiac Care'),
    (002, '2', 'B202', 'Neurology'),
    (003, '3', 'C202', 'Neurology');
    
select * from Location;
    
/*Insert data into Surgery table*/
INSERT INTO Surgery (SurgeryID, PatientID, SurgeryName, DatePerformed, TimePerformed, Category, Theatre) VALUES
    (1, 1, 'Appendectomy', '2023-02-15', '10:00:00', 'General', 'Theatre 1'),
    (2, 2, 'Knee Replacement', '2023-08-06', '14:30:00', 'Orthopedic', 'Theatre 2'),
    (3, 3, 'Knee Replacement', '2023-05-16', '22:30:00', 'Orthopedic', 'Theatre 3');
    
select * from Surgery;
    
/*Insert data into HeadDoctors table*/
INSERT INTO HeadDoctors (HDNo) VALUES
    (1),
    (2),
    (3);
    
select * from HeadDoctors;
    
/*Insert data into Medicine table*/
INSERT INTO Medicine (UniqueCode, Name, QuantityOnHand, QuantityOrdered, Cost, ExpirationDate) VALUES
    (1, 'Aspirin', 100, 50, 5.99, '2024-06-01'),
    (2, 'Antibiotic', 50, 20, 10.50, '2026-12-31'),
	(3, 'Atavastatin', 60, 10, 12.60, '2025-10-25');
    
select * from Medicine;
    
    


    
