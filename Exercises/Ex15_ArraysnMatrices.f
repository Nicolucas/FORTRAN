        DOUBLE PRECISION ARREGLO(2,2), SUM
        SUM = 0.0D0
        DO 250,L = 1,2
            DO 150,K = 1,2
                PRINT*,SUM
                SUM = SUM + ARREGLO(K,L)
150         CONTINUE
            PRINT*,""
250     CONTINUE
        PRINT*,SUM


        PRINT*, ARREGLO
        END