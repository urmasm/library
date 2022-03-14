 PROCEDURE overdueBooks:
 FOR EACH Users NO-LOCK,
 EACH Lendings OF Users NO-LOCK,
 EACH LendingBooks OF Lendings WHERE LendingBooks.ReturnedDate = ? AND INTERVAL(TODAY, LendingBooks.LendingEndDate, "days")>0 NO-LOCK,
 EACH Books OF LendingBooks NO-LOCK:
 DEFINE VARIABLE userFullName AS CHAR FORMAT "x(50)" NO-UNDO.
 ASSIGN userFullName = Users.FirstName + " " + Users.LastName.
 DISPLAY userFullName Books.BookTitle INTERVAL(TODAY, LendingBooks.LendingEndDate, "days"). 
 END.
 END PROCEDURE.
 
 //RUN
 RUN overdueBooks.
