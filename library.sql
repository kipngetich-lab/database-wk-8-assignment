-- Create database
CREATE DATABASE library;
USE library;

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BirthDate DATE,
    Nationality VARCHAR(50),
    UNIQUE(Name)
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    AuthorID INT,
    CategoryID INT,
    PublishedYear YEAR,
    ISBN VARCHAR(20) UNIQUE,
    CopiesAvailable INT DEFAULT 0,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE SET NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL
);

-- Create Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    JoinDate DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Create Loans table
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE NOT NULL DEFAULT CURRENT_DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    UNIQUE(BookID, MemberID, LoanDate)
);

-- Sample Data for Authors
INSERT INTO Authors (Name, BirthDate, Nationality) VALUES
('J.K. Rowling', '1965-07-31', 'British'),
('George R.R. Martin', '1948-09-20', 'American'),
('J.R.R. Tolkien', '1892-01-03', 'British');

-- Sample Data for Categories
INSERT INTO Categories (CategoryName) VALUES
('Fantasy'),
('Science Fiction'),
('Mystery'),
('Non-Fiction');

-- Sample Data for Books
INSERT INTO Books (Title, AuthorID, CategoryID, PublishedYear, ISBN, CopiesAvailable) VALUES
('Harry Potter and the Philosopher's Stone', 1, 1, 1997, '9780747532699', 5),
('A Game of Thrones', 2, 1, 1996, '9780553103540', 3),
('The Hobbit', 3, 1, 1937, '9780547928227', 4),
('The Martian', NULL, 2, 2011, '9780553418026', 2);

-- Sample Data for Members
INSERT INTO Members (FullName, Email, Phone) VALUES
('Alice Smith', 'alice@example.com', '123-456-7890'),
('Bob Johnson', 'bob@example.com', '098-765-4321');

-- Sample Data for Loans
INSERT INTO Loans (BookID, MemberID, LoanDate) VALUES
(1, 1, '2023-10-01'),
(2, 1, '2023-10-02'),
(3, 2, '2023-10-03');
