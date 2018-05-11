        REAL FUNCTION MYEXP( X, NUM )
        IMPLICIT NONE
            REAL FACTORIAL, X
            INTEGER I, NUM

            MYEXP = 1.
            FACTORIAL=1.

            DO I = 1, NUM
                FACTORIAL=FACTORIAL*REAL(I)
                MYEXP = MYEXP + (X**I)/FACTORIAL
            END DO
        END FUNCTION


        PROGRAM TestDriver
        IMPLICIT NONE

        INTEGER ITMAX, NUM
        REAL MYEXP, X
        PARAMETER (ITMAX=100)

        PRINT *,' Please specify the value for X'
        READ*,X

        PRINT *,' Please specify the value for NUM'
        READ*,NUM


        IF (NUM.GT.ITMAX) THEN
          PRINT*, " NUM is bigger than ITMAX. (Error)"
          stop
        ENDIF

        PRINT *,'Welcome to the program -Test Driver / MYEXP-'
        PRINT*, ""
        PRINT*, MYEXP(X,NUM)

      END PROGRAM