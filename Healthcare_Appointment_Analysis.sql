CREATE DATABASE Healthcare_Appointment_DB;

USE Healthcare_Appointment_DB;
USE Healthcare_Appointment_DB;

SELECT
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'No' THEN 1
        ELSE 0
    END) AS Attended_Appointments,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show_Appointments,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments;
SELECT
    Gender,
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'No' THEN 1
        ELSE 0
    END) AS Attended,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY Gender;

SELECT
    SMS_received,
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'No' THEN 1
        ELSE 0
    END) AS Attended,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY SMS_received;

SELECT
    Scholarship,
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'No' THEN 1
        ELSE 0
    END) AS Attended,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY Scholarship;

SELECT
    AgeGroup,
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'No' THEN 1
        ELSE 0
    END) AS Attended,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY AgeGroup
ORDER BY No_Show_Percentage DESC;

SELECT
    'Hypertension' AS Medical_Condition,
    Hipertension AS Condition_Status,
    COUNT(*) AS Total_Appointments,
    SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END) AS No_Show,
    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage
FROM appointments
GROUP BY Hipertension

UNION ALL

SELECT
    'Diabetes',
    Diabetes,
    COUNT(*),
    SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM appointments
GROUP BY Diabetes

UNION ALL

SELECT
    'Alcoholism',
    Alcoholism,
    COUNT(*),
    SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END),
    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    )
FROM appointments
GROUP BY Alcoholism;

SELECT
    CASE
        WHEN WaitingDays = 0 THEN 'Same Day'
        WHEN WaitingDays BETWEEN 1 AND 7 THEN '1-7 Days'
        WHEN WaitingDays BETWEEN 8 AND 14 THEN '8-14 Days'
        WHEN WaitingDays BETWEEN 15 AND 30 THEN '15-30 Days'
        ELSE 'Above 30 Days'
    END AS Waiting_Period,

    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY Waiting_Period
ORDER BY
    CASE Waiting_Period
        WHEN 'Same Day' THEN 1
        WHEN '1-7 Days' THEN 2
        WHEN '8-14 Days' THEN 3
        WHEN '15-30 Days' THEN 4
        ELSE 5
    END;
    
    SELECT
    AppointmentMonth,
    COUNT(*) AS Total_Appointments,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY AppointmentMonth
ORDER BY MIN(AppointmentDay);

SELECT
    Neighbourhood,
    COUNT(*) AS Total_Appointments,
    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,
    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage
FROM appointments
GROUP BY Neighbourhood
ORDER BY No_Show DESC
LIMIT 10;

SELECT
    Handcap,
    COUNT(*) AS Total_Appointments,
    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,
    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage
FROM appointments
GROUP BY Handcap
ORDER BY Handcap;

SELECT
    COUNT(*) AS Total_Appointments,

    COUNT(DISTINCT PatientId) AS Unique_Patients,

    ROUND(AVG(Age), 2) AS Average_Age,

    ROUND(AVG(WaitingDays), 2) AS Average_Waiting_Days,

    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS Total_No_Shows,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Rate,

    SUM(CASE
        WHEN SMS_received = 1 THEN 1
        ELSE 0
    END) AS SMS_Received_Appointments

FROM appointments;
SELECT
    Neighbourhood,
    COUNT(*) AS Total_Appointments,
    SUM(CASE
        WHEN `No-show` = 'Yes' THEN 1
        ELSE 0
    END) AS No_Show,

    ROUND(
        SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS No_Show_Percentage

FROM appointments
GROUP BY Neighbourhood
HAVING COUNT(*) >= 100
ORDER BY No_Show_Percentage DESC
LIMIT 10;

SELECT
    `No-show` AS Appointment_Status,
    COUNT(*) AS Total_Appointments,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM appointments),
        2
    ) AS Percentage
FROM appointments
GROUP BY `No-show`;