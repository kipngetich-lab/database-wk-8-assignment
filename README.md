# Library Management System Database

## Overview

This project consists of a well-structured relational database for a Library Management System implemented in MySQL. It includes tables for managing authors, books, categories, members, and loans, allowing users to track and manage library data efficiently.

## Features

- **Authors**: Store information about book authors.
- **Categories**: Organize books by genres or categories.
- **Books**: Manage details of the books available in the library.
- **Members**: Keep track of library members who can borrow books.
- **Loans**: Handle the borrowing and returning of books by members.

## Database Schema

The database includes the following tables:

- **Authors**
  - `AuthorID`: INT, Primary Key, Auto Increment
  - `Name`: VARCHAR(100), Unique, Not Null
  - `BirthDate`: Date
  - `Nationality`: VARCHAR(50)

- **Categories**
  - `CategoryID`: INT, Primary Key, Auto Increment
  - `CategoryName`: VARCHAR(100), Unique, Not Null

- **Books**
  - `BookID`: INT, Primary Key, Auto Increment
  - `Title`: VARCHAR(255), Not Null
  - `AuthorID`: INT, Foreign Key referencing Authors(AuthorID), Not Null
  - `CategoryID`: INT, Foreign Key referencing Categories(CategoryID), Not Null
  - `PublishedYear`: YEAR
  - `ISBN` : VARCHAR(20), Unique
  - `CopiesAvailable`: INT, Default 0

- **Members**
  - `MemberID`: INT, Primary Key, Auto Increment
  - `FullName`: VARCHAR(100), Not Null
  - `Email`: VARCHAR(100), Unique, Not Null
  - `Phone` : VARCHAR(15)
  - `JoinDate`: DATE,NOT NULL

- **Loans**
  - `LoanID`: INT, Primary Key, Auto Increment
  - `BookID`: INT, Foreign Key referencing Books(BookID), Not Null
  - `MemberID`: INT, Foreign Key referencing Members(MemberID), Not Null
  - `LoanDate`: DATE, Not Null
  - `ReturnDate`: DATE, Nullable

## Getting Started

To set up the database:

1. **Prerequisites**:
   - Ensure you have MySQL installed on your machine or access to a MySQL server.
   - Familiarity with SQL basics.

2. **Clone the repository**:
	- bash 
    - git clone https://github.com/kipngetich-lab/database-wk-8-assignment.git
	- cd database-wk-8-assignment

3. **Create the Database**:
   - Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or terminal).

4. **Execute the SQL script**:
   - Load the `library.sql` file and execute it to create the database schema and sample data.
    

## Sample Data

The SQL script includes sample data for testing purposes:

- Three authors: George R.R Martin, J.K. Rowling, and J.R.R. Tolkien.
- Four categories: Non-Fiction, Fantasy, Science Fiction, and Mystery.
- Four books with various availability.
- Two members and some loan records.

## Usage

After setting up the database, you can interact with it using SQL queries to:

- Add new authors, books, and categories.
- Register new members.
- Record loans and returns of books.

### Example Queries

1. **Retrieve all books**:

	sql SELECT * FROM Books;

2. **Find all books loaned out**:

	sql SELECT b.Title, m.FullName, l.LoanDate FROM Loans l JOIN Books b ON l.BookID = b.BookID JOIN Members m ON l.MemberID = m.MemberID;

3. **Count available copies of each book**:

	sql SELECT Title, CopiesAvailable FROM Books WHERE CopiesAvailable > 0;

## Acknowledgments

- Inspired by the need for an organized system to manage library resources.
- Contributions are welcome to enhance the functionality and features.