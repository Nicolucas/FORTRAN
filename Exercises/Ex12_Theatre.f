        PROGRAM THEATR
        INTEGER ROW,COLUMN,NROWS,NCOLS
        LOGICAL SEATS
        DIMENSION SEATS(2,2)
        NCOLS=2
        NROWS=2
        
        DO 101 COLUMN=1,NCOLS
            DO 102 ROW=1,NROWS
                PRINT *,SEATS(ROW,COLUMN)
102         CONTINUE
101     CONTINUE

        END