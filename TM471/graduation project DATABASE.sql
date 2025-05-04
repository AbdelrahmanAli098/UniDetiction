CREATE TABLE `uni_rec`.`users` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL UNIQUE,
  `Password` CHAR(60) NOT NULL,
  `Name` VARCHAR(100),
  `Phone_Number` VARCHAR(15), 
  `Thanaweya_Score` DECIMAL(5,2), 
  `Thanaweya_Track` ENUM('Literary', 'Math', 'Science') NOT NULL,
  PRIMARY KEY (`ID`)
);
  
CREATE TABLE `uni_rec`.`admins` (
  `Admin_ID` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL UNIQUE,
  `Password` CHAR(60) NOT NULL, 
  PRIMARY KEY (`Admin_ID`)
);

CREATE TABLE `uni_rec`.`university` (
  `University_ID` INT NOT NULL AUTO_INCREMENT,
  `University_Name` VARCHAR(100) NOT NULL,
  `University_Location` VARCHAR(50) NOT NULL,
  `University_Type` VARCHAR(45) NOT NULL,
  `University_Website` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`University_ID`));

CREATE TABLE `uni_rec`.`majors` (
  `Major_ID` INT NOT NULL AUTO_INCREMENT,
  `Major_Name` VARCHAR(225) NOT NULL,
  `University_ID` INT NOT NULL,
  `Duration` INT NOT NULL,
  `Acceptance_Grades` DECIMAL(5,2) NOT NULL, 
  `Tuition_Fees` DECIMAL(10,2) NOT NULL,
  `Thanaweya_Track` ENUM('Literary','Math','Science','Science, Math','Literary, Science, Math') NOT NULL, 
  PRIMARY KEY (`Major_ID`),
  FOREIGN KEY (`University_ID`) REFERENCES `university`(`University_ID`) ON DELETE CASCADE
);

INSERT INTO `uni_rec`.`university` (`University_Name`, `University_Location`, `University_Type`, `University_Website`) VALUES
-- State-funded Universities
('Ain Shams University', 'Cairo', 'Public', 'https://www.asu.edu.eg'),
('Alexandria University', 'Alexandria', 'Public', 'https://www.alexu.edu.eg'),
('Assiut University', 'Assiut', 'Public', 'https://www.aun.edu.eg'),
('Aswan University', 'Aswan', 'Public', 'https://www.aswu.edu.eg'),
('Banha University', 'Banha', 'Public', 'https://www.bu.edu.eg'),
('Beni-Suef University', 'Beni Suef', 'Public', 'https://www.bsu.edu.eg'),
('Cairo University', 'Giza', 'Public', 'https://www.cu.edu.eg'),
('Damanhour University', 'Damanhour', 'Public', 'https://www.damanhour.edu.eg'),
('Damietta University', 'Damietta', 'Public', 'https://www.du.edu.eg'),
('Egypt-Japan University of Science and Technology', 'Alexandria', 'Public', 'https://www.ejust.edu.eg'),
('Fayoum University', 'Fayoum', 'Public', 'https://www.fayoum.edu.eg'),
('Helwan University', 'Helwan', 'Public', 'https://www.helwan.edu.eg'),
('Kafrelsheikh University', 'Kafr El Sheikh', 'Public', 'https://www.kfs.edu.eg'),
('Luxor University', 'Luxor', 'Public', 'https://www.luxor.edu.eg'),
('Mansoura University', 'Mansoura', 'Public', 'https://www.mans.edu.eg'),
('Military Technical College', 'Cairo', 'Public', 'https://www.mtc.edu.eg'),
('Minia University', 'Minia', 'Public', 'https://www.minia.edu.eg'),
('Minufiya University', 'Shibin El Kom', 'Public', 'https://www.menofia.edu.eg'),
('New Valley University', 'Kharga', 'Public', 'https://www.nvu.edu.eg'),
('Port Said University', 'Port Said', 'Public', 'https://www.psu.edu.eg'),
('Sadat Academy for Management Sciences', 'Cairo', 'Public', 'https://www.sadat.edu.eg'),
('Sohag University', 'Sohag', 'Public', 'https://www.sohag-univ.edu.eg'),
('South Valley University', 'Qena', 'Public', 'https://www.svu.edu.eg'),
('Suez Canal University', 'Ismailia', 'Public', 'https://www.suez.edu.eg'),
('Suez University', 'Suez', 'Public', 'https://www.suezuniv.edu.eg'),
('Tanta University', 'Tanta', 'Public', 'https://www.tanta.edu.eg'),
('University of Sadat City', 'Sadat City', 'Public', 'https://www.usc.edu.eg'),
('Zagazig University', 'Zagazig', 'Public', 'https://www.zu.edu.eg'),

-- National Universities
('Zewail City of Science, Technology and Innovation', 'Giza', 'National', 'https://www.zewailcity.edu.eg'),
('King Salman International University', 'Sharm El Sheikh', 'National', 'https://www.ksiu.edu.eg'),
('Galala University', 'Ain Sokhna', 'National', 'https://www.gu.edu.eg'),
('Alamein International University', 'New Alamein', 'National', 'https://www.aiu.edu.eg'),
('New Mansoura University', 'New Mansoura', 'National', 'https://www.nmu.edu.eg'),
('Nile University', 'Sheikh Zayed', 'National', 'https://www.nu.edu.eg'),

-- Private Universities
('Heliopolis University', 'Cairo', 'Private', 'https://www.hu.edu.eg'),
('German International University', 'New Administrative Capital', 'Private', 'https://www.giu-uni.de'),
('German University in Cairo', 'New Cairo', 'Private', 'https://www.guc.edu.eg'),
('Ahram Canadian University', '6th of October City', 'Private', 'https://www.acu.edu.eg'),
('Arab Academy for Science, Technology and Maritime Transport', 'Alexandria', 'Private', 'https://www.aast.edu'),
('Arab Open University', 'Cairo', 'Private', 'https://www.arabou.edu.kw'),
('British University in Egypt', 'Cairo', 'Private', 'https://www.bue.edu.eg'),
('Canadian International College', 'New Cairo', 'Private', 'https://www.cic-cairo.edu.eg'),
('Delta University for Science and Technology', 'Mansoura', 'Private', 'https://www.deltauniv.edu.eg'),
('Egyptian Chinese University', 'Cairo', 'Private', 'https://www.ecu.edu.eg'),
('Egyptian e-Learning University', 'Cairo', 'Private', 'https://www.eelu.edu.eg'),
('Egyptian Russian University', 'Badr City', 'Private', 'https://www.eru.edu.eg'),
('Future University in Egypt', 'New Cairo', 'Private', 'https://www.fue.edu.eg'),
('Misr International University', 'Cairo', 'Private', 'https://www.miuegypt.edu.eg'),
('Misr University for Science and Technology', '6th of October City', 'Private', 'https://www.must.edu.eg'),
('October 6 University', '6th of October City', 'Private', 'https://www.o6u.edu.eg'),
('Pharos University in Alexandria', 'Alexandria', 'Private', 'https://www.pua.edu.eg'),
('Sinai University', 'El Arish', 'Private', 'https://www.su.edu.eg'),
('French University of Egypt', 'Cairo', 'Private', 'https://www.ufe.edu.eg'),
('University of Canada in Egypt', 'New Administrative Capital', 'Private', 'https://www.uofcanada.edu.eg'),
('University of Hertfordshire hosted by Global Academic Foundation', 'New Administrative Capital', 'Private', 'https://www.gaf.edu.eg'),
('University of Modern Sciences and Arts', '6th of October City', 'Private', 'https://www.msa.edu.eg'),
('Badr University in Cairo', 'Cairo', 'Private', 'https://www.buc.edu'),
('Nahda University in Beni Suef', 'Beni Suef', 'Private', 'https://www.nub.edu.eg'),
('Badr University in Assiut', 'Assiut', 'Private', 'https://www.buc.edu.eg'),
('New Giza University', 'Giza', 'Private', 'https://www.ngu.edu.eg'),
('El Shorouk Academy', 'Cairo', 'Private', 'https://www.sae.edu.eg'),
('The American University in Cairo', 'New Cairo', 'Private', 'https://www.aucegypt.edu');


