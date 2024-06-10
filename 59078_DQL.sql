-- Wyświetla historię wypożyczeń dla użytkownika o UserID = 1
SELECT 
    h.HistoryID, 
    h.UserID, 
    u.FirstName, 
    u.LastName, 
    h.BookID, 
    b.Title, 
    h.BorrowDate, 
    h.ReturnDate
FROM 
    BorrowingHistory h
JOIN 
    Users u ON h.UserID = u.UserID
JOIN 
    Books b ON h.BookID = b.BookID
WHERE 
    h.UserID = 1;

-- Wyświetla 20 książek, które były najczęściej wypożyczane
SELECT 
    b.Title, 
    COUNT(h.BookID) AS BorrowCount
FROM 
    BorrowingHistory h
JOIN 
    Books b ON h.BookID = b.BookID
GROUP BY 
    b.Title
ORDER BY 
    BorrowCount DESC
FETCH FIRST 20 ROWS ONLY;

-- Wyświetla listę książek, które są wypożyczone na dłużej niż 30 dni wraz z danymi użytkowników
SELECT 
    b.BorrowingID, 
    u.FirstName, 
    u.LastName, 
    b.BookID, 
    bk.Title, 
    b.BorrowDate, 
    (SYSDATE - b.BorrowDate) AS DaysBorrowed
FROM 
    Borrowings b
JOIN 
    Users u ON b.UserID = u.UserID
JOIN 
    Books bk ON b.BookID = bk.BookID
WHERE 
    (SYSDATE - b.BorrowDate) > 30;
