CREATE DATABASE TEMPLE_DATABASE;
USE TEMPLE_DATABASE;

CREATE TABLE Temples 
(
    Temple_id INT PRIMARY KEY, Name VARCHAR(255) NOT NULL, Street VARCHAR(255), City VARCHAR(100),Pincode VARCHAR(10),
    Built_year VARCHAR(20), Architectural_style VARCHAR(100), Deity VARCHAR(100),
    Heritage_status VARCHAR(50) CHECK (Heritage_status IN ('UNESCO', 'State Protected'))
);

INSERT INTO Temples (Temple_id, Name, Street, City, Pincode, Built_year, Architectural_style, Deity, Heritage_status) VALUES
(1, 'Brihadeeswarar Temple', 'East Main Street', 'Thanjavur', '613001', '1010 CE', 'Chola', 'Shiva', 'UNESCO'),
(2, 'Meenakshi Amman Temple', 'Madurai Main', 'Madurai', '625001', '6th Century BCE', 'Dravidian', 'Meenakshi', 'State Protected'),
(3, 'Airavatesvara Temple', 'Temple Road', 'Darasuram', '612702', '1166 CE', 'Chola', 'Shiva', 'UNESCO'),
(4, 'Shore Temple', 'Mahabalipuram Beach', 'Mahabalipuram', '603104', '8th Century CE', 'Pallava', 'Shiva and Vishnu', 'UNESCO'),
(5, 'Kailasanathar Temple', 'Kanchipuram Old Town', 'Kanchipuram', '631501', '705 CE', 'Pallava', 'Shiva', 'State Protected'),
(6, 'Sri Ranganathaswamy Temple', 'Srirangam', 'Tiruchirapalli', '620006', '984 CE', 'Dravidian', 'Ranganatha (Vishnu)', 'State Protected'),
(7, 'Naganathaswamy Temple', 'Manambadi', 'Thanjavur', '612503', '1000 CE', 'Chola', 'Shiva', 'State Protected'),
(8, 'Vettuvan Koil', 'Kalugumalai', 'Thoothukudi', '628552', '8th Century CE', 'Pandyan Rock-cut', 'Shiva', 'State Protected'),
(9, 'Agastheeswarar Temple', 'Villivakkam', 'Chennai', '600049', '8th Century CE', 'Dravidian', 'Shiva', 'State Protected'),
(10, 'Kanchi Kamakshi Temple', 'Pillaiyar Palayam', 'Kanchipuram', '631501', '6th Century CE', 
'Dravidian', 'Kamakshi (Parvati)', 'State Protected');

SELECT * FROM Temples;

drop table Temples;

CREATE TABLE Temple_Conditions 
(
    Condition_id INT PRIMARY KEY,Temple_id INT,Condition_date DATE,Structural_integrity VARCHAR(100),
    Weathering_level VARCHAR(100),Vegetation_growth BOOLEAN,Comments TEXT,
    FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id)
);

INSERT INTO Temple_Conditions (Condition_id, Temple_id, Condition_date, Structural_integrity, 
Weathering_level, Vegetation_growth, Comments) VALUES
(101, 1, '2023-10-15', 'Good', 'Moderate', TRUE, 'Minor cracks visible.'),
(102, 2, '2023-09-10', 'Fair', 'High', TRUE, 'Vegetation growing on walls.'),
(103, 3, '2023-11-05', 'Excellent', 'Low', FALSE, 'Well-maintained.'),
(104, 4, '2023-08-20', 'Fair', 'Severe', TRUE, 'Seawater erosion visible.'),
(105, 5, '2023-07-12', 'Good', 'Moderate', FALSE, 'Stone carvings slightly worn.'),
(106, 6, '2023-06-22', 'Poor', 'High', TRUE, 'Foundation weakening.'),
(107, 7, '2023-05-30', 'Fair', 'Moderate', TRUE, 'Cracks on pillars.'),
(108, 8, '2023-04-18', 'Good', 'Low', FALSE, 'Rock cut features stable.'),
(109, 9, '2023-03-14', 'Fair', 'Moderate', TRUE, 'Overgrown shrubs near entrance.'),
(110, 10, '2023-02-09', 'Good', 'Low', FALSE, 'Recently cleaned.');

SELECT * FROM Temple_Conditions;

Drop table Temple_Conditions;


CREATE TABLE Restoration_Projects 
(
    Project_id INT PRIMARY KEY,Temple_id INT,Project_name VARCHAR(255),Start_date DATE,
    End_date DATE,Status VARCHAR(100), Responsible_agency VARCHAR(255),Budget DECIMAL(12,2),
    FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id)
);

