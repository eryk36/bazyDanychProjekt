-- Tworzenie tabeli Użytkowników
CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    BirthDate DATE,
    Email VARCHAR2(100) UNIQUE,
    RegistrationDate DATE DEFAULT SYSDATE
);

-- Tworzenie tabeli Adresów Użytkowników
CREATE TABLE UserAddresses (
    AddressID NUMBER PRIMARY KEY,
    UserID NUMBER,
    Street VARCHAR2(100),
    City VARCHAR2(50),
    PostalCode VARCHAR2(10),
    Country VARCHAR2(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Tworzenie tabeli Autorów
CREATE TABLE Authors (
    AuthorID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    DateOfBirth DATE,
    Country VARCHAR2(50)
);

-- Tworzenie tabeli Książek
CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Genre VARCHAR2(50),
    PublishDate DATE,
    AuthorID NUMBER,
    ISBN VARCHAR2(13) UNIQUE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Tworzenie tabeli Wypożyczeń
CREATE TABLE Borrowings (
    BorrowingID NUMBER PRIMARY KEY,
    UserID NUMBER,
    BookID NUMBER,
    BorrowDate DATE DEFAULT SYSDATE,
    ReturnDate DATE,
    DueDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CHECK (ReturnDate IS NULL OR ReturnDate >= BorrowDate),
    CHECK (DueDate >= BorrowDate)
);

-- Tworzenie tabeli Historii Wypożyczeń
CREATE TABLE BorrowingHistory (
    HistoryID NUMBER PRIMARY KEY,
    UserID NUMBER,
    BookID NUMBER,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Tworzenie indeksów
CREATE INDEX idx_users_lastname ON Users (LastName);
CREATE INDEX idx_books_title ON Books (Title);
CREATE INDEX idx_borrowings_userid ON Borrowings (UserID);

-- Wyzwalacz do przenoszenia rekordów do tabeli Historii Wypożyczeń po zwrocie książki
CREATE OR REPLACE TRIGGER trg_after_return
AFTER UPDATE OF ReturnDate ON Borrowings
FOR EACH ROW
WHEN (NEW.ReturnDate IS NOT NULL)
BEGIN
    INSERT INTO BorrowingHistory (HistoryID, UserID, BookID, BorrowDate, ReturnDate)
    VALUES (:NEW.BorrowingID, :NEW.UserID, :NEW.BookID, :NEW.BorrowDate, :NEW.ReturnDate);
    DELETE FROM Borrowings WHERE BorrowingID = :NEW.BorrowingID;
END;
