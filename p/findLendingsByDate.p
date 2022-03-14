//näitab kõiki antud vahemikul välja laenutatud raamatuid
DEFINE TEMP-TABLE ttBooks NO-UNDO
    FIELD LoanDate AS DATE
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD UserName AS CHAR FORMAT "x(50)"
    FIELD ReturnDate AS DATE.
    
    
PROCEDURE lendingsOnPeriod:
    DEFINE INPUT  PARAMETER startDate AS DATE NO-UNDO.
    DEFINE INPUT  PARAMETER endDate AS DATE NO-UNDO.
    DEFINE OUTPUT PARAMETER TABLE FOR ttBooks.

FOR EACH Lendings WHERE Lendings.LoanDate >= startDate AND Lendings.LoanDate <= endDate NO-LOCK,
EACH Users OF Lendings NO-LOCK,
EACH LendingBooks OF Lendings NO-LOCK,
EACH Book OF LendingBooks NO-LOCK:
CREATE ttBooks.
ASSIGN ttBooks.LoanDate = Lendings.LoanDate
       ttBooks.BookAuthor = Books.BookAuthor
       ttBooks.BookTitle = Books.BookTitle
       ttBooks.UserName = Users.FirstName + " " + Users.LastName
       ttBooks.ReturnDate = LendingBooks.LendingEndDate.
END.  

END PROCEDURE.



//esimene parameeter on laenutsperioodi algus, teine on laenutusperioodi lõpp
RUN lendingsOnPeriod(01.03.2022, 03.03.2022, OUTPUT TABLE ttBooks).
FOR EACH ttBooks:
    DISPLAY ttBooks WITH COLUMN 1.
END.
