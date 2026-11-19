SHOW VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE 'secure_file_priv';
USE Healthcare_Appointment_DB;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Healthcare_Appointment_SQL.csv'
INTO TABLE appointments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    PatientId,
    AppointmentID,
    Gender,
    ScheduledDay,
    AppointmentDay,
    Age,
    Neighbourhood,
    Scholarship,
    Hipertension,
    Diabetes,
    Alcoholism,
    Handcap,
    SMS_received,
    `No-show`,
    WaitingDays,
    AgeGroup,
    AppointmentMonth
);
SELECT COUNT(*) AS Total_Rows
FROM appointments;