CREATE TABLE `uni_rec`.`student_preferences` (
  `Student_ID` INT NOT NULL,
  `Preferred_Major` INT NOT NULL,
  `Preferred_Location` VARCHAR(50),
  `Tuition_Budget` DECIMAL(10,2) NOT NULL, -- Changed to DECIMAL
  `Preferred_Type` VARCHAR(50), -- Changed to VARCHAR
  PRIMARY KEY (`Student_ID`, `Preferred_Major`),
  FOREIGN KEY (`Student_ID`) REFERENCES `users`(`ID`),
  FOREIGN KEY (`Preferred_Major`) REFERENCES `majors`(`Major_ID`)
);

CREATE TABLE user_interactions (
    Interaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT NOT NULL,
    University_ID INT NOT NULL,
    Action_Type ENUM('click', 'save', 'apply') NOT NULL,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Student_ID) REFERENCES users(ID),
    FOREIGN KEY (University_ID) REFERENCES university(University_ID)
);

select * from university;
select * from majors;




INSERT INTO majors (Major_Name, University_ID, Duration, Acceptance_Grades, Tuition_Fees, Thanaweya_Track) VALUES
-- Ain Shams University (ID: 1)
('Faculty of Medicine', 1, 7, 385, 1183, 'Science'),
('Faculty of Science', 1, 4, 335, 7040, 'Science'),
('Faculty of Pharmacy', 1, 6, 376.5, 5000, 'Science'),
('Faculty of Computer Sciences', 1, 4, 357.5, 1800, 'Math'),
('Faculty of Dentistry', 1, 5, 381, 3500, 'Science'),
('Faculty of Media', 1, 4, 333.5, 2000, 'Literary, Science, Math'),
('Faculty of Engineering', 1, 5, 373.5, 1600, 'Math'),
('Faculty of Business', 1, 4, 301, 6000, 'Literary, Science, Math'),
('Faculty of Al-Alsun', 1, 4, 348, 1300, 'Literary'),
('Faculty of Education', 1, 4, 293.5, 5000, 'Literary'),
('Faculty of Law', 1, 4, 275, 1588, 'Literary'),
('Faculty of Women', 1, 4, 283.5, 2233, 'Literary'),
('Faculty of Agriculture', 1, 4, 300.5, 4800, 'Science, Math'),
('Faculty of Arts', 1, 4, 280.5, 2046, 'Literary, Science, Math'),
('Faculty of Nursing', 1, 4, 350, 3000, 'Science'),

-- Alexandria University (ID: 2)
('Faculty of Medicine', 2, 7, 382, 1100, 'Science'),
('Faculty of Science', 2, 4, 330, 6800, 'Science'),
('Faculty of Pharmacy', 2, 6, 374, 4700, 'Science'),
('Faculty of Computer Sciences', 2, 4, 355, 1700, 'Math'),
('Faculty of Dentistry', 2, 5, 378, 3400, 'Science'),
('Faculty of Media', 2, 4, 330, 1900, 'Literary, Science, Math'),
('Faculty of Engineering', 2, 5, 370, 1500, 'Math'),
('Faculty of Business', 2, 4, 298, 5800, 'Literary, Science, Math'),
('Faculty of Al-Alsun', 2, 4, 345, 1250, 'Literary'),
('Faculty of Education', 2, 4, 290, 4900, 'Literary'),
('Faculty of Law', 2, 4, 270, 1500, 'Literary'),
('Faculty of Agriculture', 2, 4, 298, 4600, 'Science, Math'),
('Faculty of Arts', 2, 4, 278, 2000, 'Literary, Science, Math'),
('Faculty of Nursing', 2, 4, 348, 2900, 'Science'),

-- Assiut University (ID: 3)
('Faculty of Medicine', 3, 7, 379, 1050, 'Science'),
('Faculty of Science', 3, 4, 328, 6600, 'Science'),
('Faculty of Pharmacy', 3, 6, 372, 4500, 'Science'),
('Faculty of Computer Sciences', 3, 4, 353, 1600, 'Math'),
('Faculty of Dentistry', 3, 5, 375, 3300, 'Science'),
('Faculty of Engineering', 3, 5, 368, 1400, 'Math'),
('Faculty of Business', 3, 4, 296, 5600, 'Literary, Science, Math'),
('Faculty of Law', 3, 4, 268, 1400, 'Literary'),
('Faculty of Agriculture', 3, 4, 296, 4400, 'Science, Math'),
('Faculty of Arts', 3, 4, 276, 1900, 'Literary, Science, Math'),
('Faculty of Nursing', 3, 4, 345, 2800, 'Science'),

-- Aswan University (ID: 4)
('Faculty of Medicine', 4, 7, 377, 1020, 'Science'),
('Faculty of Science', 4, 4, 326, 6500, 'Science'),
('Faculty of Pharmacy', 4, 6, 370, 4400, 'Science'),
('Faculty of Computer Sciences', 4, 4, 350, 1500, 'Math'),
('Faculty of Engineering', 4, 5, 365, 1300, 'Math'),
('Faculty of Business', 4, 4, 294, 5400, 'Literary, Science, Math'),
('Faculty of Law', 4, 4, 266, 1300, 'Literary'),
('Faculty of Agriculture', 4, 4, 294, 4200, 'Science, Math'),
('Faculty of Arts', 4, 4, 274, 1800, 'Literary, Science, Math'),
('Faculty of Nursing', 4, 4, 343, 2700, 'Science'),

-- Banha University (ID: 5)
('Faculty of Medicine', 5, 7, 376, 1000, 'Science'),
('Faculty of Science', 5, 4, 325, 6400, 'Science'),
('Faculty of Pharmacy', 5, 5, 368, 4300, 'Science'),
('Faculty of Computer Sciences', 5, 4, 348, 1450, 'Math'),
('Faculty of Engineering', 5, 5, 363, 1250, 'Math'),
('Faculty of Business', 5, 4, 292, 5200, 'Literary, Science, Math'),
('Faculty of Law', 5, 4, 264, 1200, 'Literary'),
('Faculty of Agriculture', 5, 4, 292, 4000, 'Science, Math'),
('Faculty of Arts', 5, 4, 272, 1700, 'Literary, Science, Math'),
('Faculty of Nursing', 5, 4, 340, 2600, 'Science'),

-- Beni-Suef University (ID: 6)
('Faculty of Medicine', 6, 7, 380, 1080, 'Science'),
('Faculty of Science', 6, 4, 332, 6700, 'Science'),
('Faculty of Pharmacy', 6, 6, 375, 4600, 'Science'),
('Faculty of Computer Sciences', 6, 4, 355, 1750, 'Math'),
('Faculty of Dentistry', 6, 5, 378, 3450, 'Science'),
('Faculty of Engineering', 6, 5, 370, 1550, 'Math'),
('Faculty of Business', 6, 4, 299, 5700, 'Literary, Science, Math'),
('Faculty of Law', 6, 4, 272, 1450, 'Literary'),
('Faculty of Agriculture', 6, 4, 297, 4500, 'Science, Math'),
('Faculty of Arts', 6, 4, 277, 1950, 'Literary, Science, Math'),
('Faculty of Nursing', 6, 4, 347, 2850, 'Science'),

