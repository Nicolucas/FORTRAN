        PROGRAM THEATR
        INTEGER ROW,COLUMN,NROWS,NCOLS
        LOGICAL SEATS
        PARAMETER (NCOLS=2, NROWS=2)
        DIMENSION SEATS(NCOLS,NROWS)
        
        
        DO 101 COLUMN=1,NCOLS
            DO 102 ROW=1,NROWS
                PRINT *,SEATS(ROW,COLUMN)
102         CONTINUE
101     CONTINUE

        END