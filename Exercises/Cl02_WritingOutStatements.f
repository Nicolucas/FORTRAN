      PROGRAM WritingOutStatements
        INTEGER NUMBR

        PRINT *,'Welcome to the program -Writing Out Statement-'
        PRINT *,'TYPE IN A NUMBER (INTEGER) BETWEEN 1 AND 3'
        READ *,NUMBR

        IF ( NUMBR .EQ. 1 ) THEN
            PRINT *, 'Picked Number 1'
        ELSE IF ( NUMBR .EQ. 2 ) THEN
            PRINT *, 'Picked Number 2'
        ELSE IF ( NUMBR .EQ. 3 ) THEN
            PRINT *, 'Picked Number 3'
        ELSE
            PRINT *, 'Error: Value outside of range'
        END IF

      END PROGRAM WritingOutStatements