-- Cairo University (ID: 7)
('Faculty of Medicine', 7, 7, 386, 1200, 'Science'),
('Faculty of Science', 7, 4, 338, 7200, 'Science'),
('Faculty of Pharmacy', 7, 6, 378, 5100, 'Science'),
('Faculty of Computer Sciences', 7, 4, 360, 1900, 'Math'),
('Faculty of Dentistry', 7, 5, 382, 3700, 'Science'),
('Faculty of Media', 7, 4, 335, 2100, 'Literary, Science, Math'),
('Faculty of Engineering', 7, 5, 375, 1650, 'Math'),
('Faculty of Business', 7, 4, 303, 6200, 'Literary, Science, Math'),
('Faculty of Al-Alsun', 7, 4, 350, 1400, 'Literary'),
('Faculty of Education', 7, 4, 295, 5200, 'Literary'),
('Faculty of Law', 7, 4, 278, 1600, 'Literary'),
('Faculty of Agriculture', 7, 4, 302, 4900, 'Science, Math'),
('Faculty of Arts', 7, 4, 282, 2150, 'Literary'),
('Faculty of Nursing', 7, 4, 352, 3100, 'Science'),

-- Damanhour University (ID: 8)
('Faculty of Medicine', 8, 7, 378, 1070, 'Science'),
('Faculty of Science', 8, 4, 330, 6600, 'Science'),
('Faculty of Pharmacy', 8, 6, 374, 4550, 'Science'),
('Faculty of Computer Sciences', 8, 4, 352, 1700, 'Math'),
('Faculty of Dentistry', 8, 5, 376, 3400, 'Science'),
('Faculty of Engineering', 8, 5, 369, 1500, 'Math'),
('Faculty of Business', 8, 4, 297, 5600, 'Literary, Science, Math'),
('Faculty of Law', 8, 4, 270, 1400, 'Literary'),
('Faculty of Agriculture', 8, 4, 295, 4400, 'Science, Math'),
('Faculty of Arts', 8, 4, 275, 1900, 'Literary, Science, Math'),
('Faculty of Nursing', 8, 4, 344, 2800, 'Science'),

-- Damietta University (ID: 9)
('Faculty of Science', 9, 4, 328, 6500, 'Science'),
('Faculty of Computer Sciences', 9, 4, 350, 1650, 'Math'),
('Faculty of Business', 9, 4, 295, 5500, 'Literary, Science, Math'),
('Faculty of Law', 9, 4, 268, 1350, 'Literary'),
('Faculty of Agriculture', 9, 4, 293, 4300, 'Science, Math'),
('Faculty of Arts', 9, 4, 273, 1850, 'Literary, Science, Math'),
('Faculty of Education', 9, 4, 290, 4700, 'Literary'),
('Faculty of Nursing', 9, 4, 342, 2700, 'Science'),

-- Egypt-Japan University of Science and Technology (ID: 10)
('Faculty of Engineering', 10, 5, 370, 18000, 'Math'),
('Faculty of Computer Sciences', 10, 4, 355, 12000, 'Math'),
('Faculty of Business', 10, 4, 300, 14000,'Literary, Science, Math'),
('Faculty of Science', 10, 4, 335, 12500, 'Science'),

-- Fayoum University (ID: 11)
('Faculty of Medicine', 11, 7, 377, 1080, 'Science'),
('Faculty of Science', 11, 4, 328, 6400, 'Science'),
('Faculty of Pharmacy', 11, 6, 372, 4500, 'Science'),
('Faculty of Computer Sciences', 11, 4, 352, 1600, 'Math'),
('Faculty of Dentistry', 11, 5, 375, 3300, 'Science'),
('Faculty of Engineering', 11, 5, 368, 1400, 'Math'),
('Faculty of Business', 11, 4, 296, 5200, 'Literary, Science, Math'),
('Faculty of Law', 11, 4, 268, 1400, 'Literary'),
('Faculty of Agriculture', 11, 4, 296, 4200, 'Science, Math'),
('Faculty of Arts', 11, 4, 276, 1800, 'Literary, Science, Math'),
('Faculty of Nursing', 11, 4, 345, 2700, 'Science'),

-- Helwan University (ID: 12)
('Faculty of Medicine', 12, 7, 376, 1070, 'Science'),
('Faculty of Science', 12, 4, 330, 6300, 'Science'),
('Faculty of Pharmacy', 12, 6, 371, 4400, 'Science'),
('Faculty of Computer Sciences', 12, 4, 350, 1500, 'Math'),
('Faculty of Dentistry', 12, 5, 374, 3200, 'Science'),
('Faculty of Engineering', 12, 5, 366, 1350, 'Math'),
('Faculty of Business', 12, 4, 295, 5100, 'Literary, Science, Math'),
('Faculty of Law', 12, 4, 267, 1300, 'Literary'),
('Faculty of Agriculture', 12, 4, 294, 4000, 'Science, Math'),
('Faculty of Arts', 12, 4, 275, 1750, 'Literary, Science, Math'),
('Faculty of Nursing', 12, 4, 344, 2650, 'Science'),


-- Kafrelsheikh University (ID: 13)
('Faculty of Medicine', 13, 7, 378, 1100, 'Science'),
('Faculty of Science', 13, 4, 332, 6500, 'Science'),
('Faculty of Pharmacy', 13, 6, 373, 4600, 'Science'),
('Faculty of Computer Sciences', 13, 4, 353, 1700, 'Math'),
('Faculty of Dentistry', 13, 5, 376, 3400, 'Science'),
('Faculty of Engineering', 13, 5, 369, 1550, 'Math'),
('Faculty of Business', 13, 4, 297, 5300, 'Literary, Science, Math'),
('Faculty of Law', 13, 4, 269, 1450, 'Literary'),
('Faculty of Agriculture', 13, 4, 295, 4300, 'Science, Math'),
('Faculty of Arts', 13, 4, 277, 1850, 'Literary, Science, Math'),
('Faculty of Nursing', 13, 4, 346, 2750, 'Science'),

-- Luxor University (ID: 14)
('Faculty of Science', 14, 4, 328, 6200, 'Science'),
('Faculty of Computer Sciences', 14, 4, 348, 1450, 'Math'),
('Faculty of Business', 14, 4, 293, 5000, 'Literary, Science, Math'),
('Faculty of Law', 14, 4, 265, 1250, 'Literary'),
('Faculty of Agriculture', 14, 4, 292, 3900, 'Science, Math'),
('Faculty of Arts', 14, 4, 272, 1700, 'Literary, Science, Math'),
('Faculty of Archaeology', 14, 4, 330, 2800, 'Literary'),

-- Mansoura University (ID: 15) 
('Faculty of Medicine', 15, 7, 382, 1150, 'Science'),
('Faculty of Science', 15, 4, 333, 6700, 'Science'),
('Faculty of Pharmacy', 15, 6, 374, 4700, 'Science'),
('Faculty of Computer Sciences', 15, 4, 355, 1750, 'Math'),
('Faculty of Dentistry', 15, 5, 378, 3500, 'Science'),
('Faculty of Engineering', 15, 5, 371, 1600, 'Math'),
('Faculty of Business', 15, 4, 298, 5700, 'Literary, Science, Math'),
('Faculty of Law', 15, 4, 270, 1500, 'Literary'),
('Faculty of Agriculture', 15, 4, 296, 4500, 'Science, Math'),
('Faculty of Arts', 15, 4, 278, 1950, 'Literary, Science, Math'),
('Faculty of Nursing', 15, 4, 348, 2900, 'Science'),