INSERT INTO Restoration_Projects (Project_id, Temple_id, Project_name, Start_date, End_date, 
Status, Responsible_agency, Budget) VALUES
(201, 1, 'Brihadeeswarar Temple Conservation', '2022-01-15', '2023-06-30', 'Completed', 'ASI', 5000000.00),
(202, 2, 'Meenakshi Temple Renovation', '2022-08-01', '2024-12-31', 'Ongoing', 'TNHRCE', 3000000.00),
(203, 3, 'Airavatesvara Stone Work', '2023-02-01', NULL, 'Planned', 'ASI', 2500000.00),
(204, 4, 'Shore Temple Seawall Project', '2021-03-01', '2022-12-31', 'Completed', 'ASI', 4000000.00),
(205, 5, 'Kailasanathar Temple Preservation', '2023-05-15', NULL, 'Planned', 'TNHRCE', 1800000.00),
(206, 6, 'Sri Ranganathaswamy Structural Repair', '2022-06-10', '2023-11-30', 'Completed', 'ASI', 6000000.00),
(207, 7, 'Naganathaswamy Temple Maintenance', '2021-11-01', '2022-08-31', 'Completed', 'TNHRCE', 1200000.00),
(208, 8, 'Vettuvan Koil Rock Preservation', '2023-01-01', NULL, 'Planned', 'ASI', 800000.00),
(209, 9, 'Agastheeswarar Temple Facade Repair', '2022-09-01', NULL, 'Ongoing', 'TNHRCE', 1000000.00),
(210, 10, 'Kanchi Kamakshi Temple Renovation', '2021-04-01', '2023-01-31', 'Completed', 'ASI', 2200000.00);



SELECT * FROM Restoration_Projects;

Drop table Restoration_Projects;

CREATE TABLE Architectural_Details 
(
    Detail_id INT PRIMARY KEY,Temple_id INT,
    Element_name VARCHAR(255),  Material VARCHAR(100),
    Condition_status VARCHAR(100),
    FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id)
);

INSERT INTO Architectural_Details (Detail_id, Temple_id, 
Element_name, Material, Condition_status) VALUES
(301, 1, 'Vimana', 'Granite', 'Good'),
(302, 2, 'Mandapam', 'Sandstone', 'Fair'),
(303, 3, 'Gopuram', 'Granite', 'Excellent'),
(304, 4, 'Shore Wall', 'Granite', 'Fair'),
(305, 5, 'Sanctum Tower', 'Sandstone', 'Good'),
(306, 6, 'Pillars', 'Granite', 'Poor'),
(307, 7, 'Inner Sanctum', 'Granite', 'Fair'),
(308, 8, 'Rock Cut Shrine', 'Stone', 'Good'),
(309, 9, 'Outer Wall', 'Granite', 'Fair'),
(310, 10, 'Temple Tank', 'Stone', 'Good');

SELECT * FROM Architectural_Details;

Drop table Architectural_Details;

CREATE TABLE Stakeholders (Stakeholder_id INT PRIMARY KEY,Name VARCHAR(255),
Role VARCHAR(100),Organization VARCHAR(255),Contact VARCHAR(255));
    
INSERT INTO Stakeholders (Stakeholder_id, Name, Role, Organization, Contact) VALUES
(401, 'Dr. S. Ramachandran', 'Historian', 'Madras University', 'ramachandran@example.com'),
(402, 'Ms. Priya Ramesh', 'Archaeologist', 'ASI', 'priya.ramesh@example.com'),
(403, 'Mr. Arun Kumar', 'Public Contributor', 'Temple Volunteer Group', 'arunkumar@example.com'),
(404, 'Dr. Leela Devi', 'Architectural Expert', 'INTACH', 'leeladevi@example.com'),
(405, 'Mr. Senthil Nathan', 'Conservation Specialist', 'Heritage Foundation', 'senthilnathan@example.com'),
(406, 'Dr. R. Vijayakumar', 'Historian', 'Tamil Nadu Archaeology Department', 'vijayakumar@example.com'),
(407, 'Ms. Aishwarya Natarajan', 'Conservation Architect', 'INTACH', 'aishwarya.natarajan@example.com'),
(408, 'Mr. Manoj Sundaram', 'Public Contributor', 'Save Heritage Trust', 'manoj.sundaram@example.com'),
(409, 'Dr. Meera Subramanian', 'Archaeologist', 'ASI', 'meera.subramanian@example.com'),
(410, 'Mr. Ravi Shankar', 'Project Coordinator', 'TNHRCE', 'ravi.shankar@example.com');

