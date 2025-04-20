CREATE PROCEDURE GetStudentsByAgeRange
    @Age1 INT,
    @Age2 INT
AS
BEGIN
    SELECT *
    FROM 
        Student
    WHERE 
        St_Age BETWEEN @Age1 AND @Age2
END