--  Military Technical College (ID: 16)
('Faculty of Engineering ', 16, 5, 380, 0, 'Math'),
('Faculty of Computer Sciences ', 16, 4, 360, 0, 'Math'),
('Faculty of Military Science', 16, 4, 350, 0, 'Science'),

-- Minia University (ID: 17)
('Faculty of Medicine', 17, 7, 378, 1040, 'Science'),
('Faculty of Science', 17, 4, 327, 6400, 'Science'),
('Faculty of Pharmacy', 17, 6, 371, 4300, 'Science'),
('Faculty of Computer Sciences', 17, 4, 352, 1550, 'Math'),
('Faculty of Dentistry', 17, 5, 374, 3200, 'Science'),
('Faculty of Engineering', 17, 5, 366, 1350, 'Math'),
('Faculty of Business', 17, 4, 295, 5300,'Literary, Science, Math'),
('Faculty of Law', 17, 4, 267, 1350, 'Literary'),
('Faculty of Agriculture', 17, 4, 295, 4100, 'Science, Math'),
('Faculty of Arts', 17, 4, 275, 1850, 'Literary, Science, Math'),
('Faculty of Nursing', 17, 4, 344, 2650, 'Science'),

-- Minufiya University (ID: 18)
('Faculty of Medicine', 18, 7, 376, 1020, 'Science'),
('Faculty of Science', 18, 4, 325, 6300, 'Science'),
('Faculty of Pharmacy', 18, 6, 369, 4200, 'Science'),
('Faculty of Computer Sciences', 18, 4, 350, 1500, 'Math'),
('Faculty of Dentistry', 18, 5, 372, 3100, 'Science'),
('Faculty of Engineering', 18, 5, 364, 1300, 'Math'),
('Faculty of Business', 18, 4, 293, 5200,'Literary, Science, Math'),
('Faculty of Law', 18, 4, 265, 1300, 'Literary'),
('Faculty of Agriculture', 18, 4, 293, 4000, 'Science, Math'),
('Faculty of Arts', 18, 4, 273, 1750, 'Literary, Science, Math'),
('Faculty of Nursing', 18, 4, 342, 2600, 'Science'),

-- New Valley University (ID: 19)
('Faculty of Science', 19, 4, 322, 6100, 'Science'),
('Faculty of Computer Sciences', 19, 4, 347, 1400, 'Math'),
('Faculty of Business', 19, 4, 290, 4900, 'Literary, Science, Math'),
('Faculty of Law', 19, 4, 263, 1200, 'Literary'),
('Faculty of Agriculture', 19, 4, 290, 3800, 'Science, Math'),
('Faculty of Arts', 19, 4, 270, 1600, 'Literary, Science, Math'),

--  Port Said University (ID: 20)
('Faculty of Medicine', 20, 7, 375, 1010, 'Science'),
('Faculty of Science', 20, 4, 324, 6200, 'Science'),
('Faculty of Pharmacy', 20, 6, 368, 4100, 'Science'),
('Faculty of Computer Sciences', 20, 4, 349, 1450, 'Math'),
('Faculty of Dentistry', 20, 5, 371, 3050, 'Science'),
('Faculty of Engineering', 20, 5, 362, 1250, 'Math'),
('Faculty of Business', 20, 4, 292, 5100, 'Literary, Science, Math'),
('Faculty of Law', 20, 4, 264, 1250, 'Literary'),
('Faculty of Agriculture', 20, 4, 292, 3900, 'Science, Math'),
('Faculty of Arts', 20, 4, 272, 1700, 'Literary, Science, Math'),
('Faculty of Nursing', 20, 4, 341, 2500, 'Science'),

-- Sadat Academy for Management Sciences (ID: 21)
('Faculty of Business', 21, 4, 290, 5000, 'Literary, Science, Math'),
('Faculty of Law', 21, 4, 262, 1200, 'Literary'),
('Faculty of Computer Sciences', 21, 4, 346, 1350, 'Math'),

-- Sohag University (ID: 22)
('Faculty of Medicine', 22, 7, 374, 1000, 'Science'),
('Faculty of Science', 22, 4, 323, 6000, 'Science'),
('Faculty of Pharmacy', 22, 6, 366, 4000, 'Science'),
('Faculty of Computer Sciences', 22, 4, 348, 1400, 'Math'),
('Faculty of Dentistry', 22, 5, 370, 3000, 'Science'),
('Faculty of Engineering', 22, 5, 360, 1200, 'Math'),
('Faculty of Business', 22, 4, 291, 5000, 'Literary, Science, Math'),
('Faculty of Law', 22, 4, 261, 1150, 'Literary'),
('Faculty of Agriculture', 22, 4, 291, 3800, 'Science, Math'),
('Faculty of Arts', 22, 4, 271, 1650, 'Literary, Science, Math'),
('Faculty of Nursing', 22, 4, 340, 2450, 'Science'),

-- South Valley University (ID: 23)
('Faculty of Medicine', 23, 7, 373, 980, 'Science'),
('Faculty of Science', 23, 4, 322, 5900, 'Science'),
('Faculty of Pharmacy', 23, 6, 365, 3900, 'Science'),
('Faculty of Computer Sciences', 23, 4, 347, 1350, 'Math'),
('Faculty of Dentistry', 23, 5, 369, 2950, 'Science'),
('Faculty of Engineering', 23, 5, 358, 1180, 'Math'),
('Faculty of Business', 23, 4, 290, 4900,'Literary, Science, Math'),
('Faculty of Law', 23, 4, 260, 1100, 'Literary'),
('Faculty of Agriculture', 23, 4, 290, 3700, 'Science, Math'),
('Faculty of Arts', 23, 4, 270, 1600, 'Literary, Science, Math'),
('Faculty of Nursing', 23, 4, 339, 2400, 'Science'),

-- Suez Canal University (ID: 24)
('Faculty of Medicine', 24, 7, 372, 970, 'Science'),
('Faculty of Science', 24, 4, 321, 5800, 'Science'),
('Faculty of Pharmacy', 24, 6, 364, 3850, 'Science'),
('Faculty of Computer Sciences', 24, 4, 346, 1320, 'Math'),
('Faculty of Dentistry', 24, 5, 368, 2900, 'Science'),
('Faculty of Engineering', 24, 5, 357, 1150, 'Math'),
('Faculty of Business', 24, 4, 289, 4800, 'Literary, Science, Math'),
('Faculty of Law', 24, 4, 259, 1080, 'Literary'),
('Faculty of Agriculture', 24, 4, 289, 3600, 'Science, Math'),
('Faculty of Arts', 24, 4, 269, 1580, 'Literary, Science, Math'),
('Faculty of Nursing', 24, 4, 338, 2350, 'Science'),

-- Suez University (ID: 25)
('Faculty of Medicine', 25, 7, 371, 960, 'Science'),
('Faculty of Science', 25, 4, 320, 5700, 'Science'),
('Faculty of Pharmacy', 25, 6, 363, 3800, 'Science'),
('Faculty of Computer Sciences', 25, 4, 345, 1300, 'Math'),
('Faculty of Dentistry', 25, 5, 367, 2850, 'Science'),
('Faculty of Engineering', 25, 5, 356, 1120, 'Math'),
('Faculty of Business', 25, 4, 288, 4700, 'Literary, Science, Math'),
('Faculty of Law', 25, 4, 258, 1060, 'Literary'),
('Faculty of Agriculture', 25, 4, 288, 3500, 'Science, Math'),
('Faculty of Arts', 25, 4, 268, 1550, 'Literary, Science, Math'),
('Faculty of Nursing', 25, 4, 337, 2300, 'Science'),

