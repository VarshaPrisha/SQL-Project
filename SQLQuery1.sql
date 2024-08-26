/* PROJECT PRO -- https://www.projectpro.io/article/sql-database-projects-for-data-analysis-to-practice/565
4. Blood Bank Management System
Blood banks collect, preserve, and offer blood to patients. The Blood Bank Management System helps blood banks to maintain records of the quality of the blood and its availability whenever a patient requests it. If you are looking for SQL practice projects in the healthcare industry, this project is a must try. 

Dataset: Create a blood donation database that contains data about the blood donors (name, age, blood group, etc.), recipients (name, age, blood group, etc.), hospitals who need blood from the blood bank, quality of the blood (whether it is contaminated or not)., etc.

SQL Data Analysis Project Idea: Use the dataset to answer the following questions-

Is there sufficient blood available at the blood bank?

Does the donor have any blood-borne diseases? Etc.*/




Use Blood_Donation_DB;
SELECT * FROM SYS.tables;

SELECT * FROM Donors;
SELECT * FROM Recipients;
SELECT * FROM Hospitals;
SELECT * FROM Blood_Stock;

-------------------------------------------DATA CLEANING Queries-------------------------------------------------------

--1.How many donors have not provided their health status in the "Donors" table? List their names. Update to Unknown where it is null
UPDATE Donors
SET Health_Status = 'Unknown'
WHERE Health_Status IS NULL;

--2  Update the "Name" column in the "Donors" table to remove any leading or trailing spaces.
UPDATE Donors
SET Name = LTRIM(RTRIM(Name));

--3  Remove the "Phone" column from the "Recipients" table.
ALTER TABLE Recipients
DROP COLUMN Phone

--4 Add a constraint to ensure that the "Blood_Group" column in the "Donors" table contains valid 
-- blood groups (e.g., 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-').
ALTER TABLE Donors
ADD CONSTRAINT CK_BloodGroup CHECK (Blood_Group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'));

--5  Normalize the "Gender" column in the "Donors" table to only contain 'Male' or 'Female'.
UPDATE Donors
SET Gender = 'Male'
WHERE Gender IN ('M', 'Male', 'MALE', 'm');

UPDATE Donors
SET Gender = 'Female'
WHERE Gender IN ('F', 'Female', 'FEMALE', 'f');

------------------------------------------Project Questions------------------------------------------------------------
-- 1. Is there sufficient blood available at the blood bank?

WITH cte_sufficient AS
(
		SELECT Blood_Group,SUM(Quantity) AS Availbale_Quentity
		FROM Blood_Stock 
		-- WHERE Contaminated = 0
		WHERE Expiry_Date >= GETDATE()
		GROUP BY Blood_Group
)
SELECT Blood_Group, Availbale_Quentity as Insufficient_Quentity
FROM cte_sufficient where Availbale_Quentity <=25


-- 2.Does the donor have any blood-borne diseases? Etc.
SELECT Name, Health_Status
FROM Donors
WHERE Health_Status IS NOT NULL AND Last_Donation_Date IS NOT NULL;

