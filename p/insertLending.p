DEFINE TEMP-TABLE ttBookID NO-UNDO
FIELD Book_ID AS INT.

PROCEDURE insertLending:
DEFINE INPUT PARAMETER user_ID AS INT.
DEFINE INPUT PARAMETER TABLE FOR ttBookID.

DEFINE VAR loan_ID AS INT.
DEFINE VAR booksLeft AS INT.
DEFINE VAR bookAge AS INT NO-UNDO.
DEFINE VAR lendPeriod AS INT NO-UNDO.

CREATE Lendings.
    ASSIGN Lendings.User_ID = user_ID
           Lendings.LoanDate = TODAY.
loan_ID = CURRENT-VALUE(LoanIDseq).

CREATE LendingBooks.
  FOR EACH ttBookID:
    //väljas olevate raamatute arv  
    DEFINE VARIABLE booksOut AS INT NO-UNDO.
    FOR EACH LendingBooks WHERE LendingBooks.Book_ID = ttBookID.Book_ID AND LendingBooks.ReturnedDate = ? NO-LOCK:
        ASSIGN booksOut = booksOut + 1.
    END.

    DEFINE VARIABLE bookCount AS INT NO-UNDO.
    DEFINE VARIABLE bookDate AS DATE NO-UNDO.
    FIND FIRST Books WHERE Books.Book_ID = ttBookID.Book_ID NO-LOCK.
    bookDate = Books.InventoryDate.
    bookCount = Books.ItemsCount.
    booksLeft = bookCount - booksOut.
    bookAge = INTERVAL ( TODAY , bookDate , "months").
    lendPeriod = 28.
    IF booksLeft < 5 THEN
    DO:
        lendPeriod = 7.    
    END.
    IF bookAge < 3 THEN
    DO:
        lendPeriod = 7.    
    END.
    
    CREATE  LendingBooks.
      ASSIGN LendingBooks.Loan_ID = loan_ID
             LendingBooks.Book_ID = ttBookID.Book_ID
             LendingBooks.LendingEndDate = ADD-INTERVAL(TODAY, lendPeriod, "days").
             
  END. //EACH ttBookID:
END PROCEDURE.



//RUN
DEFINE TEMP-TABLE inBookID NO-UNDO
FIELD Book_ID AS INT.

CREATE inBookID.
ASSIGN inBookID.Book_ID = 1.
CREATE inBookID.
ASSIGN inBookID.Book_ID = 2.
CREATE inBookID.
ASSIGN inBookID.Book_ID = 3.
RUN insertLending(INPUT 1, INPUT TABLE inBookID).