-- Tanta University (ID: 26)
('Faculty of Medicine', 26, 7, 378, 1050, 'Science'),
('Faculty of Science', 26, 4, 330, 6700, 'Science'),
('Faculty of Pharmacy', 26, 5, 373, 4600, 'Science'),
('Faculty of Computer Sciences', 26, 4, 354, 1700, 'Math'),
('Faculty of Dentistry', 26, 5, 376, 3400, 'Science'),
('Faculty of Engineering', 26, 5, 369, 1500, 'Math'),
('Faculty of Business', 26, 4, 297, 5700, 'Literary, Science, Math'),
('Faculty of Law', 26, 4, 269, 1450, 'Literary'),
('Faculty of Agriculture', 26, 4, 297, 4500, 'Science, Math'),
('Faculty of Arts', 26, 4, 277, 1950, 'Literary, Science, Math'),
('Faculty of Nursing', 26, 4, 346, 2850, 'Science'),

-- University of Sadat City (ID: 27)
('Faculty of Veterinary Medicine', 27, 5, 365, 4000, 'Science'),
('Faculty of Agricultural Sciences', 27, 4, 320, 4500, 'Science, Math'),
('Faculty of Business', 27, 4, 295, 5500, 'Literary, Science, Math'),
('Faculty of Law', 27, 4, 270, 1400, 'Literary'),
('Faculty of Education', 27, 4, 288, 5000, 'Literary'),
('Faculty of Physical Education', 27, 4, 280, 3000, 'Literary'),
('Faculty of Nursing', 27, 4, 345, 2700, 'Science'),

-- Zagazig University (ID: 28)
('Faculty of Medicine', 28, 7, 379, 1080, 'Science'),
('Faculty of Science', 28, 4, 332, 6750, 'Science'),
('Faculty of Pharmacy', 28, 5, 374, 4700, 'Science'),
('Faculty of Computer Sciences', 28, 4, 355, 1750, 'Math'),
('Faculty of Dentistry', 28, 5, 377, 3450, 'Science'),
('Faculty of Engineering', 28, 5, 370, 1550, 'Math'),
('Faculty of Business', 28, 4, 298, 5800,'Literary, Science, Math'),
('Faculty of Law', 28, 4, 270, 1480, 'Literary'),
('Faculty of Agriculture', 28, 4, 298, 4550, 'Science, Math'),
('Faculty of Arts', 28, 4, 278, 1980, 'Literary, Science, Math'),
('Faculty of Nursing', 28, 4, 347, 2750, 'Science'),

-- Zewail City of Science, Technology and Innovation (ID : 29)
('Faculty of Science', 29, 4, 287, 144000, 'Science'),
('Faculty of Engineering', 29, 5, 287, 144000, 'Math'),
('Faculty of Computer Sciences', 29, 4, 266.5, 89000, 'Math'),
('Faculty of Business', 29, 4, 225.5, 89000, 'Literary, Science, Math'),

-- King Salman International University (ID : 30)
('Faculty of Human Medicine', 30, 7, 303.4, 138600, 'Science'),
('Faculty of Dentistry', 30, 5, 299.3, 128100, 'Science'),
('Faculty of Physical Therapy', 30, 5, 295.2, 110000, 'Science'),
('Faculty of Pharmacy', 30, 5, 278.8, 112000, 'Science'),
('Faculty of Veterinary Medicine', 30, 5, 266.5, 79200, 'Science'),
('Faculty of Engineering', 30, 5, 266.5, 75000, 'Math'),
('Faculty of Computer Sciences', 30, 4, 246.0, 75900, 'Math'),
('Faculty of Science', 30, 4, 255.0, 52800, 'Science'),
('Faculty of Business', 30, 4, 225.5, 50600,'Literary, Science, Math'),

-- Galala University (ID: 31)
('Faculty of Medicine', 31, 7, 315.7, 173000, 'Science'),
('Faculty of Dentistry', 31, 5, 311.6, 162800, 'Science'),
('Faculty of Physical Therapy', 31, 5, 303.4, 120000, 'Science'),
('Faculty of Pharmacy', 31, 5, 291.1, 121000, 'Science'),
('Faculty of Nursing', 31, 4, 225.5, 54800, 'Science'),
('Faculty of Science', 31, 4, 225.5, 63960, 'Science'),
('Faculty of Media', 31, 4, 225.5, 65000, 'Literary'),
('Faculty of Applied Arts', 31, 4, 225.5, 40480, 'Literary'),
('Faculty of Engineering', 31, 5, 270.6, 93500, 'Math'),
('Faculty of Computer Sciences', 31, 4, 250.1, 87380, 'Math'),
('Faculty of Business', 31, 4, 225.5, 60920, 'Literary, Science, Math'),

-- Alamein International University (ID: 32)
('Faculty of Physical Therapy', 32, 5, 303.4, 47000, 'Science'),
('Faculty of Dentistry', 32, 5, 311.6, 59000, 'Science'),
('Faculty of Pharmacy', 32, 5, 291.1, 52000, 'Science'),
('Faculty of Science', 32, 4, 225.5, 28500, 'Science'),
('Faculty of Engineering', 32, 5, 270.6, 38000, 'Math'),
('Faculty of Computer Sciences', 32, 4, 250.1, 38000, 'Math'),
('Faculty of Business', 32, 4, 225.5, 27000, 'Literary'),
('Faculty of Applied Arts', 32, 4, 225.5, 28500, 'Literary'),

-- New Mansoura University (ID: 33)
('Faculty of Medicine', 33, 7, 348.5, 130000, 'Science'),
('Faculty of Dentistry', 33, 5, 336.4, 110000, 'Science'),
('Faculty of Pharmacy', 33, 5, 299.3, 90000, 'Science'),
('Faculty of Physical Therapy', 33, 5, 319.8, 90000, 'Science'),
('Faculty of Engineering', 33, 5, 287, 65000, 'Math'),
('Faculty of Computer Sciences', 33, 4, 266.5, 65000, 'Math'),
('Faculty of Veterinary Medicine', 33, 5, 266.5, 65000, 'Science'),
('Faculty of Nursing', 33, 4, 225.5, 40000, 'Science'),
('Faculty of Business', 33, 4, 225.5, 30000, 'Literary, Science, Math'),

-- Nile University (ID: 34)
('Faculty of Engineering', 34, 5, 287, 117000, 'Math'),
('Faculty of Business', 34, 4, 225.5, 117000, 'Literary, Science, Math'),
('Faculty of Computer Sciences', 34, 4, 266.5, 117000, 'Math'),
('Faculty of Biotechnology', 34, 4, 225.5, 117000, 'Science'),


-- Heliopolis University (ID: 35)
('Faculty of Pharmacy', 35, 6, 328.0, 95000, 'Science'),
('Faculty of Engineering', 35, 5, 328.0, 85000, 'Math'),
('Faculty of Business', 35, 4, 254.2, 70000, 'Literary, Science, Math'),
('Faculty of Physical Therapy', 35, 5, 303.4, 90000, 'Science'),
('Faculty of Organic Agriculture', 35, 4, 225.5, 60000, 'Science'),

