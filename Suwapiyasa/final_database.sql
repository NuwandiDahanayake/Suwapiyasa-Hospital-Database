use Suwapiyasa;

/*Q1 - Create view for PatientSurgeryView*/
CREATE VIEW PatientSurgeryView AS
SELECT
    P.PatientID AS "Patient Identification Number",
    CONCAT(P.Initials, ' ', P.Surname) AS "Patient Name",
    CONCAT(L.BedNumber, ', Room ', L.RoomNumber) AS "Location",
    S.SurgeryName AS "Surgery Name",
    Surgery.DatePerformed AS "Date of Surgery" FROM Patients P INNER JOIN Surgery ON P.PatientID = Surgery.PatientID INNER JOIN Location L ON P.PatientID = L.PatientID;
    
SELECT * FROM PatientSurgeryView;

    

/*Q2 - Create table for'MedInfo'*/
CREATE TABLE MedInfo (
    MedName VARCHAR(100) PRIMARY KEY,
    QuantityAvailable INT,
    ExpirationDate DATE
);

SELECT * FROM MedInfo;


/*Create a trigger to load data into 'MedInfo' */
DELIMITER 
CREATE TRIGGER InsertMedInfo
AFTER INSERT ON Medicine FOR EACH ROW
BEGIN
    INSERT INTO MedInfo (MedName, QuantityAvailable, ExpirationDate)
    VALUES (NEW.Name, NEW.QuantityOnHand, NEW.ExpirationDate);
END;
DELIMITER ;


/*Create a trigger to update the values in 'MedInfo'*/
DELIMITER 
CREATE TRIGGER UpdateMedInfo
AFTER UPDATE ON Medicine FOR EACH ROW
BEGIN
    UPDATE MedInfo
    SET QuantityAvailable = NEW.QuantityOnHand, ExpirationDate = NEW.ExpirationDate
    WHERE MedName = NEW.Name;
END;
DELIMITER ;


/*Create a trigger to delete values from 'MedInfo'*/
DELIMITER 
CREATE TRIGGER DeleteMedInfo
AFTER DELETE ON Medicine FOR EACH ROW
BEGIN
    DELETE FROM MedInfo
    WHERE MedName = OLD.Name;
END;
DELIMITER ;


/*Q3 - create for the stored procedure*/
DELIMITER 
CREATE PROCEDURE GetMedicationCount( IN PatientID INT, INOUT medicationCount INT )
BEGIN
    SELECT COUNT(*) INTO medicationCount
    FROM Medication
    WHERE PatientID = PatientID;
END;
DELIMITER ;


/*save the output in a session variable*/
SET @PatientID = 2;  
SET @outputMedicationCount = 0;  
CALL GetMedicationCount(@PatientID, @outputMedicationCount);

SELECT @outputMedicationCount AS MedicationCount;


/*Q4 - Create a SQL function to calculate the days remaining until expiration*/
DELIMITER 
CREATE FUNCTION DaysUntilExpiration(ExpirationDate DATE) RETURNS INT
BEGIN
    DECLARE currentDate DATE;
    DECLARE remainingDays INT;
    SET currentDate = CURDATE();
    SET remainingDays = DATEDIFF(ExpirationDate, currentDate);
    
    RETURN remainingDays;
END;
DELIMITER ;


/*display medicines with less than 30 days until expiration*/
SELECT UniqueCode, Name, QuantityOnHand, QuantityOrdered, Cost, ExpirationDate, DaysUntilExpiration(ExpirationDate) AS DaysRemaining
FROM Medicine WHERE DaysUntilExpiration(ExpirationDate) <= 30;



/*Q5 - Load XML Data for staff xml*/
LOAD XML LOCAL INFILE 'D:\Document\Open University level 4\Sem 2\EEI4366 - Data Modelling and Database Systems\621435279_MP\staff.xml' INTO TABLE staff 
ROWS IDENTIFIED BY '<staff>';

/*Load XML Data for Patients xml*/
LOAD XML LOCAL INFILE 'D:\Document\Open University level 4\Sem 2\EEI4366 - Data Modelling and Database Systems\621435279_MP\patient.xml' INTO TABLE patients
ROWS IDENTIFIED BY '<patient>';












