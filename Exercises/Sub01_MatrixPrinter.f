      SUBROUTINE MATPRINT(A,N)
        IMPLICIT NONE
        INTEGER N
        DOUBLE PRECISION A(N,N), SUM
        CHARACTER*50,LINE

        DO 250,L = 1,N
            LINE=""
            DO 150,K = 1,N
                LINE=LINE // CHARACTER(K)    
    150         CONTINUE
            PRINT*,LINE
    250     CONTINUE
      END