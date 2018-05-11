      PROGRAM Checker
        Double Precision NUMBR
        INTEGER I
        PRINT *,'Welcome to the program -Writing Out Statement-'
        PRINT *,' ENTER THE NUMBER OF READINGS'
        READ*,N
        PRINT*,' ENTER THE ',N,' VALUES, ONE PER LINE'

        DO 1 I=1,N
            PRINT *,'TYPE IN A NUMBER'
            READ *,NUMBR
            print*,(NUMBR)
1       CONTINUE
      END PROGRAM Checker