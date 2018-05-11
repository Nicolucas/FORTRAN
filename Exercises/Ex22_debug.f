        REAL FUNCTION MYNORM( V, N )
        IMPLICIT NONE
            REAL V(*)
            INTEGER I, N

            MYNORM = 0.0
            DO I = 0, N
                MYNORM = MYNORM + V(I) * V(I)
            END DO
            MYNORM = SQRT(MYNORM)
        END FUNCTION


        PROGRAM TEST
            REAL V(4), MYNORM
            
            V(1) = 1.0
            V(2) = -1.0
            V(3) = 1.0
            V(4) = -1.0
            PRINT *,V
            PRINT *, MYNORM( V, 4 )
        END PROGRAM