-- German International University (ID: 36)
('Faculty of Engineering', 36, 5, 328.0, 150000, 'Math'),
('Faculty of Computer Sciences', 36, 4, 233.7, 140000, 'Math'),
('Faculty of Business', 36, 4, 254.2, 130000, 'Literary, Science, Math'),
('Faculty of Design', 36, 4, 225.5, 130000, 'Literary'),
('Faculty of Biotechnology', 36, 4, 263.2, 140000, 'Science'),
('Faculty of Informatics', 36, 4, 233.7, 140000, 'Math'),
('Faculty of Pharmaceutical Engineering', 36, 6, 303.4, 155000, 'Science'),
('Faculty of Energy Engineering', 36, 5, 278.8, 150000, 'Math'),

-- German University in Cairo (GUC) (ID: 37)
('Faculty of Pharmacy', 37, 6, 303.4, 188370, 'Science'),
('Faculty of Engineering', 37, 5, 328.0, 188370, 'Math'),
('Faculty of Information Engineering and Technology', 37, 4, 233.7, 188370, 'Math'),
('Faculty of Management Technology', 37, 4, 254.2, 188370, 'Literary, Science, Math'),
('Faculty of Media Engineering and Technology', 37, 4, 233.7, 188370, 'Math'),
('Faculty of Applied Sciences and Arts', 37, 4, 225.5, 188370, 'Science'),
('Faculty of Law and Legal Studies', 37, 4, 225.5, 188370, 'Literary'),

-- Ahram Canadian University (ID: 38)
('Faculty of Oral and Dental Medicine', 38, 5, 328.0, 105000, 'Science'),
('Faculty of Pharmacy', 38, 6, 303.4, 82000, 'Science'),
('Faculty of Physical Therapy', 38, 5, 303.4, 80000, 'Science'),
('Faculty of Engineering', 38, 5, 328.0, 53000, 'Math'),
('Faculty of Mass Communication', 38, 4, 225.5, 45000, 'Literary'),
('Faculty of Design and Creative Arts', 38, 4, 225.5, 55000, 'Literary, Science, Math'),
('Faculty of Languages', 38, 4, 217.3, 40000, 'Literary'),
('Faculty of Business', 38, 4, 237.0, 46000, 'Literary, Science, Math'),

-- Arab Academy for Science, Technology and Maritime Transport (ID: 39)

('Faculty of Maritime Transport and Technology', 39, 4, 287.0, 252000, 'Math'),
('Faculty of Engineering and Technology', 39, 5, 328.0, 334000, 'Math'),
('Faculty of Pharmacy', 39, 6, 361.0, 412000, 'Science'),
('Faculty of Oral and Dental Medicine ', 39, 5, 361.0, 450000, 'Science'),
('Faculty of Computing Sciences', 39, 4, 287.0, 325000, 'Math'),
('Faculty of Management and Technology', 39, 4, 266.5, 347000, 'Literary, Science, Math'),
('Faculty of International Transport and Logistics', 39, 4, 266.5, 347000, 'Literary, Science, Math'),
('Faculty of Language and Media', 39, 4, 266.5, 331000, 'Literary'),
('Faculty of Fisheries Technology and Aquaculture', 39, 4, 246.0, 206000, 'Science'),
('Faculty of Law', 39, 4, 246.0, 336000, 'Literary'),
('Faculty of Medicine', 39, 7, 348.5, 500000, 'Science'),

--  Arab Open University (AOU) (ID: 40)
('Faculty of Business', 40, 4, 217.3, 36300, 'Literary, Science, Math'),
('Faculty of Computer Sciences', 40, 4, 233.7, 36300, 'Math'),
('Faculty of Graphic Design and Multimedia', 40, 4, 217.3, 39300, 'Science, Math'),
('Faculty of Linguistics and Translation', 40, 4, 217.3, 36300, 'Literary'),
('Faculty of Media and Mass Communication', 40, 4, 217.3, 36300, 'Literary'),
('Faculty of Education - Mathematics', 40, 4, 217.3, 36300, 'Math'),
('Faculty of Education - English, Early Childhood, Counseling', 40, 4, 217.3, 36300, 'Literary'),

--  The British University in Egypt (BUE) – ID: 41
('Faculty of Energy Engineering', 41, 5, 278.8, 190000, 'Math'),
('Faculty of Applied Arts', 41, 4, 225.5, 210000, 'Literary, Science, Math'),
('Faculty of Business', 41, 4, 254.2, 165000, 'Literary, Science, Math'),
('Faculty of Law', 41, 4, 225.5, 165000, 'Literary'),
('Faculty of Engineering', 41, 5, 328.0, 220000, 'Math'),
('Faculty of Pharmacy', 41, 6, 303.4, 170000, 'Science'),
('Faculty of Nursing', 41, 4, 225.5, 81000, 'Science'),
('Faculty of Dentistry', 41, 5, 328.0, 266000, 'Science'),

--  Canadian International College (CIC) – ID: 42 
('Faculty of Dentistry', 42, 5, 328.0, 105000, 'Science'),
('Faculty of Pharmacy', 42, 6, 303.4, 82000, 'Science'),
('Faculty of Physical Therapy', 42, 5, 278.8, 80000, 'Science'),
('Faculty of Design and Creative Arts', 42, 4, 254.2, 55000, 'Literary, Science, Math'),
('Faculty of Media in English', 42, 4, 233.7, 45000, 'Literary'),
('Faculty of Engineering', 42, 5, 278.8, 53000, 'Math'),
('Faculty of Languages', 42, 4, 217.3, 40000, 'Literary'),

--  Delta University for Science and Technology (ID: 43)
('Faculty of Medicine', 43, 7, 328.0, 195000, 'Math'),
('Faculty of Dentistry', 43, 5, 295.2, 165000, 'Science'),
('Faculty of Clinical Pharmacy', 43, 6, 294.4, 112000, 'Science'),
('Faculty of Veterinary Medicine', 43, 5, 271.4, 65000, 'Science'),
('Faculty of Nursing', 43, 4, 278.8, 54000, 'Science'),
('Faculty of Physical Therapy', 43, 5, 276.1, 103000, 'Science'),
('Faculty of Engineering', 43, 5, 278.8, 58000, 'Math'),
('Faculty of Business', 43, 4, 253.1, 39000, 'Literary, Science, Math'),
('Faculty of Computer Sciences', 43, 4, 268.3, 64000, 'Math'),
('Faculty of Health Sciences', 43, 4, 271.4, 57000, 'Science'),
('Faculty of Arts', 43, 4, 225.5, 36000, 'Literary'),


--  Egyptian Chinese University (ID: 44)
('Faculty of Physical Therapy', 44, 5, 311.6, 78000, 'Science'),
('Faculty of Engineering', 44, 5, 278.8, 56000, 'Math'),
('Faculty of Pharmacy', 44, 6, 295.2, 98000, 'Science'),
('Faculty of Business', 44, 4, 225.5, 44000, 'Literary, Science, Math'),

-- Egyptian e-Learning University (ID: 45)
('Faculty of Computer Sciences', 45, 4, 246.4, 40000, 'Math'),
('Faculty of Business Administration', 45, 4, 217.3, 40000, 'Literary, Science, Math'),

-- Egyptian Russian University (ID: 46)
('Faculty of Dentistry', 46, 5, 328.0, 125400, 'Science'),
('Faculty of Engineering', 46, 5, 278.8, 61200, 'Math'),
('Faculty of Pharmacy', 46, 6, 303.4, 96800, 'Science'),
('Faculty of Languages', 46, 4, 225.5, 35700, 'Literary'),
('Faculty of Computer Sciences', 46, 4, 254.2, 55000, 'Math'),
('Faculty of Fine Arts', 46, 4, 233.7, 40800, 'Literary'),
('Faculty of Business', 46, 4, 225.5, 44900, 'Literary, Science, Math'),

