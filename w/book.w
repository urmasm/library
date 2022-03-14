&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
/* Connected Databases 
          lbr              PROGRESS
*/
&Scoped-define WINDOW-NAME BookWin
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS BookWin 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME BookQuery

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES Books

/* Definitions for FRAME BookQuery                                      */
&Scoped-define FIELDS-IN-QUERY-BookQuery Books.BookAuthor Books.BookTitle ~
Books.BookYear Books.InventoryDate Books.ItemsCount Books.Location 
&Scoped-define ENABLED-FIELDS-IN-QUERY-BookQuery Books.BookAuthor ~
Books.BookTitle Books.BookYear Books.InventoryDate Books.ItemsCount ~
Books.Location 
&Scoped-define ENABLED-TABLES-IN-QUERY-BookQuery Books
&Scoped-define FIRST-ENABLED-TABLE-IN-QUERY-BookQuery Books
&Scoped-define QUERY-STRING-BookQuery FOR EACH Books SHARE-LOCK
&Scoped-define OPEN-QUERY-BookQuery OPEN QUERY BookQuery FOR EACH Books SHARE-LOCK.
&Scoped-define TABLES-IN-QUERY-BookQuery Books
&Scoped-define FIRST-TABLE-IN-QUERY-BookQuery Books


/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS Books.BookAuthor Books.BookTitle ~
Books.BookYear Books.InventoryDate Books.ItemsCount Books.Location 
&Scoped-define ENABLED-TABLES Books
&Scoped-define FIRST-ENABLED-TABLE Books
&Scoped-Define ENABLED-OBJECTS btnFirst btnPrev btnNext btnLast tbxFill 
&Scoped-Define DISPLAYED-FIELDS Books.BookAuthor Books.BookTitle ~
Books.BookYear Books.InventoryDate Books.ItemsCount Books.Location 
&Scoped-define DISPLAYED-TABLES Books
&Scoped-define FIRST-DISPLAYED-TABLE Books
&Scoped-Define DISPLAYED-OBJECTS tbxFill 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR BookWin AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON btnFirst 
     LABEL "|<" 
     SIZE 15 BY 1.14 TOOLTIP "Esimene".

DEFINE BUTTON btnLast 
     LABEL ">|" 
     SIZE 15 BY 1.14 TOOLTIP "Viimane".

DEFINE BUTTON btnNext 
     LABEL ">>" 
     SIZE 15 BY 1.14 TOOLTIP "Järgmine".

DEFINE BUTTON btnPrev 
     LABEL "<<" 
     SIZE 15 BY 1.14 TOOLTIP "Eelmine".

DEFINE VARIABLE tbxFill AS CHARACTER FORMAT "X(256)":U 
     LABEL "Fill 1" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY BookQuery FOR 
      Books SCROLLING.
&ANALYZE-RESUME

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME BookQuery
     btnFirst AT ROW 1.71 COL 3.5 WIDGET-ID 44
     btnPrev AT ROW 1.71 COL 26.33 WIDGET-ID 46
     btnNext AT ROW 1.71 COL 49.17 WIDGET-ID 42
     btnLast AT ROW 1.71 COL 72.17 WIDGET-ID 48
     Books.BookAuthor AT ROW 4.33 COL 7.5 WIDGET-ID 20
          VIEW-AS FILL-IN 
          SIZE 43.17 BY 1
     Books.BookTitle AT ROW 5.57 COL 6 WIDGET-ID 22
          VIEW-AS FILL-IN 
          SIZE 43 BY 1
     Books.BookYear AT ROW 6.81 COL 1.67 WIDGET-ID 24
          VIEW-AS FILL-IN 
          SIZE 6.33 BY 1
     tbxFill AT ROW 7.67 COL 48.5 COLON-ALIGNED WIDGET-ID 50
     Books.InventoryDate AT ROW 8.05 COL 1 WIDGET-ID 26
          VIEW-AS FILL-IN 
          SIZE 11 BY 1
     Books.ItemsCount AT ROW 9.29 COL 2.5 WIDGET-ID 28
          VIEW-AS FILL-IN 
          SIZE 4 BY 1
     Books.Location AT ROW 10.52 COL 5.17 WIDGET-ID 30
          VIEW-AS FILL-IN 
          SIZE 43.33 BY 1
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 90.33 BY 11.67 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW BookWin ASSIGN
         HIDDEN             = YES
         TITLE              = "Raamat"
         HEIGHT             = 11.57
         WIDTH              = 91.17
         MAX-HEIGHT         = 48.43
         MAX-WIDTH          = 320
         VIRTUAL-HEIGHT     = 48.43
         VIRTUAL-WIDTH      = 320
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         KEEP-FRAME-Z-ORDER = yes
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW BookWin
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME BookQuery
   FRAME-NAME                                                           */
