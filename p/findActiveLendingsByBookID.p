//näitab antud raamatu kõiki aktiivseid laenutusi (st tagastamata raamatuid)
DEFINE TEMP-TABLE ttBooks NO-UNDO
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD LoanDate AS DATE
    FIELD LendingEnd AS DATE
    FIELD Lender AS CHAR FORMAT "x(50)".

PROCEDURE findBookLendings:
    DEFINE INPUT  PARAMETER bookID AS INT NO-UNDO.
    DEFINE OUTPUT PARAMETER TABLE FOR ttBooks.
    
FOR EACH Books WHERE Books.Book_ID = bookID NO-LOCK,
 EACH LendingBooks OF Books WHERE LendingBooks.ReturnedDate = ? NO-LOCK,
 EACH Lendings OF LendingBooks NO-LOCK,
 EACH Users OF Lendings NO-LOCK:

 CREATE ttBooks.
 ASSIGN ttBooks.BookAuthor = Books.BookAuthor
        ttBooks.BookTitle = Books.BookTitle
        ttBooks.LoanDate = Lendings.LoanDate
        ttBooks.LendingEnd = LendingBooks.LendingEndDate
        ttBooks.Lender = Users.FirstName + " " + Users.LastName.
END.    

END PROCEDURE.
 
    
 
//Esimene parameeter on raamaru ID (Books.Book_ID) ID.
RUN findBookLendings(2, OUTPUT TABLE ttBooks).
FOR EACH ttBooks:
    DISPLAY ttBooks WITH COLUMN 1.
END.
