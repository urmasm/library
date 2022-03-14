DEFINE TEMP-TABLE ttBooks NO-UNDO
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD BookYear AS INT
    FIELD ItemsCount AS INT
    FIELD Location AS CHAR
    FIELD InventoryDate AS DATE.
  
PROCEDURE insertBook:
    DEFINE INPUT  PARAMETER TABLE FOR ttBooks.
    DEFINE OUTPUT PARAMETER insertSuccess AS LOGICAL NO-UNDO.
    DEFINE OUTPUT PARAMETER bookID AS INT NO-UNDO.
    
    FIND FIRST ttBooks NO-LOCK.
    IF AVAILABLE ttBooks THEN
    DO:
    CREATE Books.
    ASSIGN Books.BookAuthor = ttBooks.BookAuthor
           Books.BookTitle = ttBooks.BookTitle
           Books.BookYear = ttBooks.BookYear
           Books.ItemsCount = ttBooks.ItemsCount
           Books.Location = ttBooks.Location
           Books.InventoryDate = ttBooks.InventoryDate.
           insertSuccess = TRUE.
           bookID = CURRENT-VALUE(BookIDseq).
    END.
    ELSE DO:
           insertSuccess = FALSE. 
    END.
END PROCEDURE.


//RUN    
DEFINE TEMP-TABLE insBook NO-UNDO
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD BookYear AS INT
    FIELD ItemsCount AS INT
    FIELD Location AS CHAR
    FIELD InventoryDate AS DATE.
    
CREATE insBook.
    ASSIGN insBook.BookAuthor = "Urmas"
       insBook.BookTitle = "Raamat"
       insBook.BookYear = 2020
       insBook.ItemsCount = 1
       insBook.Location = "ladu"
       insBook.InventoryDate = 03.03.2020. 

DEFINE VARIABLE insertSuccess AS LOGICAL NO-UNDO.
DEFINE VARIABLE bookID AS INT NO-UNDO.
RUN insertBook(INPUT TABLE insBook, OUTPUT insertSuccess, OUTPUT bookID).
DISPLAY bookID.
