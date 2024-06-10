-- Dodanie użytkowników
INSERT INTO Users (UserID, FirstName, LastName, BirthDate, Email) VALUES (1, 'Jan', 'Kowalski', TO_DATE('1980-01-15', 'YYYY-MM-DD'), 'jan.kowalski@example.com');
INSERT INTO Users (UserID, FirstName, LastName, BirthDate, Email) VALUES (2, 'Anna', 'Nowak', TO_DATE('1990-02-20', 'YYYY-MM-DD'), 'anna.nowak@example.com');
INSERT INTO Users (UserID, FirstName, LastName, BirthDate, Email) VALUES (3, 'Maria', 'Wiśniewska', TO_DATE('1975-03-25', 'YYYY-MM-DD'), 'maria.wisniewska@example.com');

-- Dodanie adresów użytkowników
INSERT INTO UserAddresses (AddressID, UserID, Street, City, PostalCode, Country) VALUES (1, 1, 'ul. Główna 1', 'Warszawa', '00-001', 'Polska');
INSERT INTO UserAddresses (AddressID, UserID, Street, City, PostalCode, Country) VALUES (2, 2, 'ul. Słoneczna 2', 'Kraków', '30-002', 'Polska');
INSERT INTO UserAddresses (AddressID, UserID, Street, City, PostalCode, Country) VALUES (3, 3, 'ul. Zielona 3', 'Gdańsk', '80-003', 'Polska');

-- Dodanie autorów
INSERT INTO Authors (AuthorID, FirstName, LastName, DateOfBirth, Country) VALUES (1, 'Adam', 'Mickiewicz', TO_DATE('1798-12-24', 'YYYY-MM-DD'), 'Polska');
INSERT INTO Authors (AuthorID, FirstName, LastName, DateOfBirth, Country) VALUES (2, 'Henryk', 'Sienkiewicz', TO_DATE('1846-05-05', 'YYYY-MM-DD'), 'Polska');
INSERT INTO Authors (AuthorID, FirstName, LastName, DateOfBirth, Country) VALUES (3, 'Bolesław', 'Prus', TO_DATE('1847-08-20', 'YYYY-MM-DD'), 'Polska');

-- Dodanie książek
INSERT INTO Books (BookID, Title, Genre, PublishDate, AuthorID, ISBN) VALUES (1, 'Pan Tadeusz', 'Epopeja narodowa', TO_DATE('1834-06-28', 'YYYY-MM-DD'), 1, '9788373271890');
INSERT INTO Books (BookID, Title, Genre, PublishDate, AuthorID, ISBN) VALUES (2, 'Quo Vadis', 'Powieść historyczna', TO_DATE('1896-01-01', 'YYYY-MM-DD'), 2, '9788373272002');
INSERT INTO Books (BookID, Title, Genre, PublishDate, AuthorID, ISBN) VALUES (3, 'Lalka', 'Powieść', TO_DATE('1890-01-01', 'YYYY-MM-DD'), 3, '9788373272040');

-- Dodanie wypożyczeń
INSERT INTO Borrowings (BorrowingID, UserID, BookID, BorrowDate, DueDate) VALUES (1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO Borrowings (BorrowingID, UserID, BookID, BorrowDate, DueDate) VALUES (2, 2, 2, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO Borrowings (BorrowingID, UserID, BookID, BorrowDate, DueDate) VALUES (3, 3, 3, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'));

-- Dodanie rekordów do historii wypożyczeń
INSERT INTO BorrowingHistory (HistoryID, UserID, BookID, BorrowDate, ReturnDate) VALUES (1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO BorrowingHistory (HistoryID, UserID, BookID, BorrowDate, ReturnDate) VALUES (2, 2, 2, TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO BorrowingHistory (HistoryID, UserID, BookID, BorrowDate, ReturnDate) VALUES (3, 3, 3, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'));
