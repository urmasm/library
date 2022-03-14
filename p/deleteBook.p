PROCEDURE deleteBook:
    DEFINE INPUT  PARAMETER BookID AS INT NO-UNDO.
    DEFINE OUTPUT PARAMETER delteSuccess AS LOGICAL NO-UNDO.
    
    FIND FIRST Books WHERE Book_ID = BookID.
    IF AVAILABLE Books THEN
    DO:
    DELETE Books.
    delteSuccess = TRUE.
    END.
    ELSE DO:
    delteSuccess = FALSE.
    END.
END PROCEDURE.


//RUN
DEFINE VARIABLE delteSuccess AS LOGICAL NO-UNDO.
RUN deleteBook(13 , OUTPUT delteSuccess).
DISPLAY delteSuccess.