/* SETTINGS FOR FILL-IN Books.BookAuthor IN FRAME BookQuery
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN Books.BookTitle IN FRAME BookQuery
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN Books.BookYear IN FRAME BookQuery
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN Books.InventoryDate IN FRAME BookQuery
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN Books.ItemsCount IN FRAME BookQuery
   ALIGN-L                                                              */
/* SETTINGS FOR FILL-IN Books.Location IN FRAME BookQuery
   ALIGN-L                                                              */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(BookWin)
THEN BookWin:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME BookQuery
/* Query rebuild information for FRAME BookQuery
     _TblList          = "lbr.Books"
     _Query            is OPENED
*/  /* FRAME BookQuery */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME BookWin
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BookWin BookWin
ON END-ERROR OF BookWin /* Raamat */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BookWin BookWin
ON WINDOW-CLOSE OF BookWin /* Raamat */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnFirst
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnFirst BookWin
ON CHOOSE OF btnFirst IN FRAME BookQuery /* |< */
DO:
       GET FIRST BookQuery.
  IF AVAILABLE Books THEN 
    DISPLAY Books.BookAuthor Books.BookTitle Books.BookYear Books.InventoryDate 
          Books.ItemsCount Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnLast
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnLast BookWin
ON CHOOSE OF btnLast IN FRAME BookQuery /* >| */
DO:
         GET LAST BookQuery.
  IF AVAILABLE Books THEN 
    DISPLAY Books.BookAuthor Books.BookTitle Books.BookYear Books.InventoryDate 
          Books.ItemsCount Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnNext
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnNext BookWin
ON CHOOSE OF btnNext IN FRAME BookQuery /* >> */
DO:
      GET NEXT BookQuery.
  IF AVAILABLE Books THEN 
    DISPLAY Books.BookAuthor Books.BookTitle Books.BookYear Books.InventoryDate 
          Books.ItemsCount Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME btnPrev
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL btnPrev BookWin
ON CHOOSE OF btnPrev IN FRAME BookQuery /* << */
DO:
        GET PREV BookQuery.
  IF AVAILABLE Books THEN 
    DISPLAY Books.BookAuthor Books.BookTitle Books.BookYear Books.InventoryDate 
          Books.ItemsCount Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK BookWin 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
ASSIGN CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
   RUN disable_UI.

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI BookWin  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(BookWin)
  THEN DELETE WIDGET BookWin.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI BookWin  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/

  {&OPEN-QUERY-BookQuery}
  GET FIRST BookQuery.
  DISPLAY tbxFill 
      WITH FRAME BookQuery IN WINDOW BookWin.
  IF AVAILABLE Books THEN 
    DISPLAY Books.BookAuthor Books.BookTitle Books.BookYear Books.InventoryDate 
          Books.ItemsCount Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
  ENABLE btnFirst btnPrev btnNext btnLast Books.BookAuthor Books.BookTitle 
         Books.BookYear tbxFill Books.InventoryDate Books.ItemsCount 
         Books.Location 
      WITH FRAME BookQuery IN WINDOW BookWin.
  {&OPEN-BROWSERS-IN-QUERY-BookQuery}
  VIEW BookWin.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

