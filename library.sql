-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key for Categories
    CategoryName VARCHAR(255) NOT NULL UNIQUE,  -- Category name must be unique
    Description TEXT
);

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary Key for Authors
    FirstName VARCHAR(255) NOT NULL,           -- First name cannot be NULL
    LastName VARCHAR(255) NOT NULL,            -- Last name cannot be NULL
    BirthDate DATE,
    Nationality VARCHAR(100)
);

-- Create Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key for Books
    Title VARCHAR(255) NOT NULL,               -- Title cannot be NULL
    ISBN VARCHAR(13) NOT NULL UNIQUE,          -- ISBN is unique and cannot be NULL
    PublishedDate DATE,
    CategoryID INT,                            -- Foreign Key for Categories
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,   -- Primary Key for Members
    FirstName VARCHAR(255) NOT NULL,            -- First name cannot be NULL
    LastName VARCHAR(255) NOT NULL,             -- Last name cannot be NULL
    Email VARCHAR(255) UNIQUE,                  -- Email should be unique
    PhoneNumber VARCHAR(15),
    JoinDate DATE NOT NULL                      -- Date of joining the library
);

-- Create BorrowRecords table (Many-to-Many relationship between Books and Members)
CREATE TABLE BorrowRecords (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,    -- Primary Key for BorrowRecords
    MemberID INT,                               -- Foreign Key for Members
    BookID INT,                                 -- Foreign Key for Books
    BorrowDate DATE NOT NULL,                   -- Date the book was borrowed
    ReturnDate DATE,                            -- Date the book is returned (nullable)
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID), -- Foreign Key for Members
    FOREIGN KEY (BookID) REFERENCES Books(BookID)         -- Foreign Key for Books
);

-- Create a Many-to-Many relationship between Books and Authors
CREATE TABLE BookAuthors (
    BookID INT,                                 -- Foreign Key for Books
    AuthorID INT,                               -- Foreign Key for Authors
    PRIMARY KEY (BookID, AuthorID),             -- Composite Primary Key
    FOREIGN KEY (BookID) REFERENCES Books(BookID),    -- Foreign Key for Books
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) -- Foreign Key for Authors
);
