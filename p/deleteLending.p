PROCEDURE deleteLending:
    DEFINE INPUT PARAMETER LoanID AS INT NO-UNDO.
    FOR EACH LendingBooks WHERE LendingBooks.Loan_ID = LoanID:
      DELETE LendingBooks.
    END.
    FIND FIRST Lendings WHERE Lendings.Loan_ID = LoanID.
      DELETE Lendings.  
END PROCEDURE.

//RUN
RUN deleteLending(12).
