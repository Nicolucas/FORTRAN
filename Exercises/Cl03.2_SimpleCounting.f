      PROGRAM SimpleCounting
        IMPLICIT NONE
        INTEGER I, Res
        DO 1 I=1,30,1
            Res=MODULO(I,3)
            IF (Res.EQ.0) THEN
                PRINT*,I
            ENDIF
1       CONTINUE
      END