SELECT * FROM Stakeholders;

Drop table Stakeholders;

CREATE TABLE Stakeholder_Reports (Report_id INT PRIMARY KEY,Temple_id INT,Stakeholder_id INT,
    Report_date DATE,Content TEXT,FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id),
    FOREIGN KEY (Stakeholder_id) REFERENCES Stakeholders(Stakeholder_id));
    
INSERT INTO Stakeholder_Reports (Report_id, Temple_id, Stakeholder_id, Report_date, Content) VALUES
(501, 1, 401, '2023-07-20', 'Minor cracks observed near the sanctum walls.'),
(502, 2, 402, '2023-06-15', 'Heavy vegetation noticed. Need urgent clearance.'),
(503, 3, 403, '2023-08-01', 'Excellent maintenance but needs regular checkups.'),
(504, 4, 404, '2023-05-12', 'Seawater erosion needs stronger barriers.'),
(505, 5, 405, '2023-04-25', 'Good condition but sculptures need chemical treatment.'),
(506, 6, 406, '2023-09-10', 'Minor cracks on the temple pillars, needs sealing.'),
(507, 7, 407, '2023-07-30', 'Overall structure is stable, but weathering of stone is visible.'),
(508, 8, 408, '2023-08-14', 'Urgent restoration needed on the western gopuram.'),
(509, 9, 409, '2023-06-22', 'Floral carvings need cleaning and restoration.'),
(510, 10, 410, '2023-09-05', 'Water stagnation near the entrance, drainage needs to be improved.');

SELECT * FROM Stakeholder_Reports;

Drop table Stakeholder_Reports;

CREATE TABLE Photographic_Records (Photo_id INT PRIMARY KEY,Temple_id INT,Photo_url VARCHAR(255),
    Description TEXT,Date_taken DATE,FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id));
    
INSERT INTO Photographic_Records (Photo_id, Temple_id, Photo_url, Description, Date_taken) VALUES
(601, 1, 'http://photos.com/brihadeeswarar.jpg', 'Front view of Brihadeeswarar Temple.', '2023-01-15'),
(602, 2, 'http://photos.com/meenakshi.jpg', 'Gopuram of Meenakshi Temple.', '2023-02-20'),
(603, 3, 'http://photos.com/airavatesvara.jpg', 'Intricate carvings at Airavatesvara.', '2023-03-10'),
(604, 4, 'http://photos.com/shoretemple.jpg', 'View facing the sea.', '2023-04-12'),
(605, 5, 'http://photos.com/kailasanathar.jpg', 'Old stone structures.', '2023-05-05'),
(606, 6, 'http://photos.com/sriranganathaswamy.jpg', 'Wide angle view of Sri Ranganathaswamy Temple.', '2023-06-18'),
(607, 7, 'http://photos.com/naganathaswamy.jpg', 'Close-up of Naganathaswamy Temple entrance.', '2023-07-22'),
(608, 8, 'http://photos.com/vettuvankoil.jpg', 'Rock-cut architecture of Vettuvan Koil.', '2023-08-10'),
(609, 9, 'http://photos.com/agastheeswarar.jpg', 'Temple tank of Agastheeswarar Temple.', '2023-09-15'),
(610, 10, 'http://photos.com/kanchikamakshi.jpg', 'Kamakshi idol in the temple sanctum.', '2023-10-02');

SELECT * FROM Photographic_Records;

Drop table Photographic_Records;

CREATE TABLE Environmental_Threats 
(
    Threat_id INT PRIMARY KEY,Temple_id INT,Threat_type VARCHAR(100), Severity_level VARCHAR(50),
    Description TEXT,Reported_date DATE,FOREIGN KEY (Temple_id) REFERENCES Temples(Temple_id)
);

INSERT INTO Environmental_Threats (Threat_id, Temple_id, Threat_type, Severity_level, Description, Reported_date) 
VALUES
(701, 1, 'Air Pollution', 'Medium', 'Dust accumulation on outer walls.', '2023-09-10'),
(702, 2, 'Urban Encroachment', 'High', 'Shops and houses crowding temple.', '2023-08-05'),
(703, 3, 'Vegetation Growth', 'Low', 'Trees growing near compound wall.', '2023-07-01'),
(704, 4, 'Sea Erosion', 'High', 'Saltwater damaging the base.', '2023-06-18'),
(705, 5, 'Air Pollution', 'Medium', 'Blackening of sculptures.', '2023-05-15'),
(706, 6, 'Flooding', 'High', 'Water accumulation near temple entrance.', '2023-07-25'),
(707, 7, 'Air Pollution', 'Low', 'Dust accumulation on temple façade.', '2023-06-12'),
(708, 8, 'Vegetation Growth', 'Medium', 'Overgrown vines blocking views.', '2023-08-03'),
(709, 9, 'Urban Encroachment', 'High', 'Unregulated construction nearby.', '2023-07-15'),
(710, 10, 'Earthquake Damage', 'Medium', 'Small cracks in the foundation.', '2023-09-20');

