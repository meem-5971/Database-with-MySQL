use myfirst;
CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ISBN VARCHAR(13),
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
INSERT INTO Student(StudentId, Name, Email, Phone, Address) VALUES (1, 'Meem', 'meem21@gmail.com','019832823','Gazipur');
INSERT INTO Student(StudentId, Name, Email, Phone, Address) VALUES (2, 'Khushnor', 'khushnor21@gmail.com','014832823','Ashulia');
INSERT INTO Student(StudentId, Name, Email, Phone, Address) VALUES (3, 'Rahman', 'rahman21@gmail.com','015832823','Dhaka');

-- 2 no ans
INSERT INTO Borrowing (StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (3, (SELECT ISBN FROM Book ORDER BY AvailableCopies DESC LIMIT 1), CURDATE(), CURDATE()+14, '2024-03-17' );

INSERT INTO Borrowing (StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (3, '8781234567890', CURDATE(), CURDATE()+14, '2024-04-17' );
INSERT INTO Borrowing (StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (2, '8781234567890', CURDATE(), CURDATE()+14, '2024-05-17' );
INSERT INTO Borrowing (StudentID, ISBN, BorrowDate, DueDate, ReturnDate)
VALUES (2, '9781234567890', CURDATE(), CURDATE()+14, '2024-03-12' );

INSERT INTO Book (ISBN, Title, Author, Genre, Totalcopies, Availablecopies)  VALUES ('9781234567890','DevDas','Sarad','Tragedy','100','90');
INSERT INTO Book (ISBN, Title, Author, Genre, Totalcopies, Availablecopies)  VALUES ('8781234567890','The Alchemist','Coelho','Drama','150','110');

-- 3 no ans
UPDATE Book
SET Availablecopies=Availablecopies-1
WHERE ISBN='9781234567890';

-- 4 no ans
SELECT s.StudentID,s.Name, COUNT(*) AS BorrowedBooks
FROM Student s
JOIN Borrowing b ON s.StudentID = b.StudentID
GROUP BY s.StudentID,s.Name
ORDER BY BorrowedBooks DESC;

-- 5 no ans
SELECT *
FROM Borrowing
WHERE ReturnDate < CURDATE();


-- 2nd lowest salary( 8 no ans )
 SELECT Salary
 FROM EMPLOYEES
 WHERE SALARY = (
				SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE SALARY > (SELECT MIN(SALARY)
								FROM EMPLOYEES
                                )
				);
                
-- 9 No Ans
use dummydb2;
ALTER TABLE Job_History
ADD FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
ON DELETE CASCADE;

ALTER TABLE Employees
ADD FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
ON DELETE SET NULL;