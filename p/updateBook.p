DEFINE TEMP-TABLE ttBooks NO-UNDO
    FIELD Book_ID AS INT
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD BookYear AS INT
    FIELD ItemsCount AS INT
    FIELD Location AS CHAR
    FIELD InventoryDate AS DATE.
  
PROCEDURE updateBook:
    DEFINE INPUT  PARAMETER TABLE FOR ttBooks.
    DEFINE OUTPUT PARAMETER updateSuccess AS LOGICAL NO-UNDO.
    
    FIND FIRST ttBooks NO-LOCK.
    IF AVAILABLE ttBooks THEN
    DO:
    FIND FIRST Books WHERE Books.Book_ID = ttBooks.Book_ID.
        Books.BookAuthor = ttBooks.BookAuthor.
        Books.BookTitle = ttBooks.BookTitle.
        Books.BookYear = ttBooks.BookYear.
        Books.ItemsCount = ttBooks.ItemsCount.
        Books.Location = ttBooks.Location.
        Books.InventoryDate = ttBooks.InventoryDate.
        
           updateSuccess = TRUE.
    END.
    ELSE DO:
           updateSuccess = FALSE. 
    END.
END PROCEDURE.


//    
DEFINE TEMP-TABLE updBook NO-UNDO
    FIELD Book_ID AS INT
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD BookYear AS INT
    FIELD ItemsCount AS INT
    FIELD Location AS CHAR
    FIELD InventoryDate AS DATE.
    
CREATE updBook.
    ASSIGN updBook.Book_ID = 9
       updBook.BookAuthor = "Urmas"
       updBook.BookTitle = "Muudetud Raamat"
       updBook.BookYear = 2020
       updBook.ItemsCount = 1
       updBook.Location = "ladu"
       updBook.InventoryDate = 03.03.2020. 

DEFINE VARIABLE updateSuccess AS LOGICAL NO-UNDO.
RUN updateBook(INPUT TABLE updBook, OUTPUT updateSuccess).
DISPLAY updateSuccess.