SELECT * FROM Environmental_Threats;

Drop table Environmental_Threats;

CREATE TABLE Funding_Sources 
(
    Funding_id INT PRIMARY KEY,Project_id INT,Source_name VARCHAR(255),
    Amount DECIMAL(12,2),Funding_date DATE,
    FOREIGN KEY (Project_id) REFERENCES Restoration_Projects(Project_id)
);

INSERT INTO Funding_Sources (Funding_id, Project_id, Source_name, Amount, Funding_date) VALUES
(801, 201, 'ASI', 2500000.00, '2022-01-10'),
(802, 202, 'TNHRCE', 1500000.00, '2022-08-01'),
(803, 203, 'Heritage Fund', 2000000.00, '2023-02-01'),
(804, 204, 'Coastal Conservation Trust', 3000000.00, '2021-03-01'),
(805, 205, 'ASI', 900000.00, '2023-05-15'),
(806, 206, 'TNHRCE', 1000000.00, '2023-04-25'),
(807, 207, 'ASI', 500000.00, '2023-03-10'),
(808, 208, 'Heritage Fund', 1200000.00, '2023-05-22'),
(809, 209, 'Coastal Conservation Trust', 2500000.00, '2023-06-05'),
(810, 210, 'INTACH', 400000.00, '2023-07-01');

SELECT * FROM Funding_Sources;


Drop table Funding_Sources;

#BASIC QUERIES

#Query 1 (LIKE / NOT LIKE): Lists the temples data that start with “T” in their name but not UNESCO heritage.

SELECT Temple_id, Name, City, Heritage_status
FROM Temples
WHERE City LIKE 'T%'
  AND Heritage_status NOT LIKE 'UNESCO';


#Query 2 (Logical operator-AND / OR): Finds projects that are ongoing with a high budget or funded by ASI.

SELECT Project_id, Project_name, Status, 
Budget as Budget_in_INR, Responsible_agency
FROM Restoration_Projects
WHERE (Status = 'Ongoing' AND Budget > 2000000)
   OR Responsible_agency = 'ASI';


#Query 3 (GROUP BY / HAVING / ORDER BY): Lists the funding sources with the total contributions over 1,000,000, in descending order.

SELECT Source_name,
       COUNT(*) AS Number_of_funding,
       SUM(Amount) AS Total_amount_in_INR
FROM Funding_Sources
GROUP BY Source_name
HAVING SUM(Amount) > 1000000
ORDER BY Total_amount_in_INR DESC;


#Query 4 (Relational operator-  >, < ): Lists the funding sources after 2023-01-01 and with amounts greater than 2,000,000.

SELECT Funding_id, Project_id, Source_name, 
Amount as Amount_in_INR, Funding_date
FROM Funding_Sources
WHERE Amount > 2000000
   OR Funding_date < '2023-01-01';


#Query 5 (WHERE NOT EXISTS): List the temples that have no 'Planned' restoration projects.

SELECT t.Temple_id, t.Name as Temples
FROM Temples AS t
WHERE NOT EXISTS (
  SELECT *
  FROM Restoration_Projects AS rp
  WHERE rp.Temple_id = t.Temple_id
    AND rp.Status = 'Planned'
);

#Intermediate Queries


#Query 1: List all the temples and show the temple's condition assessments with the date of inspection.

SELECT 
  t.Temple_id,t.Name, 
  c.Condition_date as Date_of_inspection,
  c.Structural_integrity
FROM Temples AS t
LEFT JOIN Temple_Conditions AS c
  ON t.Temple_id = c.Temple_id;


#Query2: List the name of all stakeholders and the reports submitted by them.(including those with no reports).

SELECT 
  s.Stakeholder_id,
  s.Name AS Stakeholder_Name,
  r.Report_id,r.Report_date
FROM Stakeholders AS s
RIGHT JOIN Stakeholder_Reports AS r
  ON s.Stakeholder_id = r.Stakeholder_id;
  
  #Query 3:  List the name of all temples, its restoration project, and funding source of the projects. 

SELECT 
  Name  AS Temple, Project_name AS Project,
  Source_name AS Funding_Source