-- Future University in Egypt (ID: 47)
('Faculty of Dentistry', 47, 5, 317.7, 286904, 'Science'),
('Faculty of Pharmacy', 47, 6, 290.1, 216904, 'Science'),
('Faculty of Engineering', 47, 5, 278.8, 173904, 'Math'),
('Faculty of Computer Sciences', 47, 4, 246.0, 174904, 'Math'),
('Faculty of Business', 47, 4, 217.3, 163904, 'Literary, Science, Math'),

-- Misr International University (MIU) (ID :48)
('Faculty of Dentistry', 48, 5, 328.0, 250000, 'Science'),
('Faculty of Pharmacy', 48, 6, 303.4, 133300, 'Science'),
('Faculty of Engineering', 48, 5, 278.8, 121000, 'Math'),
('Faculty of Computer Sciences', 48, 4, 254.2, 136000, 'Math'),
('Faculty of Media', 48, 4, 233.7, 123600, 'Literary'),
('Faculty of Languages', 48, 4, 217.3, 86000, 'Literary'),
('Faculty of Business', 48, 4, 233.7, 123600, 'Literary, Science, Math'),

-- Misr University for Science and Technology (MUST) (ID :49)
('Faculty of Medicine', 49, 7, 348.5, 130000, 'Science'),
('Faculty of Physical Therapy', 49, 5, 328.0, 75000, 'Science'),
('Faculty of Dentistry', 49, 5, 328.0, 105000, 'Science'),
('Faculty of Pharmacy', 49, 6, 328.0, 72000, 'Science'),
('Faculty of Computer Sciences', 49, 4, 246.1, 45000, 'Math'),
('Faculty of Business', 49, 4, 266.5, 40000, 'Literary, Science, Math'),
('Faculty of Applied Medical Sciences', 49, 4, 287.2, 36000, 'Science'),
('Faculty of Tourism and Archaeology', 49, 4, 226.5, 25000, 'Literary'),
('Faculty of Media and Communication Arts', 49, 4, 266.5, 40000, 'Literary'),
('Faculty of Engineering', 49, 5, 238.6, 55000, 'Math'),
('Faculty of Biotechnology', 49, 4, 287.2, 55000, 'Science'),
('Faculty of Languages and Translation (English)', 49, 4, 266.5, 35000, 'Literary'),
('Faculty of Nursing', 49, 4, 246.1, 36000, 'Science'),

--  6th of October University
('Faculty of Medicine', 50, 7, 336.6, 160000, 'Science'),
('Faculty of Dentistry', 50, 5, 328.0, 135000, 'Science'),
('Faculty of Pharmacy', 50, 6, 303.4, 90000, 'Science'),
('Faculty of Physical Therapy', 50, 5, 319.7, 85000, 'Science'),
('Faculty of Applied Medical Sciences', 50, 4, 217.6, 50000, 'Science'),
('Faculty of Nursing', 50, 4, 226.5, 40000, 'Science'),
('Faculty of Engineering', 50, 5, 278.8, 65000, 'Math'),
('Faculty of Media and Communication Arts', 50, 4, 226.5, 45000, 'Literary'),
('Faculty of Computer Sciences', 50, 4, 246.1, 60000, 'Math'),
('Faculty of Applied Arts', 50, 4, 226.5, 55000, 'Literary'),
('Faculty of Education', 50, 4, 226.5, 35000, 'Literary'),
('Faculty of Languages and Translation', 50, 4, 217.6, 42000, 'Literary'),
('Faculty of Business', 50, 4, 226.5, 40000, 'Literary, Science, Math'),
('Faculty of Tourism and Hotels', 50, 4, 226.5, 21000, 'Literary'),

-- Pharos University 
('Faculty of Dentistry', 51, 5, 328.0, 192000, 'Science'),
('Faculty of Clinical Pharmacy', 51, 6, 303.4, 140000, 'Science'),
('Faculty of Pharmaceutical Sciences', 51, 6, 317.6, 130000, 'Science'),
('Faculty of Physical Therapy', 51, 5, 319.7, 131000, 'Science'),
('Faculty of Applied Health Sciences', 51, 4, 204.6, 96000, 'Science'),
('Faculty of Engineering', 51, 5, 278.8, 92000, 'Math'),
('Faculty of Computer Sciences', 51, 4, 246.1, 100000, 'Math'),
('Faculty of Arts and Design', 51, 4, 226.5, 98500, 'Literary'),
('Faculty of Languages and Translation', 51, 4, 204.6, 89500, 'Literary'),
('Faculty of Business', 51, 4, 217.6, 89000, 'Literary, Science, Math'),
('Faculty of Media and Communication Arts', 51, 4, 226.5, 88000, 'Literary'),
('Faculty of Legal Studies and International Transactions', 51, 4, 217.6, 78000, 'Literary'),
('Faculty of Tourism and Hotel Management', 51, 4, 226.5, 74000, 'Literary'),

-- Sinai University
('Faculty of Dentistry', 52, 5, 319.8, 155710, 'Science'),
('Faculty of Physical Therapy', 52, 5, 299.3, 0, 'Science'),
('Faculty of Clinical Pharmacy', 52, 6, 278.8, 108045, 'Science'),
('Faculty of Engineering', 52, 5, 246, 62206, 'Math'),
('Faculty of Computer Science', 52, 4, 246, 41490, 'Math'),
('Faculty of Business', 52, 4, 217.3, 52710, 'Literary, Science, Math'),
('Faculty of Media and Communication Arts', 52, 4, 217.3, 52710, 'Literary'),

--  French University in Egypt (ID 53)
('Faculty of Applied Languages', 53, 4, 227.5, 115000, 'Literary'),
('Faculty of Engineering', 53, 5, 238.0, 135000, 'Math'),
('Faculty of Business Administration', 53, 4, 182.5, 125000, 'Literary, Science, Math'),

-- University of Canada in Egypt (ID 54)
('Faculty of Dentistry', 54, 5, 319.7, 150000, 'Science'),
('Faculty of Pharmacy', 54, 5, 295.4, 120000, 'Science'),
('Faculty of Physical Therapy', 54, 4, 312.6, 90000, 'Science'),
('Faculty of Computer Sciences', 54, 4, 246.0, 70000, 'Math'),
('Faculty of Design and Arts', 54, 4, 217.3, 55000, 'Literary, Science, Math'),
('Faculty of Engineering', 54, 5, 278.8, 55000, 'Math'),
('Faculty of Business', 54, 4, 217.3, 60000, 'Literary, Science, Math'),
('Faculty of Media', 54, 4, 217.3, 50000, 'Literary, Science, Math'),
('Faculty of Languages and Translation', 54, 4, 217.3, 50000, 'Literary, Science, Math'),

-- University of Hertfordshire
('Faculty of Pharmacy', 55, 5, 251.1, 285000, 'Science'),
('Faculty of Physical Therapy', 55, 4, 262.4, 285000, 'Science'),
('Faculty of Engineering', 55, 5, 246.0, 285000, 'Math'),
('Faculty of Computer Sciences', 55, 4, 246.0, 285000, 'Math'),
('Faculty of Business', 55, 4, 217.3, 250000, 'Literary, Science, Math'),
('Faculty of Media and Communication', 55, 4, 217.3, 250000, 'Literary, Science, Math'),
('Faculty of Creative Arts', 55, 4, 246.0, 275000, 'Literary, Science, Math'),
('Faculty of Psychology', 55, 4, 226.0, 275000, 'Literary, Science, Math'),
('Faculty of Nutrition', 55, 4, 246.0, 275000, 'Science'),

