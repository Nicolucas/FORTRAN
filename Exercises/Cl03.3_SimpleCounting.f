      PROGRAM SimpleCounting
        IMPLICIT NONE
        INTEGER I, Res, N

        PRINT *,' ENTER THE UPPER BOUND VALUE'
        READ*,N
        DO 1 I=1,N
            Res=MODULO(I,3)
            IF (Res.EQ.0) THEN
                PRINT*,I
            ENDIF
1       CONTINUE
      END