FROM Temples
NATURAL JOIN Restoration_Projects
NATURAL JOIN Funding_Sources;

#Query4: List only the temples that have at least one completed restoration project, along its project’s details.

SELECT 
  t.Name AS Temple,rp.Project_name,
  rp.Status,rp.Budget
FROM Temples AS t
JOIN Restoration_Projects AS rp
  ON t.Temple_id = rp.Temple_id
WHERE rp.Status = 'Completed';

#Query5: Count how many temples have each weathering level, ordered by the count descending.

SELECT 
  c.Weathering_level,
  COUNT(t.Temple_id) AS Num_of_temples
FROM Temple_Conditions AS c
JOIN Temples AS t
  ON t.Temple_id = c.Temple_id
GROUP BY c.Weathering_level
ORDER BY Num_of_temples DESC;



#ADVANCED QUERIES


#Query 1, 4 level nesting: Find temples funded by the single top‐contributing source (the one whose sum of amounts is highest).

SELECT Name as Temple_Name
FROM Temples
WHERE Temple_id IN (
  SELECT rp.Temple_id
  FROM Restoration_Projects AS rp
  WHERE rp.Project_id IN (
    SELECT fs.Project_id
    FROM Funding_Sources AS fs
    WHERE fs.Source_name = (
      SELECT Source_name
      FROM (
        SELECT Source_name, SUM(Amount) AS total_amount
        FROM Funding_Sources
        GROUP BY Source_name
      ) AS totals
      ORDER BY total_amount DESC
      LIMIT 1
    )));

#Query 2,Four‐Way LEFT JOIN + GROUP BY + ORDER BY: For each city, report how many temples, assessments, projects, and the total funding, ordering cities by descending funding.

SELECT 
  t.City,
  COUNT(DISTINCT t.Temple_id) AS Num_of_temples,
  COUNT(DISTINCT c.Condition_id) AS Num_of_assessments,
  COUNT(DISTINCT rp.Project_id) AS Num_of_projects,
  COALESCE(SUM(fs.Amount), 0)  AS Total_funding
FROM Temples AS t
LEFT JOIN Temple_Conditions  AS c  ON t.Temple_id = c.Temple_id
LEFT JOIN Restoration_Projects AS rp ON t.Temple_id = rp.Temple_id
LEFT JOIN Funding_Sources   AS fs ON rp.Project_id = fs.Project_id
GROUP BY t.City
ORDER BY total_funding DESC;


# Query 3:Four‐Way LEFT JOIN + GROUP BY + HAVING + ORDER BY. List each temple’s name, the total number of restoration projects it has, and the total funding amount received.

SELECT 
  t.Name AS Temple_Name,
  COUNT(DISTINCT rp.Project_id) AS Total_Projects,
  SUM(fs.Amount) AS Total_Funding
FROM Temples AS t
LEFT JOIN Restoration_Projects AS rp 
  ON t.Temple_id = rp.Temple_id
LEFT JOIN Funding_Sources AS fs 
  ON rp.Project_id = fs.Project_id
LEFT JOIN Temple_Conditions AS c 
  ON t.Temple_id = c.Temple_id
GROUP BY t.Temple_id, t.Name
HAVING SUM(fs.Amount) IS NOT NULL
ORDER BY Total_Funding DESC;


# Query 4: JOIN + Two‐Level Nested Queries. List temples whose total restoration budget exceeds the average total budget per temple.
 
SELECT t.Temple_id,
       t.Name,
       b.total_budget
FROM Temples AS t
JOIN (
  SELECT Temple_id,
         SUM(Budget) AS total_budget
  FROM Restoration_Projects
  GROUP BY Temple_id
) AS b
  ON t.Temple_id = b.Temple_id
WHERE b.total_budget > (
  SELECT AVG(per_temple_avg) 
  FROM (
    SELECT SUM(Budget) AS per_temple_avg
    FROM Restoration_Projects
    GROUP BY Temple_id
  ) AS inner_totals
);

#Query 5: THREE WAY RIGHT JOIN+ ORDER BY: List all funding sources (even unmatched ones), 
#their associated restoration projects (if any), and temple names (if any), ordered by funding amount descending.

SELECT 
  fs.Funding_id,
  fs.Source_name,
  fs.Amount,
  rp.Project_name,
  t.Name AS Temple_Name
FROM Funding_Sources AS fs
RIGHT JOIN Restoration_Projects AS rp
  ON fs.Project_id = rp.Project_id
RIGHT JOIN Temples AS t
  ON rp.Temple_id = t.Temple_id
ORDER BY fs.Amount DESC;



