DEFINE TEMP-TABLE ttBooks NO-UNDO
    FIELD Book_ID AS INT
    FIELD BookAuthor AS CHAR FORMAT "x(50)"
    FIELD BookTitle AS CHAR FORMAT "x(50)"
    FIELD BookYear AS INT
    FIELD ItemsCount AS INT
    FIELD Location AS CHAR
    FIELD InventoryDate AS DATE.
    
    
PROCEDURE findBook:
    DEFINE INPUT  PARAMETER bookTitle AS CHAR NO-UNDO.
    DEFINE OUTPUT PARAMETER TABLE FOR ttBooks.

    DEFINE VAR wcTitle AS CHAR.
    wcTitle = '*' + bookTitle + '*'.
    
FOR EACH Books WHERE Books.BookTitle MATCHES wcTitle NO-LOCK:
CREATE ttBooks.
ASSIGN ttBooks.Book_ID = Books.Book_ID
       ttBooks.BookAuthor = Books.BookAuthor
       ttBooks.BookTitle = Books.BookTitle
       ttBooks.BookYear = Books.BookYear
       ttBooks.ItemsCount = Books.ItemsCount
       ttBooks.Location = Books.Location
       ttBooks.InventoryDate = Books.InventoryDate.
END.

END PROCEDURE.



//run procedure. First parameter is (any part of) book title.
RUN findBook('s', OUTPUT TABLE ttBooks).
FOR EACH ttBooks:
    DISPLAY ttBooks WITH COLUMN 1.
END.
  