-- Modern Sciences and Arts (MSA University) with ID 56
('Faculty of Dentistry', 56, 5, 369.0, 158100, 'Science'),
('Faculty of Pharmacy', 56, 6, 369.0, 119350, 'Science'),
('Faculty of Biotechnology', 56, 4, 287.0, 100000, 'Science'),
('Faculty of Engineering', 56, 5, 328.0, 91800, 'Math'),
('Faculty of Computer Sciences', 56, 4, 287.0, 71400, 'Math'),
('Faculty of Arts and Design', 56, 4, 287.0, 91800, 'Literary, Science, Math'),
('Faculty of Business Administration', 56, 4, 246.0, 83650, 'Literary, Science, Math'),
('Faculty of Media', 56, 4, 246.0, 83650, 'Literary, Science, Math'),
('Faculty of Languages and Translation', 56, 4, 246.0, 61200, 'Literary, Science, Math'),

-- Badr University in Cairo (ID: 57)
('Faculty of Medicine', 57, 7, 328.0, 208900, 'Science'),
('Faculty of Dentistry', 57, 5, 319.8, 155000, 'Science'),
('Faculty of Physical Therapy', 57, 5, 303.4, 101200, 'Science'),
('Faculty of Pharmacy', 57, 6, 295.2, 107800, 'Science'),
('Faculty of Biotechnology', 57, 4, 287.0, 68500, 'Science'),
('Faculty of Nursing', 57, 4, 225.5, 50000, 'Science'),
('Faculty of Applied Arts', 57, 4, 225.5, 65500, 'Literary, Science, Math'),
('Faculty of Engineering', 57, 5, 278.8, 70000, 'Math'),
('Faculty of Law', 57, 4, 225.5, 68500, 'Literary'),
('Faculty of Business and Economics', 57, 4, 225.5, 63000, 'Literary, Science, Math'),
('Faculty of Media', 57, 4, 225.5, 57500, 'Literary, Science, Math'),
('Faculty of Languages and Translation', 57, 4, 225.5, 57500, 'Literary, Science, Math'),
('Faculty of Political Science', 57, 4, 225.5, 60000, 'Literary'),
('Faculty of Psychology', 57, 4, 225.5, 50000, 'Literary, Science, Math'),

-- Nahda University in Beni Suef with ID 58,
('Faculty of Medicine', 58, 7, 348.5, 185000, 'Science'),
('Faculty of Dentistry', 58, 5, 336.4, 127000, 'Science'),
('Faculty of Pharmacy', 58, 6, 299.3, 90000, 'Science'),
('Faculty of Physical Therapy', 58, 5, 319.8, 80000, 'Science'),
('Faculty of Engineering', 58, 5, 287.0, 100000, 'Math'),
('Faculty of Computers Sciences', 58, 4, 266.5, 70000, 'Math'),
('Faculty of Media', 58, 4, 237.8, 70000, 'Literary, Science, Math'),
('Faculty of Business', 58, 4, 237.8, 60000, 'Literary, Science, Math'),

-- Badr University in Assiut with ID 59
('Faculty of Medicine', 59, 7, 328.0, 0, 'Science'),
('Faculty of Dentistry', 59, 5, 319.8, 118000, 'Science'),
('Faculty of Pharmacy', 59, 6, 295.2, 77000, 'Science'),
('Faculty of Pharmacy Clinical', 59, 6, 348.5, 85000, 'Science'),
('Faculty of Physical Therapy', 59, 5, 311.6, 75000, 'Science'),
('Faculty of Veterinary Medicine', 59, 5, 278.8, 62500, 'Science'),
('Faculty of Engineering', 59, 5, 278.8, 0, 'Math'),
('Faculty of Computer Sciences', 59, 4, 254.2, 41500, 'Math'),
('Faculty of Media', 59, 4, 225.5, 0, 'Literary, Science, Math'),
('Faculty of Applied Sciences and Arts', 59, 4, 225.5, 52500, 'Literary, Science, Math'),
('Faculty of Languages and Translation', 59, 4, 225.5, 51500, 'Literary, Science, Math'),
('Faculty of Tourism and Hotels', 59, 4, 225.5, 0, 'Literary, Science, Math'),
('Faculty of Law', 59, 4, 225.5, 54000, 'Literary, Science, Math'),
('Faculty of Nursing', 59, 4, 225.5, 44000, 'Science'),

-- New Giza University with ID 60
('Faculty of Medicine', 60, 7, 328.0, 252000, 'Science'),
('Faculty of Dentistry', 60, 5, 319.8, 234000, 'Science'),
('Faculty of Pharmacy', 60, 6, 295.2, 148000, 'Science'),
('Faculty of Engineering', 60, 5, 278.8, 182700, 'Math'),
('Faculty of Economics and Political Science', 60, 4, 217.3, 181400, 'Literary, Science, Math'),
('Faculty of Applied Sciences and Arts', 60, 4, 217.3, 188100, 'Literary, Science, Math'),
('Faculty of Computer Sciences', 60, 4, 246.0, 185200, 'Math'),
('Faculty of Business', 60, 4, 217.3, 216000, 'Literary, Science, Math'),

-- El Shorouk Academy with ID 61
('Faculty of Engineering', 61, 5, 322.0, 24000, 'Math'),
('Faculty of Computer Sciences', 61, 4, 337.5, 10000, 'Science'),
('Faculty of Information Systems', 61, 4, 306.5, 10000, 'Science'),
('Faculty of Media', 61, 4, 210.0, 24000, 'Literary, Science, Math'),
('Faculty of Business Administration', 61, 4, 210.0, 10000, 'Literary, Science, Math'),
('Faculty of Management Information Systems', 61, 4, 210.0, 10000, 'Literary, Science, Math'),

-- The American University in Cairo
('Faculty of Medicine', 62, 7, 348, 920160, 'Science'),
('Faculty of Dentistry', 62, 5, 336, 920160, 'Science'),
('Faculty of Physical Therapy', 62, 5, 328, 841480, 'Science'),
('Faculty of Pharmacy', 62, 6, 328, 841480, 'Science'),
('Faculty of Engineering', 62, 5, 287, 770400, 'Math'),
('Faculty of Applied Health Sciences', 62, 4, 258, 700000, 'Science'),
('Faculty of Computer Sciences', 62, 4, 287, 770400, 'Math'),
('Faculty of Biotechnology', 62, 4, 258, 700000, 'Science'),
('Faculty of Languages and Translation', 62, 4, 246, 700000, 'Literary'),
('Faculty of Media', 62, 4, 246, 700000, 'Literary, Science, Math'),
('Faculty of Business', 62, 4, 226, 700000, 'Literary, Science, Math'),
('Faculty of Law', 62, 4, 226, 700000, 'Literary'),
('Faculty of Arts', 62, 4, 226, 700000, 'Literary, Science, Math'),
('Faculty of Agriculture', 62, 4, 226, 700000, 'Science, Math'),
('Faculty of Nursing', 62, 4, 226, 700000, 'Science'),
('Faculty of Science', 62, 4, 226, 700000, 'Science'),
('Faculty of Education', 62, 4, 226, 700000, 'Literary'),
('Faculty of Al-Alsun', 62, 4, 226, 700000,'Literary');

SHOW DATABASES;
