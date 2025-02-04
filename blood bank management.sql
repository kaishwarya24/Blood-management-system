CREATE DATABASE blood_management_system;

use blood_management_system;

CREATE TABLE patient (
Patient_ID INT NOT NULL,
Patient_Name VARCHAR(30) NOT NULL,
Patient_Age INT NOT NULL,
Blood_Group VARCHAR(4) NOT NULL,
Disease CHAR(2) CHECK (Disease IN('A', 'B' , 'AB' , 'O')),
Patient_Contact  BIGINT UNSIGNED,
Patient_Adress VARCHAR(45),
CONSTRAINT Patient_PK PRIMARY KEY (Patient_ID)
);

CREATE TABLE Donor(
Donor_ID INT NOT NULL,
Donor_Name VARCHAR(30) NOT NULL, 
Donor_Age  INT NOT NULL,
Medical_Report VARCHAR(20) NOT NULL 
            CHECK (Medical_Report IN ('Satisfactory','Not Satisfactory')),
Donor_Adress VARCHAR(45),
Donor_Contact  BIGINT UNSIGNED,
CONSTRAINT Donor_PK PRIMARY KEY (Donor_ID)
);

CREATE TABLE Blood_Bank(
     Blood_Bank_ID      INT   PRIMARY KEY ,
     Blood_Bank_Name    VARCHAR(50)     NOT NULL,
     Blood_Bank_Address VARCHAR(45),
     Blood_Bank_Contact BIGINT unsigned,
     Donor_ID           INT,
     Patient_ID         INT,
     FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID),
     FOREIGN KEY (Patient_ID) REFERENCES patient(Patient_ID)
);

INSERT INTO patient (Patient_ID, Patient_Name, Patient_Age, Blood_Group, Disease, Patient_Contact, Patient_Adress) 
VALUES 
(1, 'Arjun Reddy', 32, 'O+', 'A', 9845012345, 'MG Road, Bengaluru'),
(2, 'Priya Iyer', 45, 'B+', 'B', 9876543210, 'Mylapore, Chennai'),
(3, 'Karthik Nair', 28, 'AB+', 'AB', 9966234567, 'Fort Kochi, Kerala'),
(4, 'Lakshmi Rao', 50, 'A+', 'O', 9945987654, 'Jubilee Hills, Hyderabad'),
(5, 'Suresh Menon', 39, 'B+', 'A', 9823456789, 'Jayanagar, Bengaluru');


INSERT INTO Donor (Donor_ID, Donor_Name, Donor_Age, Medical_Report, Donor_Adress, Donor_Contact) 
VALUES 
(1, 'Vijay Kumar', 29, 'Satisfactory', 'BTM Layout, Bengaluru', 9745654321),
(2, 'Anjali Mohan', 35, 'Satisfactory', 'Indiranagar, Bengaluru', 9765432101),
(3, 'Manoj Varma', 40, 'Not Satisfactory', 'T Nagar, Chennai', 9876545678),
(4, 'Deepa Reddy', 27, 'Satisfactory', 'Alwarpet, Chennai', 9756743210),
(5, 'Ravi Krishna', 33, 'Satisfactory', 'Kakkanad, Kochi', 9845123456);
