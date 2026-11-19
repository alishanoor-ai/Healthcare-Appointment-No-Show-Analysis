USE Healthcare_Appointment_DB;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
USE Healthcare_Appointment_DB;

SHOW TABLES;
USE Healthcare_Appointment_DB;

CREATE TABLE appointments (
    PatientId VARCHAR(30),
    AppointmentID BIGINT,
    Gender VARCHAR(10),
    ScheduledDay VARCHAR(40),
    AppointmentDay VARCHAR(40),
    Age INT,
    Neighbourhood VARCHAR(100),
    Scholarship INT,
    Hipertension INT,
    Diabetes INT,
    Alcoholism INT,
    Handcap INT,
    SMS_received INT,
    `No-show` VARCHAR(10),
    WaitingDays INT,
    AgeGroup VARCHAR(30),
    AppointmentMonth VARCHAR(20)
);
DESCRIBE appointments;

