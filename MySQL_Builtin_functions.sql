DROP DATABASE IF EXISTS training_functions;

CREATE DATABASE training_functions;

USE training_functions;

CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);

INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');

USE training_functions;


-- Q1. Full name in uppercase
SELECT UPPER(CONCAT(FirstName, ' ', LastName)) AS FullName
FROM CourseEnrollments;


-- Q2. First letter of FirstName uppercase, remaining unchanged
SELECT CONCAT(
    UPPER(SUBSTRING(FirstName, 1, 1)),
    SUBSTRING(FirstName, 2)
) AS StudentName
FROM CourseEnrollments;


-- Q3. Student code: first 3 letters of CourseName + StudentID
SELECT CONCAT(
    UPPER(LEFT(CourseName, 3)),
    '-',
    StudentID
) AS StudentCode
FROM CourseEnrollments;


-- Q4. FirstName reversed and character count
SELECT
    REVERSE(FirstName) AS ReversedName,
    CHAR_LENGTH(FirstName) AS CharacterCount
FROM CourseEnrollments;


-- Q5. Position of letter 'a' in FirstName
SELECT
    FirstName,
    LOCATE('a', FirstName) AS PositionOfA
FROM CourseEnrollments;


-- Q6. Replace every 'a' with 'o' and convert to uppercase
SELECT
    UPPER(REPLACE(FirstName, 'a', 'o')) AS ModifiedName
FROM CourseEnrollments;


-- Q7. FirstName padded with zeroes to total length 12
SELECT
    LPAD(FirstName, 12, '0') AS PaddedName
FROM CourseEnrollments;


-- Q8. Last 2 letters of CourseName + first 2 letters of FirstName
SELECT
    CONCAT(
        RIGHT(CourseName, 2),
        '-',
        LEFT(FirstName, 2)
    ) AS CourseLabel
FROM CourseEnrollments;


-- Q9. First 3 letters of FirstName uppercase + last 2 letters of LastName lowercase
SELECT
    CONCAT(
        UPPER(SUBSTRING(FirstName, 1, 3)),
        LOWER(RIGHT(LastName, 2))
    ) AS StudentCode
FROM CourseEnrollments;


-- Q10. Fee rounded to 1 decimal and nearest whole number
SELECT
    ROUND(Fee, 1) AS Fee_One_Decimal,
    ROUND(Fee, 0) AS Fee_Whole_Number
FROM CourseEnrollments;


-- Q11. Fee rounded upward and downward
SELECT
    CEIL(Fee) AS Rounded_Up,
    FLOOR(Fee) AS Rounded_Down
FROM CourseEnrollments;


-- Q12. Remainder when Fee is divided by 500
SELECT
    Fee,
    MOD(Fee, 500) AS Remainder
FROM CourseEnrollments;


-- Q13. Absolute difference between Fee and 10000
SELECT
    ABS(Fee - 10000) AS Absolute_Difference
FROM CourseEnrollments;


-- Q14. Fee multiplied by 1.18 and rounded to 2 decimals
SELECT
    ROUND(Fee * 1.18, 2) AS Fee_With_18_Percent
FROM CourseEnrollments;


-- Q15. Fee formatted with thousands separator and 2 decimals
SELECT
    FORMAT(Fee, 2) AS Formatted_Fee
FROM CourseEnrollments;


-- Q16. Enrollment year, month name and day name
SELECT
    YEAR(EnrollmentDate) AS Enrollment_Year,
    MONTHNAME(EnrollmentDate) AS Enrollment_Month,
    DAYNAME(EnrollmentDate) AS Enrollment_Day
FROM CourseEnrollments;


-- Q17. Format EnrollmentDate and CompletionDate
SELECT
    DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS Enrollment_Date,
    DATE_FORMAT(CompletionDate, '%M %d, %Y') AS Completion_Date
FROM CourseEnrollments;


-- Q18. Number of days between EnrollmentDate and CompletionDate
SELECT
    TIMESTAMPDIFF(DAY, EnrollmentDate, CompletionDate) AS Days_Between
FROM CourseEnrollments;


-- Q19. Date 1 month and 10 days after EnrollmentDate
SELECT
    DATE_ADD(
        DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH),
        INTERVAL 10 DAY
    ) AS New_Date
FROM CourseEnrollments;


-- Q20. Date exactly 7 days before CompletionDate
SELECT
    DATE_ADD(CompletionDate, INTERVAL -7 DAY) AS Seven_Days_Before
FROM CourseEnrollments;


-- Q21. Complete months between EnrollmentDate and CompletionDate
SELECT
    TIMESTAMPDIFF(MONTH, EnrollmentDate, CompletionDate) AS Complete_Months
FROM CourseEnrollments;


-- Q22. EnrollmentDate shifted forward by 1 year, 2 months and 5 days
SELECT
    DATE_ADD(
        DATE_ADD(
            DATE_ADD(EnrollmentDate, INTERVAL 1 YEAR),
            INTERVAL 2 MONTH
        ),
        INTERVAL 5 DAY
    ) AS Shifted_Date
FROM CourseEnrollments;


-- Q23. EnrollmentDate and CompletionDate with weekday names
SELECT
    EnrollmentDate,
    DAYNAME(EnrollmentDate) AS Enrollment_Weekday,
    CompletionDate,
    DAYNAME(CompletionDate) AS Completion_Weekday
FROM CourseEnrollments;


-- Q24. Number of days from EnrollmentDate until current date
SELECT
    TIMESTAMPDIFF(DAY, EnrollmentDate, CURDATE()) AS Days_From_Enrollment
FROM CourseEnrollments;


-- Q25. Original CompletionDate and date after adding 15 days
-- formatted as DD/MM/YYYY
SELECT
    DATE_FORMAT(CompletionDate, '%d/%m/%Y') AS Original_Completion_Date,
    DATE_FORMAT(
        DATE_ADD(CompletionDate, INTERVAL 15 DAY),
        '%d/%m/%Y'
    ) AS Completion_Date_After_15_Days
FROM CourseEnrollments;