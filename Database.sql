create database ECS_economic_census_management_system
use ECS_economic_census_management_system


CREATE TABLE Households (
    HouseholdID INT PRIMARY KEY,
    HouseholdName VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    PermanentAddress VARCHAR(200),
    FutureAddress VARCHAR(200)
);


CREATE TABLE HouseholdMembers (
    MemberID INT PRIMARY KEY,
    HouseholdID INT,
    MemberName VARCHAR(100),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    Occupation VARCHAR(100),
    NIC VARCHAR(20),
    JoblessStatus VARCHAR(50),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);


CREATE TABLE MaritalStatus (
    MaritalStatusID INT PRIMARY KEY,
    MemberID INT,
    Status VARCHAR(50),
    SpouseID INT,
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID),
    FOREIGN KEY (SpouseID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE Children (
    ChildID INT PRIMARY KEY,
    MemberID INT,
    ChildName VARCHAR(100),
    DateOfBirth DATE,
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE ElderlyMembers (
    ElderlyID INT PRIMARY KEY,
    MemberID INT,
    ElderlyName VARCHAR(100),
    DateOfBirth DATE,
    DateOfDeath DATE,
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE DeathRecords (
    DeathID INT PRIMARY KEY,
    MemberID INT,
    DeathDate DATE,
    CauseOfDeath VARCHAR(200),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE Education (
    EducationID INT PRIMARY KEY,
    MemberID INT,
    SchoolName VARCHAR(100),
    GradeLevel VARCHAR(20),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE Employment (
    EmploymentID INT PRIMARY KEY,
    MemberID INT,
    CompanyName VARCHAR(100),
    Position VARCHAR(100),
    Income DECIMAL(12, 2),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);

CREATE TABLE Income (
    IncomeID INT PRIMARY KEY,
    HouseholdID INT,
    Source VARCHAR(100),
    Amount DECIMAL(12, 2),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);

CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    HouseholdID INT,
    ContactType VARCHAR(50),
    ContactValue VARCHAR(100),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);



CREATE TABLE Relationships (
    RelationshipID INT PRIMARY KEY,
    Member1ID INT,
    Member2ID INT,
    RelationshipType VARCHAR(50),
    FOREIGN KEY (Member1ID) REFERENCES HouseholdMembers (MemberID),
    FOREIGN KEY (Member2ID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE Citizenship (
    CitizenshipID INT PRIMARY KEY,
    MemberID INT,
    Country VARCHAR(100),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE Languages (
    LanguageID INT PRIMARY KEY,
    MemberID INT,
    Language VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE HealthConditions (
    ConditionID INT PRIMARY KEY,
    MemberID INT,
    ConditionName VARCHAR(100),
    Description VARCHAR(200),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE Disabilities (
    DisabilityID INT PRIMARY KEY,
    MemberID INT,
    DisabilityType VARCHAR(100),
    Description VARCHAR(200),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE EmergencyContacts (
    ContactID INT PRIMARY KEY,
    MemberID INT,
    ContactName VARCHAR(100),
    Relationship VARCHAR(50),
    ContactNumber VARCHAR(20),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    HouseholdID INT,
    VehicleType VARCHAR(50),
    VehicleNumber VARCHAR(20),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);


CREATE TABLE Interests (
    InterestID INT PRIMARY KEY,
    MemberID INT,
    Interest VARCHAR(100),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE Vaccinations (
    VaccinationID INT PRIMARY KEY,
    MemberID INT,
    VaccinationName VARCHAR(100),
    DateAdministered DATE,
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE BankAccounts (
    AccountID INT PRIMARY KEY,
    HouseholdID INT,
    BankName VARCHAR(100),
    AccountNumber VARCHAR(50),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);




CREATE TABLE InsurancePolicies (
    PolicyID INT PRIMARY KEY,
    HouseholdID INT,
    PolicyType VARCHAR(50),
    PolicyNumber VARCHAR(50),
    InsuranceCompany VARCHAR(100),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);



CREATE TABLE JoblessStatus (
    StatusID INT PRIMARY KEY,
    MemberID INT,
    StatusDescription VARCHAR(200),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);



CREATE TABLE OtherDetails (
    DetailID INT PRIMARY KEY,
    HouseholdID INT,
    DetailType VARCHAR(50),
    DetailValue VARCHAR(200),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);


CREATE TABLE DeathCertificate (
    CertificateID INT PRIMARY KEY,
    DeathID INT,
    CertificateNumber VARCHAR(50),
    IssuedBy VARCHAR(100),
    FOREIGN KEY (DeathID) REFERENCES DeathRecords (DeathID)
);


CREATE TABLE ChildrenEducation (
    ChildEducationID INT PRIMARY KEY,
    ChildID INT,
    SchoolName VARCHAR(100),
    GradeLevel VARCHAR(20),
    FOREIGN KEY (ChildID) REFERENCES Children (ChildID)
);


CREATE TABLE ElderlyHealthConditions (
    ElderlyConditionID INT PRIMARY KEY,
    ElderlyID INT,
    ConditionName VARCHAR(100),
    Description VARCHAR(200),
    FOREIGN KEY (ElderlyID) REFERENCES ElderlyMembers (ElderlyID)
);


CREATE TABLE FutureAddress (
    FutureAddressID INT PRIMARY KEY,
    MemberID INT,
    Address VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE JoblessAssistance (
    AssistanceID INT PRIMARY KEY,
    MemberID INT,
    AssistanceType VARCHAR(100),
    Description VARCHAR(200),
    FOREIGN KEY (MemberID) REFERENCES HouseholdMembers (MemberID)
);


CREATE TABLE AdditionalIncome (
    IncomeID INT PRIMARY KEY,
    HouseholdID INT,
    Source VARCHAR(100),
    Amount DECIMAL(12, 2),
    FOREIGN KEY (HouseholdID) REFERENCES Households (HouseholdID)
);





